import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class FcmEditAction{
  const FcmEditAction();

  final String _where = 'FcmEditAction';

  Future<StatusEnum> fetchFcmStatus({
    required DioRepository dio,
    required String spPush,
    required String appPush,
    required String gwanggoPush,
    required String chatPush,
    required String mpPush,
    required String mpEditDate,
    required String spEditDate
  }) async{
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'push/edit',
        form:  {
          "M_sp_push" : spPush,
          "M_app_push": appPush,
          "M_gwanggo_push": gwanggoPush,
          "M_chat_push": chatPush,
          "M_mp_push" : mpPush,
          "M_editdate_mp" :mpEditDate,
          "M_editdate_sp": spEditDate,
        }
    );
    return dto.statusEnum;
  }


}