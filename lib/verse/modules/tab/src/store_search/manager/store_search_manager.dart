import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/manager/store_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/state/bloc/banana_store_search/banana_store_search_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/state/bloc/banana_store_search_option/banana_store_search_option_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreSearchManager {
  final BuildContext routerContext;
  const StoreSearchManager({
    required this.routerContext,
  });

  void updateAllShow(BuildContext context) =>
    context.read<BananaStoreSearchBloc>().add(UpdateAllShow(option: (
    context.read<BananaStoreSearchOptionBloc>().state.page,
      context.read<BananaStoreSearchOptionBloc>().state.keyword,

    )));

  void updateKeyword({
    required BuildContext context,
    required String keyword,
  }) {
    context.read<BananaStoreSearchBloc>().add(FetchStore(option: (0, keyword)));
    context.read<BananaStoreSearchOptionBloc>().add(FetchKeyword(keyword));
    FocusScope.of(context).unfocus();
  }

  void deleteKeyword(BuildContext context) {
    context.read<BananaStoreSearchBloc>().add(const InitStore());
    context.read<BananaStoreSearchOptionBloc>().add(const FetchKeyword(''));
  }


  void closePage({
    required BuildContext context,
    required bool isFavorite,
  }) {
    context.read<VerseConfig>().route.closePage(context);
    // log('${(isBookmark == !context.read<BananaStoreDetailInfoBloc>().state.isBookmark) == false}');
    if(isFavorite){
      routerContext.read<StoreManager>().updateAllShow(routerContext);
    }
  }

  void changeUpdate({
    required BuildContext context,
    required bool value,
  }){
    context.read<BananaStoreSearchOptionBloc>().add(ChangeUpdate(value));
  }

  void changePage({
    required BuildContext context,
    required int page,
    required String keyword
  }){
    context.read<BananaStoreSearchOptionBloc>().add(ChangePage1(page));
    context.read<BananaStoreSearchBloc>().add(UpdateAllShow(option: (page, keyword)));
  }


  void updateFavorite({
    required BuildContext context,
    required String smId,
    required int mIdx,
    required bool isFavorite,
  }){
    context.read<BananaStoreSearchBloc>().add(UpdateFavorite(
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
            context.read<VerseConfig>().tab.gotoStoreDetailView(
                isIntro: true,
                context: context,
                smId: storeVO.smMId,
                storeName: storeVO.smStoreName,
                mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
                favoriteStore: storeVO.favoriteStore, isSearch: true, isStore: false);

          }
      );

    } else{
      context.read<VerseConfig>().tab.gotoStoreDetailView(
          isIntro: true,
          context: context,
          smId: storeVO.smMId,
          storeName: storeVO.smStoreName,
          mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
          favoriteStore: storeVO.favoriteStore, isSearch: true, isStore: false);
    }
  }

}