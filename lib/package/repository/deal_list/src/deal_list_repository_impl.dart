import 'package:banana_deal_by_monkeycompany/package/api/deal_list/deal_list_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class DealListRepositoryImpl {
  final DealListApi api;
  final DioRepository dio;
  final int mIdx;
  const DealListRepositoryImpl({
    required this.api,
    required this.dio,
    required this.mIdx,
  });

  Stream<MyDealListVO> initDealList() => Stream.fromFuture(_initDealList());


  Stream<MyDealListVO> reloadDealList({
    required int page,
  }) => Stream.fromFuture(_reloadDealList(page: page));




  Future<MyDealListVO> _initDealList() async{
    final DataDto dto = await api.getDealList(dio: dio, mIdx: mIdx, page: 1);
    final List<MyDealListEntity> entity = convertMyDealListEntity(dto.data);
    final MyDealListVO result = MyDealListVO(
        statusEnum: dto.statusEnum, total: entity.first.totalPages, dealList: entity.first.list);
    return result;
  }


  Future<MyDealListVO> _reloadDealList({
    required int page,
  }) async{
    StatusEnum statusEnum = StatusEnum.initial;
    int total = 0;
    List<MyDealListDto> list = [];
    for(int i = 1; i <= page; i++){
      final DataDto dto = await api.getDealList(dio: dio, mIdx: mIdx, page: i);
      final List<MyDealListEntity> entity = convertMyDealListEntity(dto.data);
      statusEnum = dto.statusEnum;
      total = entity.first.totalPages;
      list.addAll(entity.first.list);
    }
    final MyDealListVO result = MyDealListVO(
        statusEnum: statusEnum, total: total, dealList: list);
    return result;
  }

}