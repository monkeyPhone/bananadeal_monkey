import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/action/search_address_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/search_address_api.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';


class SearchAddressApiImpl implements SearchAddressApi {
  final SearchAddressAction action;
  const SearchAddressApiImpl({
    required this.action,
  });

  @override
  Future<AddressSearchEntity> addressSearch({
    required String search, required int currentPage, required DioRepository dio
  }) async => await action.addressSearch(search: search, currentPage: currentPage, dioRep: dio);

  @override
  Future<(double, double)> makePlaceMarks(
      {required String address, required String address2, required String address3}) async
  => await action.makePlaceMarks(address: address, address2: address2, address3: address3);

}