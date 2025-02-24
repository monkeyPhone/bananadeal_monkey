import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/naver_map_store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/notice_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list/model_list_repository.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan/plan_repository.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/tab_chat/tab_chat_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/data/user_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/manager/tab_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/view/address_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/banner/view/banner_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/view/chat_log_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/create_deal_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/declaration/model/const/declaration_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/view/estimate_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/estimate_detail_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/view/fcm_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/view/model_list_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/view/model_list_detail_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_search/view/model_list_search_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/view/naver_map_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/notice/view/notice_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/notice_detail/view/notice_detail_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/range/view/range_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/view/rank_all_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/manager/helper/dialog/rate_detail_dialog_ui.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/view/rate_list_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list_search/view/rate_list_search_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/store_detail_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail_review/view/store_detail_review_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/view/store_search_view..dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/terms/view/terms_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/view/upload_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabManagerImpl implements TabManager {
  final BrowserSnackbar snackbar;
  final bool isIos;
  final TabChatRepository tabChatRepository;
  const TabManagerImpl({
    required this.snackbar,
    required this.isIos,
    required this.tabChatRepository,
  });

  Future<bool> _checkImage() async{
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      filterOption: FilterOptionGroup(
        imageOption: const FilterOption(
          sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
        ),
        orders: [
          const OrderOption(type: OrderOptionType.createDate, asc: false),
        ],
      ),
    );
    bool next;
    if(albums.isNotEmpty){
      List<AssetEntity> photos = [];
      var photoData = await albums.first.getAssetListPaged(page: 0, size: 30);
      photos.addAll(photoData);
      bool condition = photos.isEmpty;
      next = !condition;
    } else {
      next = false;
    }
    return next;
  }

  void _createRoute({
    required BuildContext context,
    required Widget routerWidget,
    bool? isIntro,
    WidgetDirectionEnum? direction,
    bool? connectCheck,
    int? iosCheck,
    // EventEnum? eventEnum,

  }) => context.read<VerseConfig>().route.createRoute(
      context: context,
      routerWidget: routerWidget,
      direction: direction,
      connectCheck: connectCheck,
      iosCheck: iosCheck,
      isIntro: isIntro
  );

  @override
  void mapBottomSheet({
    required BuildContext context,
    required UserVO userVO,
    required void Function(AddressVO addressVO) addressCallback,
    required  void Function(int range) rangeCallback,
  }) {
    final BottomSheetVO mapButton = BottomSheetVO(
        buttonName: '지도에서 위치 변경',
        onTap: () {
           context.read<VerseConfig>().tab.gotoNaverMapView(context: context, callback: addressCallback);
        }
    );
    final BottomSheetVO searchButton = BottomSheetVO(
        buttonName: '검색으로 위치 변경',
        onTap: (){
          context.read<VerseConfig>().tab.gotoAddressView(context: context, callBack: addressCallback);
        }
    );
    final BottomSheetVO rangeButton = BottomSheetVO(
        buttonName: '매장검색 범위 설정',
        onTap: (){
          context.read<VerseConfig>().tab.gotoRangeView(
              context: context,
              callBack: rangeCallback,
              address: (userVO.mAddDong, userVO.mAdd, userVO.mSearchRange)
          );
        }
    );
    final List<BottomSheetVO> sheetList = kIsWeb
        ? [searchButton, rangeButton]
        : [mapButton, searchButton, rangeButton];

    context.read<VerseConfig>().browser.sheet.showSheet(
        routerContext: context,
        sheetList: sheetList
    );
  }

  @override
  void gotoTermsView({
    required BuildContext context,
    required GestureTapCallback onTap,
  }) =>
      _createRoute(
          context: context,
          connectCheck: true,
          routerWidget: TermsProvider(
              onTap: onTap)
      );

  @override
  void gotoUploadView({
    required BuildContext context,
    required UploadEnum caseUpload,
    required void Function(String thumbNail) callBack,
    bool? isIntro
  }) => _checkImage().then(
          (value) => context.mounted
          ? switch(value){
        true =>  _createRoute(
          context: context,
          isIntro: isIntro,
          direction:  WidgetDirectionEnum.left,
          connectCheck: true,
          iosCheck: isIos ? 1 : null,
          routerWidget: UploadView(callBack: callBack, caseUpload: caseUpload,),
        ),
        false => snackbar.showSnackBar(text: '앨범에 이미지가 없습니다', context: context,)
      } : null
  );


  @override
  void gotoAddressView({
    required BuildContext context,
    required void Function(AddressVO addressVO) callBack,

  }) => _createRoute(
    context: context,
    connectCheck: true,
    isIntro: true,
    routerWidget: AddressView(
        callBack: callBack
    ),
  );

  GpsVO _setPosition(BuildContext context) {
    try{
      final double lat = context.read<VerseConfig>().cache.mainCache.prefs.getDouble(myLat) ?? 37.5760222;
      final double lnt = context.read<VerseConfig>().cache.mainCache.prefs.getDouble(myLnt) ?? 126.9769000;
      return GpsVO(lat: lat, lnt: lnt);
    } catch(_){
      return const GpsVO(lat: 37.5760222, lnt: 126.9769000);
    }
  }

  @override
  void gotoNaverMapView({
    required void Function(AddressVO addressVO) callback,
    required BuildContext context,
    NaverMapStoreVO? info,
    GpsVO? currentNat,
  }) {

    GpsVO? c = info != null ? null :  currentNat ?? _setPosition(context);
  if(context.mounted){
    _createRoute(
        context: context,
        connectCheck: true,
        iosCheck: 0,
        isIntro: true,
        routerWidget: NaverMapView(callback: callback, info: info, currentNat: c,)
    );
  }
  }


  @override
  void gotoRangeView({
    required BuildContext context,
    required (String mAddDong, String mAdd, int mSearchRange) address,
    required void Function(int range) callBack
  }) => _createRoute(
    context: context,
    connectCheck: true,
    isIntro: true,
    routerWidget: RangeView(address: address, callBack: callBack,),
  );


  @override
  void gotoFcmView(BuildContext context) => _createRoute(
    context: context,
    connectCheck: true,
    iosCheck: 3,
    routerWidget: FcmView(routerContext: context,),
  );


  @override
  void gotoBannerView({
    required BuildContext context,
    required HomeBannerVO banner
  }) => _createRoute(
      context: context,
      connectCheck: true,
      routerWidget: BannerView(
        bannerVO: banner,
      )
  );


  @override
  void gotoCreateDealView({
    required BuildContext context,
    required void Function() createCallback,
    bool? isIntro,
    (String psIdx, String ldcpName, String ldcpModel, String piPath)? selectModel,
  }) => _createRoute(
      isIntro: isIntro,
      context: context,
      connectCheck: true,
      routerWidget: CreateDealView(
          mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
          createCallback: createCallback,
          selectModel: selectModel
        // (1088, "갤럭시 A15 LTE", "SM-A155N", "http://imsi.monkeyphone.co.kr/UPLOAD/PHONE/20240215_111017_Dw90daIU_1.png"),
      )
  );



  @override
  void gotoModelListView({
    required BuildContext context,
    required String tkIdx,
  }) =>
      _createRoute(
        context: context,
        connectCheck: true,
        routerWidget: ModelListView(
          tkIdx: tkIdx,
          routerContext: context,
        ),
      );


  @override
  void gotoModelListSearchView({
    required BuildContext context,
    required List<String> keyword,
    required String tkIdx,
    required ModelListRepository repository,
    required BuildContext routerContext,
    required BuildContext readContext,
  }) => _createRoute(
    context: readContext,
    connectCheck: true,
    routerWidget: ModelListSearchView(
      repository: repository,
      info: (tkIdx, keyword),
      routerContext: routerContext,
      readContext: readContext,
    ),
  );


  @override
  void gotoModelListDetailView({
    required BuildContext context,
    required String psIdx,
    required String name,
    bool? isIntro,
  }) =>
      _createRoute(
        isIntro: isIntro,
        context: context,
        connectCheck: true,
        routerWidget: ModelListDetailView(
          psIdx: psIdx,
          name: name,
        ),
      );



  @override
  void gotoRateListView({
    required BuildContext context,
    required String psIdx,
    required String tkIdx,
  }) =>
      _createRoute(
        context: context,
        connectCheck: true,
        routerWidget: RateListView(
          routerContext: context,
          psIdx: psIdx,
          tkIdx: tkIdx,
        ),
      );

  @override
  void gotoRateListSearchView({
    required BuildContext context,
    required  List<String> keyword,
    required BuildContext readContext,
    required BuildContext routerContext,
    required String tkIdx,
    required String psIdx,
    required PlanRepository repository,

  }) => _createRoute(
    context: readContext,
    connectCheck: true,
    routerWidget: RateListSearchView(
      info: (tkIdx, keyword, psIdx),
      routerContext: routerContext,
      readContext: readContext,
      repository: repository,

    ),
  );



  @override
  void gotoRankAllView({
    required BuildContext context,
    required void Function(RankVO rank) listClickCallback,
    required List<RankVO> rankAll,
    required List<RankVO> rankPremium,
    required List<RankVO> rankHigh,
    required List<RankVO> rankNormal,
    required List<RankVO> rankWorthy,
  }) => _createRoute(
      context: context,
      connectCheck: true,
      routerWidget: RankAllView(
        listClickCallback: listClickCallback,
        rankAll: rankAll,
          rankPremium: rankPremium,
          rankHigh:rankHigh,
          rankNormal:rankNormal,
          rankWorthy: rankWorthy
      )

  );


  @override
  void gotoStoreDetailView({
    required BuildContext context,
    required String smId,
    required String storeName,
    required int mIdx,
    required int favoriteStore,
    required bool isSearch,
    required bool isStore,
    bool? isIntro
  }) => _createRoute(
    isIntro: isIntro,
    context: context,
    connectCheck: true,
    routerWidget: StoreDetailView(
      routerContext: context,
      smId: smId,
      isSearch: isSearch,
      isStore: isStore,
      storeName: storeName,
      mIdx: mIdx,
      isBookmark: favoriteStore == 0,
    ),
  );

  @override
  void gotoReviewView({
    required BuildContext context,
    required int mIdx,
    required String smId,
    required String storeName,
    required String point,
    required int cnt,
  }) =>  _createRoute(
      context: context,
      connectCheck: true,
      isIntro: true,
      routerWidget: StoreDetailReviewView(
        mIdx: mIdx,
        storeName: storeName,
        smId: smId,
        point: point,
        cnt: cnt,
      )
  );


  @override
  void gotoDeclarationPage({
    required BuildContext context,
    required DeclarationPlace routerPlace,
    required DeclarationType type,
    required String name,
    required (int, int, int, String) typeValue
  }) {}


  Future<(bool, ChatRoomVO)> _getChatRoomByIdx({required int mIdx, required String smId, required BuildContext context}) async{
    context.read<VerseConfig>().browser.dialog.loadingDialog(context);
    final (bool, ChatRoomVO) result = await tabChatRepository.getChatRoomByIdx(mIdx: mIdx, smId: smId);
    if(context.mounted){
      context.read<VerseConfig>().route.closeDialog(context);
    }
    return result;
  }

  @override
  Future<void> gotoChatLogView({
    required BuildContext context,
    required SharedPreferences prefs,
    required bool isChat,
    required int mIdx,
    required String smId,
    bool? isIntro
  }) async{
    final (bool, ChatRoomVO) resultCheck = await _getChatRoomByIdx(mIdx: mIdx, smId: smId, context: context);
    if(resultCheck.$1){
      if(context.mounted){
        bool result =  await tabChatRepository.logTry(
            room: resultCheck.$2
        );
        if(context.mounted){
          if(result){
            List<ChatLogDto> dto = [];
            final String? chat = prefs.getString('${resultCheck.$2.crIdx}');
            if(chat != null){
              ChatLogEntity entity = chatLogEntityFromJson(chat);
              dto.addAll(entity.data);
            }
            bool isUsed = resultCheck.$2.crStatus == 'NORMAL';
            _createRoute(
                isIntro: isIntro,
                context: context,
                routerWidget: ChatLogView(
                    isChat: isChat,
                    room: resultCheck.$2,
                    isUsed: isUsed,
                    routerContext: context,
                    dto: dto
                )
            );
          }
          else{
            snackbar.showSnackBar(
                context: context, text: '채팅방의 정보를 불러올 수 없습니다. 잠시 후, 다시 시도해주세요.'
            );
          }
        }

      }
      } else{
      if(context.mounted){
        snackbar.showSnackBar(
            context: context, text: '채팅방의 정보를 불러올 수 없습니다. 잠시 후, 다시 시도해주세요.'
        );
      }
    }
    }

  @override
  void gotoStoreSearchView({
    required BuildContext context,
  }){
    _createRoute(
        context: context,
        connectCheck: true,
        routerWidget: StoreSearchView(routerContext: context,)
    );
  }

  @override
  void gotoEstimateView({
    required BuildContext context,
    required MyDealListVO myDeal
  }) => _createRoute(
      context: context,
      connectCheck: true,
      routerWidget: EstimateView(myDeal: myDeal, routerContext: context,)
  );

  @override
  void gotoEstimateDetailView({
    required BuildContext context,
    required EstimateVO estimate,
    required bool isEstimateView,
    required bool isChatView
  }) => _createRoute(
      context: context,
      connectCheck: true,
      routerWidget: EstimateDetailView(
        isEstimateView: isEstimateView,
        isChatView: isChatView,
        estimate: estimate,
        routerContext: context,
      )
  );

  @override
  void gotoRateDetailDialog({
    required BuildContext context,
    required String pIdx,
    required String baseUrl
  }) async{
    await Future.delayed(Duration.zero, (){
      if(context.mounted){
        showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                RateDetailDialogUi(pIdx: pIdx, baseUrl: baseUrl,)
        );
      }
    });
  }

  @override
  void gotoNoticeView({
    required BuildContext context,
  }) => _createRoute(
      context: context,
      connectCheck: true,
      routerWidget: const NoticeView()
  );

  @override
  void gotoNoticeDetailView({
    required BuildContext context,
    required NoticeVO noticeVO
  }) => _createRoute(
      context: context,
      connectCheck: true,
      routerWidget: NoticeDetailView(noticeVO: noticeVO)
  );

}