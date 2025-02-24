import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class NaverMapAction {
  const NaverMapAction();

  final String _failDong = '마커를 이동시켜주세요.';
  final String _fail1 = '(예외.1) 위치 정보를 알 수 없습니다.';
  final String _fail2 = '(예외.2) 좌표 정보를 알 수 없습니다.';
  final String _fail3 = '(예외.3) 인식이 불가한 위치입니다.';
  final String _fail4 = '(예외.4) 상세 주소 검색을 할 수 없는 위치입니다.';

  Future<GpsVO> _setPosition() async{
    try{
      final Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings());
      return GpsVO(lat:position.latitude, lnt: position.longitude);
    } catch(_){
      return const GpsVO(lat: 37.5760222, lnt: 126.9769000);
    }
  }


  Future<(bool, AddressVO)> makePlace({
    required bool isIos,
    required GpsVO? coordinate
  }) async{
    final GpsVO gps = switch(coordinate){
      null => await _setPosition(),
      _ => coordinate
    };
    final (bool, AddressVO) result = await switch(isIos){
      true =>  _makePlaceIos(gps.lat, gps.lnt),
      false =>  _makePlaceAndroid(gps.lat, gps.lnt)
    };
    return result;
  }

  Future<(bool, AddressVO)> _makePlaceAndroid(double latitude, double longitude) async{
    String road;
    String dong;
    bool isSuccess;
    try{
      final List<Placemark> place = await placemarkFromCoordinates(latitude, longitude);
      if(place.isNotEmpty){
        final List str = place.firstWhere((element) => element.street!.isNotEmpty && element.street != '' && !element.street!.contains('KR')).street.toString().split(' ');
        str.removeAt(0);
        final String tr = str.join(" ");
        if(tr != '' )
        {
          ((String, String), bool) red = await _addressSearch(search:tr);
          road = red.$1.$1;
          dong = red.$1.$2;
          isSuccess = red.$2;
        }
        else{
          road = _fail1;
          dong = _failDong;
          isSuccess = false;
        }
      } else{
        road = _fail2;
        dong = _failDong;
        isSuccess = false;
      }
      return (isSuccess, AddressVO(address: road, dong: dong, coordinate: GpsVO(lat: latitude, lnt: longitude)));
    } catch(_){
      road = _fail3;
      dong = _failDong;
      isSuccess = false;
      return (isSuccess, AddressVO(address: road, dong: dong, coordinate: GpsVO(lat: latitude, lnt: longitude)));
    }
  }


  Future<(bool, AddressVO)> _makePlaceIos(double latitude, double longitude) async{
    String road;
    String dong;
    bool isSuccess;
    try{
      final List<Placemark> place = await placemarkFromCoordinates(latitude, longitude);
      if(place.isNotEmpty){
        final String tr = place.first.street!.isNotEmpty
            ? place.first.street.toString()
            : place.first.subLocality!.isNotEmpty && place.first.subLocality != '' && place.first.name!.isNotEmpty
            ? '${place.first.subLocality} ${place.first.name}'
            : '';
        if(tr != ''){
          print('it is address group:  => subLocality: ${place.first.subLocality} name: ${place.first.name} street: ${place.first.street}');
          print('it is address result:  =>  '+tr);
          ((String, String), bool) red = await _addressSearch(search: tr);
          road = red.$1.$1;
          dong = red.$1.$2;
          isSuccess = red.$2;
        }  else{
          road = _fail1;
          dong = _failDong;
          isSuccess = false;
        }
      } else{
        road = _fail2;
        dong = _failDong;
        isSuccess = false;
      }
      return (isSuccess, AddressVO(address: road, dong: dong, coordinate: GpsVO(lat: latitude, lnt: longitude)));
    } catch(_){
      road = _fail3;
      dong = _failDong;
      isSuccess = false;
      return (isSuccess, AddressVO(address: road, dong: dong, coordinate: GpsVO(lat: latitude, lnt: longitude)));
    }
  }


  Future<((String, String), bool)> _addressSearch({required String search}) async {
    const String confirmKey = 'U01TX0FVVEgyMDIyMTEwMTE2MTI0NzExMzE2OTA=';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);

    try {
      var response =
      await dio.get("https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do?confmKey=$confirmKey&resultType=json&currentPage=1&countPerPage=20&keyword=$search&firstSort=none"
      );
      String address = response.data.toString().replaceAll('(','').replaceAll(')', '');
      Map<String, dynamic> addressMap = jsonDecode(address);
      final AddressSearchEntity api = AddressSearchEntity.fromJson(addressMap);
      final ((String, String), bool) result = ((api.results.juso.first.roadAddr, api.results.juso.first.emdNm), true);
      return result;

    } catch (e) {
      final ((String, String), bool) result = ((_fail4, _failDong), false);
      return result;
    } finally {
      dio.close();
    }
  }

}