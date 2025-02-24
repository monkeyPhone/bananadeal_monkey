import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';

class SearchAddressAction {
  const SearchAddressAction();

  final String _where = 'AddressAction';

  Future<AddressSearchEntity> addressSearch({
    required String search, required int currentPage,
    required DioRepository dioRep
  }) async {
    const String confirmKey = 'U01TX0FVVEgyMDIyMTEwMTE2MTI0NzExMzE2OTA=';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);

    try {
      var response =
      await dio.get("https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do?confmKey=$confirmKey&resultType=json&currentPage=$currentPage&countPerPage=20&keyword=$search&firstSort=none"
      );
      String address = response.data.toString().replaceAll('(','').replaceAll(')', '');
      Map<String, dynamic> addressMap = jsonDecode(address);
      AddressSearchEntity result = AddressSearchEntity.fromJson(addressMap);
      return result;

    } catch (e) {
      await dioRep.sendErrorLog(url: '공공 주소 api', dto: _where, errorContent: '$e');

      return const AddressSearchEntity(
          results: AddressSearchDTO(
              common: Common(
                  errorMessage: '서버 에러', countPerPage: '', totalCount: '', errorCode: '', currentPage: ''
              ),
              juso: <Juso>[]
          )
      );
    } finally {
      dio.close();
    }
  }



  Future<(double, double)> makePlaceMarks(
      {required String address, required String address2, required String address3}) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      return (locations.first.latitude, locations.first.longitude);
    } catch (_) {
      return await _makePlaceMarks2(address: address2, sub: address3);
    }
  }

  Future<(double, double)> _makePlaceMarks2(
      {required String address, required String sub}) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      return (locations.first.latitude, locations.first.longitude);
    } catch (_) {
      // Get.back();
      return await _makePlaceMarks3(adress: sub);
    }
  }

  Future<(double, double)> _makePlaceMarks3({required String adress}) async {
    try {
      List<Location> locations = await locationFromAddress(adress);
      return (locations.first.latitude, locations.first.longitude);
    } catch (_) {
      return (0.0, 0.0);
    }
  }


}