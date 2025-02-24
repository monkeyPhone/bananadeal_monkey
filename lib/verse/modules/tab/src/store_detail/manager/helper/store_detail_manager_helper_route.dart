import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/naver_map_store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/json_bool.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_review_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/manager/store_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/declaration/model/const/declaration_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/manager/store_search_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/state/bloc/banana_store_search_option/banana_store_search_option_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailManagerHelperRoute {
  final BuildContext routerContext;
  final String smId;
  final String storeName;
  final int mIdx;
  final bool isBookmark;
  final bool isStore;
  final bool isSearch;
  const StoreDetailManagerHelperRoute({
    required this.routerContext,
    required this.smId,
    required this.storeName,
    required this.mIdx,
    required this.isBookmark,
    required this.isStore,
    required this.isSearch,
  });

  void closePage(BuildContext context) {
    context.read<VerseConfig>().route.closePage(context);
    // log('${(isBookmark == !context.read<BananaStoreDetailInfoBloc>().state.isBookmark) == false}');
    if((isBookmark == !context.read<BananaStoreDetailBloc>().state.isBookmark) == false && isStore){
      routerContext.read<StoreManager>().updateAllShow(routerContext);
    }
    if((isBookmark == !context.read<BananaStoreDetailBloc>().state.isBookmark) == false && isSearch){
      routerContext.read<StoreSearchManager>().updateAllShow(routerContext);
      routerContext.read<BananaStoreSearchOptionBloc>().add(ChangeFavorite((isBookmark == !context.read<BananaStoreDetailBloc>().state.isBookmark) == false && isSearch));
    }

  }

  void gotoReviewPage(BuildContext context) => context.read<VerseConfig>().tab.gotoReviewView(
      context: context,
      mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
      storeName: context.read<BananaStoreDetailBloc>().state.detailVO.smStoreName,
      smId: context.read<BananaStoreDetailBloc>().state.detailVO.smMId,
      point: context.read<BananaStoreDetailBloc>().state.detailVO.avgPoint,
      cnt: context.read<BananaStoreDetailBloc>().state.detailVO.reviewCnt,
  );

  void gotoMap(BuildContext context) {
     context.read<VerseConfig>().tab.gotoNaverMapView(
        context: context,
        callback: (data){

        },
        info: NaverMapStoreVO(
            coordinate: GpsVO(lat: double.parse(context.read<BananaStoreDetailBloc>().state.detailVO.smLatitude,), lnt: double.parse(context.read<BananaStoreDetailBloc>().state.detailVO.smLongitude)),
            info: NaverMapStoreInfoVO(
                name: context.read<BananaStoreDetailBloc>().state.detailVO.smStoreName,
                address: context.read<BananaStoreDetailBloc>().state.detailVO.smAddress,
                subAddress: context.read<BananaStoreDetailBloc>().state.detailVO.smCity3 == '' || context.read<BananaStoreDetailBloc>().state.detailVO.smCity3 == 'null'
                    ? context.read<BananaStoreDetailBloc>().state.detailVO.smCity2
                    : context.read<BananaStoreDetailBloc>().state.detailVO.smCity3,
            )
        )
        // (
        // (
        // double.parse(context.read<BananaStoreDetailBloc>().state.detailVO.smLatitude,),
        // double.parse(context.read<BananaStoreDetailBloc>().state.detailVO.smLongitude),
        // ),
        // (
        // context.read<BananaStoreDetailBloc>().state.detailVO.smStoreName,
        // context.read<BananaStoreDetailBloc>().state.detailVO.smCity3 == '' || context.read<BananaStoreDetailBloc>().state.detailVO.smCity3 == 'null'
        //     ? context.read<BananaStoreDetailBloc>().state.detailVO.smCity2
        //     : context.read<BananaStoreDetailBloc>().state.detailVO.smCity3,
        // context.read<BananaStoreDetailBloc>().state.detailVO.smAddress
        // )
        // )
    );
  }


  void clickMoreVert({
    required BuildContext context,
    required StoreReviewVO? review
  }){
    context.read<VerseConfig>().browser.sheet.showSheet(
        routerContext: context,
        sheetList:
        review == null
            ? [
          _storeDeclaration(context),
          _storeBlock(context)
        ]
            : review.raAnswer != null && review.ruDeclarationAnswer == JsonBool.Y
            ? [
          _userDeclaration(review, context),
          _storeAnswerDeclaration(review, context),
          _userBlock(review, context),
        ]
            : [
          _userDeclaration(review, context),
          _userBlock(review, context),
        ]
    );
  }

  BottomSheetVO _storeDeclaration(BuildContext context,) =>
      BottomSheetVO(
          buttonName: '매장 신고하기',
          onTap: (){
            context.read<VerseConfig>().route.closeDialog(context);
            context.read<VerseConfig>().tab.gotoDeclarationPage(
                context: context, routerPlace: DeclarationPlace.detail, type: DeclarationType.store,
                name: storeName,
                typeValue: (mIdx, 0, 0, smId)
              );
            }
          );


  BottomSheetVO _storeBlock(BuildContext context,) =>
      BottomSheetVO(
          buttonName: '매장 차단하기',
          onTap: (){}
      );

  BottomSheetVO _userDeclaration(StoreReviewVO review, BuildContext context,) =>
    BottomSheetVO(
      buttonName: '후기 신고하기',
      onTap:  (){
        context.read<VerseConfig>().route.closeDialog(context);
        context.read<VerseConfig>().tab.gotoDeclarationPage(
            name: review.mName,
            context: context, routerPlace: DeclarationPlace.detail, type: DeclarationType.reviewUser,
            typeValue: (mIdx, review.ruUserIdx, review.ruIdx, '')
        );

      }
  );




  BottomSheetVO _userBlock(StoreReviewVO review, BuildContext context,) =>
    BottomSheetVO(buttonName: '유저 차단하기', onTap: (){});


  BottomSheetVO _storeAnswerDeclaration(StoreReviewVO review, BuildContext context,) =>
      BottomSheetVO(
          buttonName: '답글 신고하기',
          onTap: (){
            context.read<VerseConfig>().route.closeDialog(context);
            context.read<VerseConfig>().tab.gotoDeclarationPage(
                name: storeName,
                context: context, routerPlace: DeclarationPlace.detail, type: DeclarationType.reviewStore,
                typeValue: (mIdx, 0, review.ruIdx, smId)
            );
          }
      );


  // void selectBubble({
  //   required BuildContext context,
  //   required String userMessage
  // }) async{
  //   DataDto check = await context.read<StoreDetailRepositoryRes>().action.createRoom(mIdx: '$mIdx', smMid: smId, userMessage: userMessage);
  //   if(context.mounted){
  //     switch(check.statusEnum){
  //       case StatusEnum.success :
  //       case StatusEnum.failure :
  //
  //       case StatusEnum.token :
  //         try{
  //           context.read<BananaRouteCubit>().logout(idx: mIdx, how: true);
  //         }catch(_){
  //           context.read<BananaRouteCubit>().logout(how: true);
  //         }
  //       default :
  //         context.read<VerseConfig>().func.helper.snackbar.showSnackBar(context: context, text: '채팅 연결에 실패 했습니다.');
  //     }
  //   }
  //
  //
  // }

  void clickFloatingSrcNull(BuildContext context){
    context.read<VerseConfig>().browser.dialog.customDialog(
        routerContext: context,
        mainText: '새로운 딜을 만드시겠습니까?',
        captionText: '진행중인 딜이 없습니다. 진행을 위해선 딜을 생성해야 합니다.',
        confirmText: '네',
        conFirmOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
          routerContext.read<BroadManager>().gotoCreateDealView(context: routerContext, isIntro: true);
        },
        cancelText: '아니요',
        cancelOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
        }
    );
  }





}