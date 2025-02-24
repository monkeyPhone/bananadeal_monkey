import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';

class NaverMapStoreVO {
  final GpsVO coordinate;
  final NaverMapStoreInfoVO info;
  const NaverMapStoreVO({
    required this.coordinate,
    required this.info,
  });
}

class NaverMapStoreInfoVO {
  final String name;
  final String address;
  final String subAddress;
  const NaverMapStoreInfoVO({
    required this.name,
    required this.address,
    required this.subAddress,
  });
}
