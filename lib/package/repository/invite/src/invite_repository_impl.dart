import 'package:banana_deal_by_monkeycompany/package/api/store/store_api.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/invite/invite_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';

class InviteRepositoryImpl implements InviteRepository {
  final StoreApi storeApi;
  final DioRepository dio;
  const InviteRepositoryImpl({
    required this.storeApi,
    required this.dio,
  });

  @override
  Stream<DataDto> streamStoreData({
    required int page,
    required String order,
    required String orderBy,
  }) => Stream.fromFuture(storeApi.fetchData(page: page, order: order, orderBy: orderBy, dio: dio));

  @override
  Future<DataDto> fetchStoreData({
    required int page,
    required String order,
    required String orderBy,
  }) async => await storeApi.fetchData(page: page, order: order, orderBy: orderBy, dio: dio);

  @override
  Future<DataDto> getStoreListLength() async => await storeApi.getStoreListLength(dio);
  
  
}