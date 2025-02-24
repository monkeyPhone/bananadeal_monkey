import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/search_address_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/address/address_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class AddressRepositoryImpl implements AddressRepository{
  final SearchAddressApi api;
  final DioRepository dio;
  const AddressRepositoryImpl({
    required this.api,
    required this.dio,
  });

  @override
  Stream<AddressSearchEntity> fetchAddress({required String search, required int currentPage}) =>
    Stream.fromFuture(api.addressSearch(search: search, currentPage: currentPage, dio: dio));
  
  @override
  Future<GpsVO> makePlaceMarks(
      {required String address, required String address2, required String address3}) async {
      final (double, double) coordinate = await api.makePlaceMarks(address: address, address2: address2, address3: address3);
      final GpsVO result = GpsVO(lat: coordinate.$1, lnt: coordinate.$2);
      return result;
  }
}