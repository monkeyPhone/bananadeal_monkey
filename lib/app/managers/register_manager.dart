import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/app_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/bdbot/bd_bot_nav_rapository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/change_map/change_map_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/chat/chat_service_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/deal_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/make_deal_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/phone_spec_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/rate_plan_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/estimate/estimate_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/bookmark_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_etc_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_event_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_info_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/sign/sign_5_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/src/src_banner_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/src/src_deal_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/src/src_info_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/src/src_rank_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/store/store_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';

class RegisterManager {
  const RegisterManager();

  ApiConsole getApiConsole() => ApiConsole();

  DioServiceManager getDsm() => DioServiceManager(options: getApiConsole().options);

  AppReopsitory getAppRepository() =>
      AppReopsitory(dsm:getDsm(), bananaOpenUrl: ApiConsole.bananaOpenUrl);

  Repo5 getRepo5() => Repo5(
      bananaOpenUrl: ApiConsole.bananaOpenUrl,
      kakao: ApiConsole.bananaKakaoLogin,
      apple: ApiConsole.bananaAppleLogin,
      apiConsole: getApiConsole(),
      appRepository: getAppRepository()
  );

  SrcBannerRepository getSrcBannerRepository() =>
      SrcBannerRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  SrcDealRepository getSrcDealRepository() =>
      SrcDealRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  SrcInfoRepository getSrcInfoRepository() =>
      SrcInfoRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  SrcEstimateRepository getSrcEstimateRepository() =>
      SrcEstimateRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  SrcRankRepository getSrcRankRepository() =>
      SrcRankRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  StoreRepository getStoreRepository() =>
      StoreRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  BdBotNavRepository getBdBotNavRepository() =>
      BdBotNavRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  ChangeMapRepository getChangeMapRepository() =>
      ChangeMapRepository(apiConsole: getApiConsole(), appRepository: getAppRepository(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  ChatServiceRepository getChatServiceRepository() =>
      ChatServiceRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl,
        bananaChat: ApiConsole.chatServerImage, bananaChatServer: ApiConsole.chatServer2, );

  MakeDealRepository getMakeDealRepository() =>
      MakeDealRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl,);

  RatePlanRepository getRatePlanRepository() =>
      RatePlanRepository(appRepository: getAppRepository(), monkeyUrl: ApiConsole.monkeyUrl, apiConsole: getApiConsole());

  DealRepository getDealRepository() =>
      DealRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  PhoneSpecRepository getPhoneSpecRepository() =>
      PhoneSpecRepository(appRepository: getAppRepository(), monkeyUrl: ApiConsole.monkeyUrl, apiConsole: getApiConsole());

  BookmarkRepository getBookmarkRepository() =>
      BookmarkRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  EtcEtcRepository getEtcEtcRepository() =>
      EtcEtcRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl, bananaGuest: ApiConsole.bananaOpenUrl);

  EtcEventRepository getEtcEventRepository() =>
      EtcEventRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl);

  EtcInfoRepository getEtcInfoRepository() =>
      EtcInfoRepository(dsm: getDsm(), bananaPrivateUrl: ApiConsole.bananaPrivateUrl, bananaOpenUrl: ApiConsole.bananaOpenUrl);

}