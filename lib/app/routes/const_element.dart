import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:get/get.dart';
import '../modules/main/loading/loading_controller.dart';
import '../modules/src/src_components/controllers/src_info_controller.dart';

class AppElement{

  static final AppElement instance = AppElement._internal();
  factory AppElement() => instance;
  AppElement._internal();

  static const String pay1 = '공시지원';
  static const String pay2 = '공시추가지원';
  static const String pay3 = '전환지원';
  static const String pay4 = '전환추가지원';

  static const String pageMoveFail = 'URL 주소가 만료되었습니다.';

  static const String promotion1 = '상관없음';
  static const String promotion2 = '해당없음';

  static const String unknownStore = '알 수 없음';

  static const String storeLastListMent = '마지막 목록입니다.';

  static const String storeAscending123 = 'ASC';
  static const String storeDescending321 = 'DESC';

  static const String storeDistance = 'distance';
  static const String storeAvgPoint = 'avg_point';
  static const String storeParticipation = 'send_deal';
  static const String storeFavorite = 'favorite_store';
  static const String storeRegDate = 'SM_regdate';

  static const String statusLoading = 'loading';
  static const String statusEmpty = 'empty';
  static const String statusSuccess = 'success';
  static const String  statusError = 'error';

  static const String permissionIos = 'permissionIos';

  static const String  guideIos1 = 'assets/images/guide/guideiosnoti.png';

  //image

  static const String dealSvg = 'assets/images/icons/svg/deal_info.svg';
  static const String storeSvg = 'assets/images/icons/svg/store_invite.svg';
  static const String bananaLogo = 'assets/images/icons/design/9.png';
  static const String bananaLogoSvg = 'assets/images/svg/logo.svg';
  static const String bananaLogoOri = 'assets/images/svg/logo.png';
  static const String bananaLaunch = 'assets/images/icons/launch/appicons.png';

  static const String iconCall = 'assets/images/icons/design/call.svg';
  static const String iconCopy = 'assets/images/icons/design/copy.svg';
  static const String iconMap = 'assets/images/icons/design/map.svg';
  static const String iconReview = 'assets/images/icons/design/review.svg';

  static const String iconStar = 'assets/images/icons/etc/star.svg';
  static const String iconStarN = 'assets/images/icons/etc/starN.svg';

  //character
  static const String splashString = 'assets/images/splash/splash1.png';
  static const String splashCharacter = 'assets/images/splash/splash2.png';

  static const String completeDeal = 'assets/images/character/completeDeal.png';
  static const String dealChange = 'assets/images/character/log/deal_change.png';
  static const String dealEnd = 'assets/images/character/log/deal_end.png';
  static const String dealParticipate = 'assets/images/character/log/deal_participate.png';
  static const String signCha = 'assets/images/character/sign.png';

  static const String iconBananaBrown = 'assets/images/icons/design/bananaicon.png';

  //deal
  static const String iconSvgSiren = 'assets/images/icons/deal/siren.svg';
  static const String iconTrashOff = 'assets/images/icons/app/btn_delete_off.svg';
  static const String iconBanana = 'assets/images/icons/deal/dealb1.svg';
  static const String iconBanana2 = 'assets/images/icons/deal/dealb2.svg';
  static const String stampStek = 'assets/images/icons/deal/stmap.png';

  static const String homeOff = 'assets/images/icons/navi/navi1_off.svg';
  static const String homeOn = 'assets/images/icons/navi/nav1.svg';
  static const String storeOff = 'assets/images/icons/navi/navi2_off.svg';
  static const String storeOn = 'assets/images/icons/navi/navi2.svg';
  static const String dealOn = 'assets/images/icons/navi/navi3.svg';
  static const String dealOff = 'assets/images/icons/navi/navi3_off.svg';
  static const String chatOff = 'assets/images/icons/navi/navi4_off.svg';
  static const String chatOn = 'assets/images/icons/navi/navi4.svg';
  static const String other = 'assets/images/icons/navi/navi5.svg';
  static const String otherOff = 'assets/images/icons/navi/navi5_off.svg';
  static const String apple = 'assets/images/icons/app/applesymbol.svg';
  static const String kakao = 'assets/images/icons/app/kakaosymbol.svg';


  static const String defaultImgIcon = 'assets/images/default/default_img_icon.svg';

  static const String onboardingDefault1 = 'assets/images/onboarding/onb1.jpg';
  static const String onboardingDefault2 = 'assets/images/onboarding/onb2.jpg';

  static const String defaultPhone = 'assets/images/default/defaultPhone.png';
  static const String defaultStore = 'assets/images/default/storethumbdefault.png';
  static const String defaultThumb = 'assets/images/default/defaultThumb.jpg';
  static const String defaultNotice = 'assets/images/default/defaultBanner.png';
  static const String defaultImg = 'assets/images/default/defaultImg.png';
  static const String defaultImgNo = 'assets/images/error/error.png';

  static const String serverWait = 'assets/images/error/wait.png';


  static const String buttonIcon = 'assets/images/icons/app/main_icon.png';
  static const String defaultList = 'assets/images/icons/app/defaultList.png';
  static const String defaultChaList = 'assets/images/character/listdefault.png';
  static const String phoneSun = 'assets/images/character/phone_sun.png';
  static const String checkImage = 'assets/images/icons/app/check.png';

  static const String goodImage = 'goodImage';

  static const String caseThumb = 'thumb';
  static const String caseDialog = 'dialog';
  static const String caseBanner = 'banner';
  static const String caseNotice = 'notice';
  static const String noticeDialog = 'noticeDialog';
  static const String caseHeight = 'height';
  static const String caseReview = 'review';
  static const String caseOther = 'other';

  static void get getLoaidng => LoadingController.to.isDialogOpen.value ? Get.back() : null;
  static void get getLoadings => LoadingController.to.isDialogOpen.value ? Get.back() : null;

  static double get defaultBottomPadding => GetPlatform.isAndroid || (GetPlatform.isIOS && SrcInfoController.to.infoM.value.mModel == 'iPhone SE (2nd generation)')
      ? WidgetSize(Get.context!).height60px+WidgetSize(Get.context!).sizedBox16 :WidgetSize(Get.context!).height60px;


}