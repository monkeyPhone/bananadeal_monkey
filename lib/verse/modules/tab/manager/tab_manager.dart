import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/naver_map_store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/notice_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list/model_list_repository.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan/plan_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/data/user_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/declaration/model/const/declaration_enum.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



abstract class TabManager {
  const TabManager();

  void gotoTermsView({
    required BuildContext context,
    required GestureTapCallback onTap,
  });

  void mapBottomSheet({
    required BuildContext context,
    required UserVO userVO,
    required void Function(AddressVO addressVO) addressCallback,
    required  void Function(int range) rangeCallback,
  });

  void gotoUploadView({
    required BuildContext context,
    required UploadEnum caseUpload,
    required void Function(String thumbNail) callBack,
    bool? isIntro
  });

  void gotoAddressView({
    required BuildContext context,
    required void Function(AddressVO addressVO) callBack,

  });

  void gotoNaverMapView({
    required void Function(AddressVO addressVO) callback,
    required BuildContext context,
    NaverMapStoreVO? info,
    GpsVO? currentNat,
  });


  void gotoRangeView({
    required BuildContext context,
    required (String mAddDong, String mAdd, int mSearchRange) address,
    required void Function(int range) callBack
  });


  void gotoFcmView(BuildContext context);


  void gotoBannerView({
    required BuildContext context,
    required HomeBannerVO banner
  });


  void gotoCreateDealView({
    required BuildContext context,
    required void Function() createCallback,
     bool? isIntro,
    (String psIdx, String ldcpName, String ldcpModel, String piPath)? selectModel,
  });



  void gotoModelListView({
    required BuildContext context,
    required String tkIdx,
  });


  void gotoModelListSearchView({
    required BuildContext context,
    required List<String> keyword,
    required String tkIdx,
    required ModelListRepository repository,
    required BuildContext routerContext,
    required BuildContext readContext,
  });


  void gotoModelListDetailView({
    required BuildContext context,
    required String psIdx,
    required String name,
    bool? isIntro,
  });



  void gotoRateListView({
    required BuildContext context,
    required String psIdx,
    required String tkIdx,
  });

  void gotoRateListSearchView({
    required BuildContext context,
    required  List<String> keyword,
    required BuildContext readContext,
    required BuildContext routerContext,
    required String tkIdx,
    required String psIdx,
    required PlanRepository repository
  });



  void gotoRankAllView({
    required BuildContext context,
    required void Function(RankVO rank) listClickCallback,
    required List<RankVO> rankAll,
    required List<RankVO> rankPremium,
    required List<RankVO> rankHigh,
    required List<RankVO> rankNormal,
    required List<RankVO> rankWorthy,
  });


void gotoStoreDetailView({
  required BuildContext context,
  required String smId,
  required String storeName,
  required int mIdx,
  required int favoriteStore,
  required bool isSearch,
  required bool isStore,
  bool? isIntro
});

  void gotoReviewView({
    required BuildContext context,
    required int mIdx,
    required String smId,
    required String storeName,
    required String point,
    required int cnt,
  });


  void gotoDeclarationPage({
    required BuildContext context,
    required DeclarationPlace routerPlace,
    required DeclarationType type,
    required String name,
    required (int, int, int, String) typeValue
  });


  Future<void> gotoChatLogView({
    required BuildContext context,
    required SharedPreferences prefs,
    required bool isChat,
    required int mIdx,
    required String smId,
    bool? isIntro
  });

  void gotoStoreSearchView({
    required BuildContext context,
  });

  void gotoEstimateView({
    required BuildContext context,
    required MyDealListVO myDeal
  });

  void gotoEstimateDetailView({
    required BuildContext context,
    required EstimateVO estimate,
    required bool isEstimateView,
    required bool isChatView
  });

  void gotoRateDetailDialog({
    required BuildContext context,
    required String pIdx,
    required String baseUrl
  });

  void gotoNoticeView({
    required BuildContext context,
  });

  void gotoNoticeDetailView({
    required BuildContext context,
    required NoticeVO noticeVO
  });

}