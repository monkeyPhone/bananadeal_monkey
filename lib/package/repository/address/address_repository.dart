import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';


abstract class AddressRepository {
  const AddressRepository();

  Stream<AddressSearchEntity> fetchAddress({required String search, required int currentPage});
  Future<GpsVO> makePlaceMarks(
      {required String address, required String address2, required String address3});
}