import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class InviteRepository {
  const InviteRepository();

  Stream<DataDto> streamStoreData({
    required int page,
    required String order,
    required String orderBy,
  });

  Future<DataDto> fetchStoreData({
    required int page,
    required String order,
    required String orderBy,
  });

  Future<DataDto> getStoreListLength();


}

