import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec_detail/model/func/phone_spec_detail_func.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mk_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mks_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';

class PhoneSpecDetailAction {
  const PhoneSpecDetailAction();

  Future<PhoneSpecDetailVO> initSpecDetail({
    required String psIdx,
    required String monkeyUrl,
    required PhoneSpecDetailFunc func,
    required DioRepository dioRep,
}) async{
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try{
      final PhoneSpecDetailEntity entity = await _getModelDetailData(psIdx: psIdx, dio: dio, monkeyUrl: monkeyUrl);
      final PsSpec html = PsSpec(
          design: func.convertHtml(entity.phoneSpecDetail.psSpecDesign),
          special: func.convertHtml(entity.phoneSpecDetail.psSpecSpecial),
          camera: func.convertHtml(entity.phoneSpecDetail.psSpecCamera)
      );
      String maker;
      if(entity.phoneSpecDetail.mkIdx != '4'){
        MkEntity mk = await _getModelDetailMkData(dio: dio, monkeyUrl: monkeyUrl);
        maker = mk.list.firstWhere((e) => e.mkIdx == entity.phoneSpecDetail.mkIdx).mkName;
      }
      else{
        MksEntity mks = await _getModelDetailMksData(dio: dio, mksIdx: entity.phoneSpecDetail.mksIdx, monkeyUrl: monkeyUrl);
        maker = mks.list.mksName != '' ? mks.list.mksName : '기타';
      }

      final StatusEnum statusEnum = entity.result == 'Y' ? StatusEnum.success : StatusEnum.error;

      final PhoneSpecDetailVO result = PhoneSpecDetailVO(
          statusEnum: statusEnum,
          entity: entity,
          spec: html,
          maker: maker
      );
      return result;
    } catch(e){
      await dioRep.sendErrorLog(url: 'MokeyDetail_LargeApi', dto: 'PhoneSpecDetailAction', errorContent: '$e');
      const PhoneSpecDetailVO resultE = PhoneSpecDetailVO(
          statusEnum: StatusEnum.exception,
          entity: ModelConfig.phoneSpecDetailEntity,
          spec: ModelConfig.psSpec,
          maker: ''
      );
      return resultE;
    } finally {
      dio.close();
    }
  }

  Future<PhoneSpecDetailEntity> _getModelDetailData({
    required String psIdx,
    required Dio dio,
    required String monkeyUrl
  }) async {
    final String apiRoute = '$monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeDetailData?ps_idx=$psIdx';

    var response = await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    PhoneSpecDetailEntity entity = PhoneSpecDetailEntity.fromJson(data);
    return entity;

  }

  Future<MkEntity> _getModelDetailMkData({
    required Dio dio,
    required String monkeyUrl
  }) async {
    final String apiRoute = '$monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeListPhoneMaker?showAllMaker=N';
    var response =
    await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    MkEntity entity = MkEntity.fromJson(data);

    return entity;
  }


  Future<MksEntity> _getModelDetailMksData({
    required Dio dio,
    required String mksIdx,
    required String monkeyUrl
  }) async {
    final String apiRoute = '$monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/makerSecondDetailData?mks_idx=$mksIdx';
    var response = await dio.get(apiRoute);
    Map<String, dynamic> data = jsonDecode(response.data);
    MksEntity entity = MksEntity.fromJson(data);
    return entity;

  }


}