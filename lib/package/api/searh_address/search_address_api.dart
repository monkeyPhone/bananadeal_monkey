import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

abstract class SearchAddressApi {
  const SearchAddressApi();

  Future<AddressSearchEntity> addressSearch({
    required String search, required int currentPage, required DioRepository dio
  });

  Future<(double, double)> makePlaceMarks(
      {required String address, required String address2, required String address3});

}