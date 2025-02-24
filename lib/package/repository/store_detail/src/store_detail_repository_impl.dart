import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/chat_connect_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal/deal_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/store_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_detail/store_detail_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/deal_info_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail/src/helper/store_detail_caculate.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail/store_detail_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class StoreDetailRepositoryImpl implements StoreDetailRepository {
  final DioRepository dio;
  final CommonFunction function;
  final StoreDetailCalculate calculate;
  final StoreDetailApi api;
  final StoreApi storeApi;
  final DealApi dealApi;
  final ChatConnectApi chatConnectApi;
  final int mIdx;
  final String smId;
  const StoreDetailRepositoryImpl({
    required this.dio,
    required this.function,
    required this.calculate,
    required this.api,
    required this.storeApi,
    required this.chatConnectApi,
    required this.dealApi,
    required this.mIdx,
    required this.smId,
  });

  @override
  Stream<DataDto> getData() => Stream.fromFuture(api.getStoreDetailDto(dio: dio, smId: smId, mIdx: mIdx));

  @override
  Future<bool> sendFavorite({
    required bool isFavorite,
  }) async => await storeApi.sendFavorite(dio: dio, isFavorite: isFavorite, mIdx: mIdx, smId: smId);

  @override
  List<String> calculateImage(StoreDetailVO result) => calculate.calculateImage(result);

  @override
  List<(String, String)> calculateEvent(StoreDetailVO result) => calculate.calculateEvent(result);

  @override
  (bool ,bool, String) calculateTime(StoreDetailVO result) => calculate.calculateTime(result: result, function: function);

  @override
  Stream<DealInfoDto> streamInitData() => Stream.fromFuture(dealApi.initData(dio: dio, mIdx: mIdx));

}