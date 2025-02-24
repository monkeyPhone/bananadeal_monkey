import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../components/common_widgets.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../models/etc/user_review.dart';
import '../../../../../../../repository/etc/bookmark_repository.dart';
import '../../../../../../../routes/error_handling.dart';
import '../../../../../../main/loading/loading_controller.dart';
import '../../../../../../naver_maps/pages/naver_marker_static/naver_marker_static_controller.dart';
import '../../../../../../naver_maps/pages/naver_marker_static/naver_marker_static_view.dart';
import '../../../../etc/controllers/etc_review_setting_controller.dart';
import '../../../../etc/views/components/etc_review_setting/etc_review_setting_view.dart';

class ChatWidgetController extends GetxController{
  static ChatWidgetController get to => Get.find();

  final BookmarkRepository _bookmarkRepository;
  final CommonWidgets _commonWidgets;

  ChatWidgetController({
    required BookmarkRepository bookmarkRepository,
    required CommonWidgets commonWidgets
  }) : _bookmarkRepository = bookmarkRepository,
       _commonWidgets = commonWidgets;

  RxBool detail = false.obs;

  void changeDetail(bool value){
   detail.value = value;
   update();
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if(await launchUrl(launchUri))
      {

      }else{
      _commonWidgets.customSnackbar('현재 휴대폰의 통신 상태를 확인해주세요');
    }

  }

  /*

  TODO: 안드로이드에서는 먹히는데 애플에서는 url launch공홈에 나와있는 거처럼 if-else를 거쳐가야 한다. try-catch는 안드로이드에서 오류가 생겨서 넣어준거다
       1순위는 네이버 맵, 2순위 카카오, 3순위 인앱 지도(네이버) 이다.

   */

  Future<void> launchNaverMap({required String name, required String road,  required double latitude, required double longtitude}) async {
    try {
      final encode = Uri.encodeFull(name);
      final url = 'nmap://place?lat=$latitude&lng=$longtitude&name=$encode';
      final uri = Uri.parse(url);
      if(await launchUrl(uri))
      {

      } else{
        await launchUrlKakao(name: name, road: road, latitude: latitude, longtitude: longtitude);
      }
    } catch(e){
      await launchUrlKakao(name: name, road: road, latitude: latitude, longtitude: longtitude);
    }
  }

  Future<void> launchUrlKakao({required String name, required String road, required double latitude, required double longtitude}) async {
    try{
      final url = 'kakaomap://look?p=$latitude,$longtitude';
      final uri = Uri.parse(url);
      if(await launchUrl(uri)){

      }else{
        gotoMap(name: name, road: road, latitude: latitude, longtitude: longtitude);
      }
    } catch(e){
      gotoMap(name: name, road: road, latitude: latitude, longtitude: longtitude);
    }
  }


  gotoMap({required String name, required String road, required double latitude, required double longtitude}){
    Get.to(
            () => NaverMarkerStaticView(
          name: name, road: road, latitude: latitude, longtitude: longtitude,), binding:
    BindingsBuilder(() {
      Get.put(NaverMarkerStaticController());
    }));
  }

  Future<void> getReviewList() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      UserReview api = await LoadingController.to.apiLoadings(
          future: _bookmarkRepository.getUserReviewList(),
          text: Style.dataMent
      );
      if (api.result.isNotEmpty) {
        Get.to(
                () => EtcReviewSettingView(), binding:
        BindingsBuilder(() {
          Get.put(EtcReviewSettingController(
              bookmarkRepository: _bookmarkRepository,
              commonWidgets: _commonWidgets
          ));
        }));
      }
      else {
        if(api.status == 200)
        {
          _commonWidgets.customSnackbar('일시적인 오류로 리뷰를 작성할 수 없어요.');
        }
        else{
          ErrorManager.errorCodeReturn(status: api.status, funcRoute: 'BookmarkRepository-getUserReviewList', error: 'Y', msg: api.msg, apiRoute: '${ApiConsole.bananaPrivateUrl}/review/list');
        }
      }
    }
  }



}