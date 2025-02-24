import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/noti_cache_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/fcm_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_list_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/helper/fcm_helper.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_noti.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:flutter/material.dart';

abstract class FcmRepository {
  const FcmRepository();

  Stream<NotiVO> didReceiveLocalNotificationStreams();

  void receiveMessage({
    required BuildContext context,
    required NotiVO message,
  });

  void showSnackBar({
    required BuildContext context,
    required String text, });

  Future<bool> checkPause();

  Future<(List<NotiEntity>, List<NotiEntity>)> getNotiDto();
  Future<void> saveNoti({required bool isDeal, required List<NotiEntity> value});

}

class FcmRepositoryImpl implements FcmRepository{
  final FcmHelper helper;
  final DioRepository dio;
  final BrowserSnackbar snackBar;
  final NotiCacheSingleton notiCache;

  const FcmRepositoryImpl({
    required this.helper,
    required this.dio,
    required this.snackBar,
    required this.notiCache
  });


  @override
  Stream<NotiVO> didReceiveLocalNotificationStreams()  => FcmSingleton.didReceiveLocalNotificationStream.stream;

  @override
  void receiveMessage({
    required BuildContext context,
    required NotiVO message,
  }) => helper.receiveMessage(message: message, context: context);


  @override
  Future<bool> checkPause() async{
    final DataDto result = await dio.getDto(repositoryName: 'fcmRepository', restApiEnum: RestApiEnum.user,
        endPoint: 'member/pause/check'
    );

    return result.statusEnum == StatusEnum.success;
  }

  @override
  void showSnackBar({
    required BuildContext context,
    required String text})
  => snackBar.showSnackBar(context: context, text: text);


  @override
  Future<(List<NotiEntity>, List<NotiEntity>)> getNotiDto() async {
    const String notiDealee = notiDeal;
    const String notiEtcee = notiEtc;
    NotiListDto notiDealDto = await helper.action.getNoti(notiDealee);
    NotiListDto notiEtcDto = await helper.action.getNoti(notiEtcee);

    return (notiDealDto.data, notiEtcDto.data);
  }

  @override
  Future<void> saveNoti(
      {required bool isDeal, required List<NotiEntity> value}) async {
    await notiCache.saveNoti(
        key: isDeal ? notiDeal : notiEtc,
        value: notiListDtoToJson(NotiListDto(data: value))
    );
  }


}