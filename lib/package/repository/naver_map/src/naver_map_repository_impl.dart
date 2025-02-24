import 'package:banana_deal_by_monkeycompany/package/api/naver_map/naver_map_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/naver_map/naver_map_repository.dart';

class NaverMapRepositoryImpl implements NaverMapRepository{
  final NaverMapApi api;
  final bool isIos;
  const NaverMapRepositoryImpl({
    required this.api,
    required this.isIos
  });


  @override
  Stream <(bool, AddressVO)> makePlace({
    required GpsVO? coordinate
  }) => Stream.fromFuture(api.makePlace(isIos: isIos, coordinate: coordinate));

}