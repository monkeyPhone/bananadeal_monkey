import 'package:banana_deal_by_monkeycompany/package/data/broad/deal_info_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class DealAction {
  const DealAction();

  final String _rep = 'BroadDealAction';

  Future<DealInfoDto> initData({
    required DioRepository dio,
    required int mIdx,
  }) async{
    final int diIdx = await _checkDiIdx(mIdx: mIdx, dio: dio);
    final DataDto myDealDetail = await _fetchMyDealDetail(mIdx:mIdx, dio: dio);
    if(diIdx != 0){
      final DataDto estimate1 = await _getEstimateVO(diIdx: diIdx, order: 0, dio: dio,);
      final DataDto estimate2 = await _getEstimateVO(diIdx: diIdx, order: 1, dio: dio,);

      if(myDealDetail.statusEnum == StatusEnum.success && estimate1.statusEnum == StatusEnum.success && estimate2.statusEnum == StatusEnum.success){
        final DealInfoDto result =  DealInfoDto(
          statusEnum: StatusEnum.success,
          myDealDetail: myDealDetail.data,
          estimate1: estimate1.data,
          estimate2: estimate2.data,
        );
        return result;
      }
      else{
        const DealInfoDto failResult = DealInfoDto(
          statusEnum: StatusEnum.exception,
          myDealDetail: [],
          estimate1: [],
          estimate2: [],
        );
        return failResult;
      }


    }
    else{
       DealInfoDto noList = DealInfoDto(
        statusEnum: myDealDetail.statusEnum,
        myDealDetail: myDealDetail.data,
        estimate1: [],
        estimate2: [],
      );

      return noList;
    }
  }







  Future<DataDto> _fetchMyDealDetail({
    required int mIdx,
    required DioRepository dio,
  }) async{

    final DataDto myDeal = await dio.getDto(
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/byidx',
        repositoryName: _rep,
        limit: true,
        form: {
          "DI_reg_user_idx": "$mIdx",
        }

    );

    return myDeal;
  }


  Future<int> _checkDiIdx({
    required int mIdx,
    required DioRepository dio,
  }) async{

    final DataDto myDeal = await dio.getDto(
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/byidx',
        repositoryName: _rep,
        limit: true,
        form: {
          "DI_reg_user_idx": "$mIdx",
        }

    );

    final List<MyDealDetailVO> detail = convertMyDealDetailVO(myDeal.data);
    if(detail.isNotEmpty){
      final int result = detail.first.diIdx;
      return result;
    }
    else{
      return 0;
    }


  }


  Future<DataDto> _getEstimateVO({
    required DioRepository dio,
    required int diIdx,
    required int order,
  }) async{
    final DataDto dto = await dio.getDto(
        repositoryName: _rep,
        restApiEnum: RestApiEnum.user,
        endPoint: 'deal/estimate/list',
        form: {
          "DI_idx" : "$diIdx",
          "start" : 0,
          "M_order": order,
          'length' : 5
        }
    );

    return dto;
  }

}