import 'package:banana_deal_by_monkeycompany/package/api/naver_map/model/action/naver_map_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/naver_map/naver_map_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';

class NaverMapApiImpl implements NaverMapApi{
  final NaverMapAction action;
  const NaverMapApiImpl({
    required this.action,
  });


  @override
  Future <(bool, AddressVO)> makePlace({
    required GpsVO? coordinate,
    required bool isIos
  }) async => await action.makePlace(isIos: isIos, coordinate: coordinate,);

}