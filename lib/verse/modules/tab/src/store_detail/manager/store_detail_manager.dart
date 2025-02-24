import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/helper/store_detail_manager_helper_logic.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/helper/store_detail_manager_helper_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_deal/banana_store_detail_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_option/banana_store_detail_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_socket/banana_store_detail_socket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailManager {
  final StoreDetailManagerHelperRoute route;
  final StoreDetailManagerHelperLogic logic;

  const StoreDetailManager({
    required this.route,
    required this.logic,
  });

  int getScore(BuildContext context) =>
      double.parse(context.read<BananaStoreDetailBloc>().state.detailVO.avgPoint).ceil().toInt();

  void updateFavorite(BuildContext context) =>
      context.read<BananaStoreDetailBloc>().add(const UpdateFavorite());

  ScrollController getController(BuildContext context) =>
      context.read<BananaStoreDetailOptionBloc>().scrollController;

  void jumpToMiddle({
    required BuildContext context,
    required CommonSize size,
  }) => getController(context).jumpTo(size.ratio58*1+size.sized16grid);


  void changeState(BuildContext context){
    context.read<BananaStoreDetailOptionBloc>().add(
        const ChangeState(value: true)
    );
  }


  void refreshButton(BuildContext context) => context.read<BananaStoreDetailBloc>().add(const StoreDetailGetInfo());

  void refreshFloating(BuildContext context) => context.read<BananaStoreDetailDealBloc>().add(const InitDealData());

  void clickFloatingSrcSendInvite({
    required BuildContext context,
    required int diIdx
  }){
    context.read<VerseConfig>().browser.dialog.customDialog(
        routerContext: context,
        mainText: '초대장을 보내시겠습니까?',
        captionText: '${route.storeName}에게 딜 초대장을 보냅니다.',
        confirmText: '네',
        conFirmOnTap: () async{
          context.read<BananaStoreDetailSocketBloc>().add(SendInviteMulti(isAll: false, diIdx: diIdx, smMidList: route.smId));
          context.read<VerseConfig>().route.closeDialog(context);
        },
        cancelText: '아니요',
        cancelOnTap: (){
          context.read<VerseConfig>().route.closeDialog(context);
        }
    );
  }

}