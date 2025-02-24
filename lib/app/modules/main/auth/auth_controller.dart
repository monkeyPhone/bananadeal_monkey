import 'dart:async';
import 'dart:io';
import 'package:app_links/app_links.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/fcm/func/fcm_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth/error/error_model.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth/noti_confirm.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/deep_link/controllers/deep_link_event_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/deep_link/controllers/deep_link_store_controller.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/common_widgets.dart';
import '../../../css/style.dart';
import '../../../models/auth_basic_api.dart';
import '../../../repository/etc/etc_info_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/const/const_info.dart';
import '../../deep_link/login_link_router_controller.dart';
import '../../deep_link/views/deep_link_view.dart';
import '../../error/server_error/server_error.dart';
import '../../error/server_error/server_error_controller.dart';
import '../../src/pages/widgets/service/service_model/chat_cache.dart';
import '../loading/loading_controller.dart';



class AuthController extends GetxController {
  static AuthController get to => Get.find();
  static final EtcInfoRepository _etcInfoRepository = const RegisterManager().getEtcInfoRepository();
  static final CommonWidgets commonWidgets = CommonWidgets();

  //TODO: 캐시 전용 (GET-Storage)

  final box = GetStorage();

  RxBool logStatus = false.obs;

  Future<bool> checkShowPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? lastHideTime = prefs.getInt('lastHideTime');

    if(lastHideTime != null){
      DateTime lastTime = DateTime.fromMillisecondsSinceEpoch(lastHideTime);
      DateTime now = DateTimeConfig().now;
      return now.difference(lastTime).inHours >= 24;
    } else {
      return true;
    }

  }

  void hidePage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTimeConfig().now;

    prefs.setInt('lastHideTime', now.microsecondsSinceEpoch);
  }

  //TODO: 캐시 전용 (GET-Storage) : 간단한 인증 종류 저장
  // String get
  String get isAuth => box.read('auth') ?? '';
  String get auth => isAuth == '' ? '' : isAuth;
  void changeAuth(String val) {
    box.write('auth', val);
  }

  //TODO: 캐시 전용 (GET-Storage) : 채팅 캐시

  void chatCacheModel (String name, ChatCache model){
    box.write(name, model.toJson());
    update();
  }

  ChatCache restoreModel(String name){
    final map = box.read(name);
    update();
    return ChatCache.fromJson(map);
  }

  void deleteChat(String name){
    box.remove(name);
    update();
  }

  //TODO: 캐시 전용 (GET-Storage) : 서버 오류 시 변경 페이지 관련 캐시

  String get isServer => box.read('server') ?? '';
  String get server => isServer == '' ? '' : isServer;

  Future<void> appAllClear() async{
    box.erase();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    if(tokken.value == ''){
      GetPlatform.isAndroid ? await SystemNavigator.pop() : exit(0);
    } else{
      tokken.value = '';
    }

  }

  void changeServer({required ErrorModel val}){
    box.write('server', errorModelToJson(val));
    update();
    Get.to(
            () => ServerError(), binding:
    BindingsBuilder(() {
      Get.put(ServerErrorController());
    }));
  }

  ErrorModel restoreServer(){
    final map = box.read('server');
    update();
    return errorModelFromJson(map);
  }

  void deleteServer() {
    box.remove('server');
    update();
  }


  //TODO: 캐시 전용 (GET-Storage) : 토큰 저장소

  String get isToken => box.read('token') ?? '';
  String get token => isToken == '' ? '' : isToken;

  String get isNewbie => box.read('newbie') ?? '';
  String get newbie => isNewbie == '' ? '' : isNewbie;
  
  void changeStatus(String val){
    box.write('newbie', val);
    update();
  }

  void changeToken(String val){
    box.write('token', val);
    tokken.value = token;
    update();
  }

  void deleteTokenSNS() {
    box.remove('token');
    tokken.value = '';
  }

  void deleteLogOut() {
    box.remove('token');
    deleteAuth();
    tokken.value = '4';
  }


  void deleteToken(bool how) {
    box.remove('token');
    deleteAuth();
    tokken.value = '3';
    how
      ? commonWidgets.customSnackbarTokenMessage()
      : commonWidgets.customSnackbarTokenMessageTwhice();

  }

  // void errorToken() {
  //   box.remove('token');
  //   deleteAuth();
  //   tokken.value = '5';
  //   CommonWidgets().customSnackbarTokenMessageError();
  // }

  void deleteAuth() {
    box.remove('auth');
  }

  void deleteFavorite(){
    box.remove('favorite');
  }



  //TODO: 캐시 전용 (GET-Storage) : 인증 관련 캐시들


  String get isJWT => box.read('jwt') ?? '';
  String get isKAKAO => box.read('kakao') ?? '';
  String get isEmail => box.read('email') ?? '';
  String get isDomain => box.read('domain') ?? '';
  String get isPW => box.read('pw') ?? '';


  String get jwt => isJWT == '' ? '' : isJWT;
  String get kakao => isKAKAO == '' ? '' : isKAKAO;
  String get email => isEmail == '' ? '' : isEmail;
  String get domain => isDomain == '' ? '' : isDomain;
  String get pw => isPW == '' ? '' : isPW;

  void changeJWT(String val) {
    box.write('jwt', val);
    changeToken(val);
    changeAuth('email');
  }
  void changeKAKAO(String val) {
    box.write('kakao', val);
    changeToken(val);
    changeAuth('kakao');
  }
  void changeAPPLE(String val) {
    box.write('apple', val);
    changeToken(val);
    changeAuth('apple');
  }
  void changeEmail(String val) {
    box.write('email', val);
  }
  void changeDomain(String val) {
    box.write('domain', val);
  }
  void changePW(String val) {
    box.write('pw', val);
  }

  void deleteAJWT(){
    box.remove('jwt');
    box.remove('email');
    box.remove('domain');
    box.remove('pw');
    box.remove('token');
  }

  Future<void> tokenDelete(bool how) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? mIdx = prefs.getInt('m_idx');
    AuthBagicApi api = await LoadingController.to.apiLoadings(
        future: _etcInfoRepository.logout(mIdx!, how),
        text: Style.logoutMent
    );
    if (api.status == 200) {
      await prefs.clear();
      how ? await FirebaseMessaging.instance.deleteToken() : null;
      deleteToken(how);
    }
  }

  //TODO: 인증관련 기능 : tokenEnd
  Future<void> tokenEnd(bool how) async{
    if(Get.isSnackbarOpen){
      Get.back();
      await tokenDelete(how);
    } else{
      await tokenDelete(how);
      }
  }
//TODO: 인증관련 기능 : 로그아웃
  Future<void> logout(String isWhere) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? mIdx = prefs.getInt('m_idx');
   if(Get.isSnackbarOpen){
     Get.back();
   } else{
     AuthBagicApi api = await LoadingController.to.apiLoadings(
       future: _etcInfoRepository.logout(mIdx!, true),
       text: Style.logoutMent,
     );
     if(api.status == 200){
       await prefs.clear();
       await FirebaseMessaging.instance.deleteToken();
       deleteLogOut();
     }
   }

  }

  //중복로그인
  Future<void> fcmLogout() async{
    if(Get.isSnackbarOpen){
      Get.back();
    } else{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      box.remove('token');
      tokken.value = '7';
    }

  }

  //TODO: 인증관련 기능 : 회원 탈퇴 => 여기 있는 이유는 컨트롤러 워커 적용을 더 안정적으로 하기 위해서...

  Future<void> userout() async{
    if(Get.isSnackbarOpen){
      Get.back();
    }else{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await FirebaseMessaging.instance.deleteToken();
      await prefs.clear();
      box.erase();
      tokken.value = '1';
      commonWidgets.customSnackbarQuitMessage();
    }
    // await SystemNavigator.pop();
  }

  void deleteJWT() {
    box.remove('jwt');
    deleteTokenSNS();
  }
  void deleteKAKAO() {
    box.remove('kakao');
    deleteTokenSNS();
  }
  void deleteAPPLE() {
    box.remove('apple');
    box.remove('token');
  }
  void deleteEmail() {
    box.remove('email');
    box.remove('token');
  }
  void deleteDomain() {
    box.remove('domain');
  }
  void deletePW() {
    box.remove('pw');
  }

  RxString decode = ''.obs;
  RxString tokken = ''.obs;
  RxString newTokken = ''.obs;
  RxString signEmail = ''.obs;
  RxString signPw = ''.obs;


  Future<void> notiConfirmUpdate({
    bool? isDelete,
    String? mpPush,
    String? mpDate,
  }) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch(isDelete){
      case null:
        final NotiConfirm confirm = await notiConfirmRead();
        await prefs.setString(
            InfoString.notiConfirm,
            notiConfirmToJson(
                NotiConfirm(
                    mpTitle: confirm.mpTitle,
                    mpContent: confirm.mpContent,
                    mpPush: mpPush ?? confirm.mpPush,
                    mpDate: mpDate ?? confirm.mpDate,
                )
            )
        );
      default :
        await prefs.remove(InfoString.notiConfirm);
    }
  }



  //TODO: 알림 동의 여부
  Future<NotiConfirm> notiConfirmRead() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString(InfoString.notiConfirm) == null) {
      await prefs.setString(
          InfoString.notiConfirm,
          notiConfirmToJson(
              NotiConfirm(
                  // spTitle: "'바나나딜'에서 알림을 보내고자 합니다.",
                  // spContent: '해당 기기로 중요 공지, 딜, 채팅 등 서비스 이용에 필요한 안내 사항을 보내드립니다.\n※ 미동의 시 필요한 정보를 받을 수 없습니다.\n\n앱 푸시에 수신 동의하시겠습니까?',
                  mpTitle: "'바나나딜'에서 광고성 정보 \n알림을 보내고자 합니다.",
                  mpContent: '해당 기기로 이벤트, 할인 혜택 등 안내 드립니다.\n※ 미동의 시 필요한 정보를 받을 수 없습니다.\n\n앱 푸시에 수신 동의하시겠습니까?',
                  mpPush: '',
                  // spPush: '',
                  mpDate: '',
                  // spDate: ''
              )
          )
      );
      final String? noti = prefs.getString(InfoString.notiConfirm);
      final NotiConfirm confirm = notiConfirmFromJson(noti!);
      return confirm;
    }
    else{
      final String? noti = prefs.getString(InfoString.notiConfirm);
      final NotiConfirm confirm = notiConfirmFromJson(noti!);
      return confirm;
    }
  }





  //TODO: 컨트롤러 워커

  @override
  void onInit() {
    super.onInit();
    statusCheck();


  }

  @override
  void onReady() {
    super.onReady();
    debounce(tokken, (_) {
      logStatus.value = true;
        Timer(const Duration(milliseconds: 300),
                () {
         token == ''
                    ? newbie == ''
                        ? Get.offAllNamed(Routes.SIGN1)
                        : Get.offAllNamed(Routes.SIGN2)
                    : Get.offAllNamed(Routes.SRC);
          Timer(const Duration(seconds: 3),
                  () {
            linkCheck();
          }
          );
        }
        );
    });
    debounce(logStatus, (_){
   if( logStatus.value) {
       Timer(const Duration(seconds: 1),
               () {
              logStatus.value = false;
           }
       );
     }

    });
  }


  RxBool updated = false.obs;


  void statusCheck() {
    Timer(Duration(milliseconds: 200),
         ()
        {
          Get.offAllNamed(Routes.SPLASH);
        }
    );
  }


  final RxString deepLink = ''.obs;

  StreamSubscription<Uri>? linkSubscription;

  String? lastProcessedLink;
  Timer? debounceTimer;

  void linkCheck() {
    final appLinks = AppLinks();

    linkSubscription = appLinks.uriLinkStream.listen((event) {
      final currentLink = event.toString();

      if (currentLink.isNotEmpty && currentLink != lastProcessedLink) {
        debounceTimer?.cancel(); // 기존 타이머 취소

        debounceTimer = Timer(Duration(seconds: 1), () { // 1초 디바운싱
          lastProcessedLink = currentLink;
          gotoLinkRouter(currentLink);
        });
      }
    });
  }

  // void linkCheck() {
  //   final appLinks = AppLinks();
  //
  //   linkSubscription = appLinks.uriLinkStream.listen(
  //           (event) {
  //         event.toString() != '' ? gotoLinkRouter(event.toString()) : null;
  //       });
  //
  // }

  void gotoLinkRouter(String link) {
     if(!logStatus.value && link.length > 19){
         // String log1 = link.substring(13,18);
         // String log2 = link.substring(19);
         // gotoDeeplinkView(log1, log2)
         token == '' || token.length < 5
             ? null
             : Get.put(LoginLinkRouterController(link));
     }
  }

  void gotoDeeplinkView(String log1, String log2){
    Get.to(
            () => DeepLinkRouter(
          type: log1,
          idx: log2,
        ), binding:
    BindingsBuilder(() {
      Get.put(DeepLinkStoreController());
      Get.put(DeepLinkEventController());
    }));
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    linkSubscription!.cancel();
    FcmRepository().close();
  }


}