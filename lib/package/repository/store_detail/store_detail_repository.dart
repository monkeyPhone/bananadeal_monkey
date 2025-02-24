import 'package:banana_deal_by_monkeycompany/package/data/broad/deal_info_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';

abstract class StoreDetailRepository {
  const StoreDetailRepository();

  Stream<DataDto> getData();

  Future<bool> sendFavorite({
    required bool isFavorite,
  });

  List<String> calculateImage(StoreDetailVO result);

  List<(String, String)> calculateEvent(StoreDetailVO result);

  (bool ,bool, String) calculateTime(StoreDetailVO result);

  Stream<DealInfoDto> streamInitData();

}