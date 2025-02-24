import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store/banana_store_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store_option/banana_store_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreManager {
  const StoreManager();


  void refreshButton({
    required BuildContext context,
  }) {

    context.read<BananaStoreBloc>().add(const FirstData());
    changeOption(context: context, index: 0);
  }

  void changeOption({
    required BuildContext context,
    required int index
  }) {
    context.read<BananaStoreOptionBloc>().add(ChangeOption(index));
  }

  void selectSort({
    required BuildContext context,

  }) =>
      context.read<VerseConfig>().browser.sheet.showSheet(
          routerContext: context,
          sheetList: List.generate(4,
                  (index) => BottomSheetVO(
                      buttonName: context.read<VerseConfig>().function.sortName(index),
                      onTap: (){
                        context.read<StoreManager>().changeOption(context: context, index: index);
                        context.read<VerseConfig>().route.closePage(context);
                      }
                  )
              // ( context.read<VerseConfig>().function.sortName(index), (){
              //   context.read<StoreManager>().changeOption(context: context, index: index);
              //   context.read<VerseConfig>().route.closePage(context);
              // }
              // )
          )
      );


  ScrollController storeController(BuildContext context)
  => context.read<BananaStoreOptionBloc>().scrollController;


  void changePage({
    required BuildContext context,
    required int page,
    required List<StoreVO> store,
  }){
    context.read<BananaStoreOptionBloc>().add(ChangePage1(page));
    context.read<BananaStoreBloc>().add(CheckUpdate(store: store));
  }

  void updateAllShow(BuildContext context) =>
      context.read<BananaStoreBloc>().add(UpdateAllShow(
        currentSort: context.read<BananaStoreOptionBloc>().state.currentSort,
        option: (
        context.read<BananaStoreOptionBloc>().state.page,
        context.read<BananaStoreOptionBloc>().state.order,
        context.read<BananaStoreOptionBloc>().state.orderBy
        ),
      )
      );

  void changeUpdate({
    required BuildContext context,
    required bool value,
  }) => context.read<BananaStoreOptionBloc>().add((ChangeUpdate(value)));

  void gotoStoreDetailView({
    required BuildContext context,
    required String smId,
    required String storeName,
    required int mIdx,
    required int favoriteStore
  }) => context.read<VerseConfig>().tab.gotoStoreDetailView(
      isIntro: true,
      isStore: true,
      isSearch: false,
      context: context, smId: smId, mIdx: mIdx, storeName: storeName, favoriteStore: favoriteStore);

  void updateFavorite({
    required BuildContext context,
    required String smId,
    required int mIdx,
    required bool isFavorite,
  }){
    context.read<BananaStoreBloc>().add(UpdateFavorite(
      smId: smId,
      mIdx: mIdx,
      isFavorite: isFavorite,
    ));
  }


  void storeTileClick({
    required BuildContext context,
    required StoreVO storeVO
  }) {
    final (bool isReg, bool isOpen, String dayPas) openInfo =
    context.read<VerseConfig>().function.calculateTime(
        smTimeStart: storeVO.smTimeStart,
        smTimeEnd: storeVO.smTimeEnd,
        smConsultationTime: storeVO.smConsultationTime
    );
    if( !openInfo.$1 || !openInfo.$2){
      context.read<VerseConfig>().browser.dialog.basicDialog(
          routerContext: context,
          mainText: '상담 시간이 종료된 매장은 응답이 지연될 수 있습니다.',
          onTap: (){
            context.read<VerseConfig>().route.closeDialog(context);
            gotoStoreDetailView(
                context: context,
                smId: storeVO.smMId,
                storeName: storeVO.smStoreName,
                mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
                favoriteStore: storeVO.favoriteStore
            );
          }
      );

    } else{
      gotoStoreDetailView(
          context: context,
          smId: storeVO.smMId,
          storeName: storeVO.smStoreName,
          mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
          favoriteStore: storeVO.favoriteStore
      );
    }
  }

  void gotoStoreSearchView(BuildContext context) =>
      context.read<VerseConfig>().tab.gotoStoreSearchView(context: context);


}