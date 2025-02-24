import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deeplink/guest_event_detail.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/app_repository.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../components/common_widgets.dart';
import '../../../routes/api_url.dart';

class DeepLinkEventController extends GetxController{

  final AppReopsitory _appRepository = const RegisterManager().getAppRepository();
  final CommonWidgets _commonWidgets = CommonWidgets();

  Rx<GuestEventDetail> event = GuestEventDetail(status: 0, msg: '', result: <GuestEventDetailList>[]).obs;
  Rx<GuestEventDetailList> eventDetail = GuestEventDetailList(
      beIdx: 0, beType: '', beTitle: '', beContent: '',
      beUrl: '', bePeriodStart: DateTime(0), bePeriodEnd: DateTime(0),
      beNotice: '', bePathImg1: '', bePathImg2: '', bePathImg3: '', beResult: '', beRegdate: DateTime(0)).obs;

  Future<GuestEventDetail> getEventDetail({required int eventIdx}) async{
    final GuestEventDetail api = await _appRepository.getEventDetail(eventIdx);

    if(api.status == 200 && api.result.isNotEmpty)
    {
      eventDetail.value = api.result.first;
      return api;
    }
    else{
      event.value = GuestEventDetail(status: 0, msg: '', result: <GuestEventDetailList>[]);
      Get.back();
      _commonWidgets.customSnackbar('잘못된 접근입니다.');
      return GuestEventDetail(status: 0, msg: '', result: <GuestEventDetailList>[]);
    }
  }

  Future<void> shareEvent(int idx) async{
    String message = "EVENT/${idx}";
    String encode = base64.encode(utf8.encode(message));
    String url = '${ApiConsole.shareMode}/$encode';
    await Share.share("바나나딜에서 진행중인 이벤트에요! 바나나딜 앱에서 확인해보세요.\n$url");

  }

}