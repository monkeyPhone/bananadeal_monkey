import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';

abstract class NaverMapApi {
  const NaverMapApi();

  Future <(bool, AddressVO)> makePlace({
    required GpsVO? coordinate,
    required bool isIos
  });

}