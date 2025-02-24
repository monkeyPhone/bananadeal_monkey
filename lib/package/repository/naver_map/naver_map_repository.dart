import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';

abstract class NaverMapRepository {
  const NaverMapRepository();

  Stream <(bool, AddressVO)> makePlace({
    required GpsVO? coordinate
  });

}