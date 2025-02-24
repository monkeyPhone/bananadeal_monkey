import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/estimate/src/estimate_repository_imp.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate/banana_estimate_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate_option/banana_estimate_option_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateManager {
  final BuildContext routerContext;
  final MyDealListVO myDeal;
  final List<String> sortName;
  const EstimateManager({
    required this.routerContext,
    required this.myDeal,
    required this.sortName
  });

  void refreshEstimate(BuildContext context) {
    context.read<BananaEstimateOptionBloc>().add(ConvertDStatus(diIdx: myDeal.diIdx, diStatus: myDeal.diStatus));
    context.read<BananaEstimateOptionBloc>().add(const InitOption());
    context.read<BananaEstimateBloc>().add(const RisingEstimate(0));

  }

  void addMoreEstimate({
    required BuildContext context,
    required List<EstimateVO> valueList,
    required StatusEnum statusEnum,
  }) {
    context.read<BananaEstimateBloc>().add(FetchEstimate(valueList: valueList, statusEnum: statusEnum));
  }

  void optionSuccess({
    required BuildContext context,
    required int index
  }){
    context.read<BananaEstimateOptionBloc>().add(ChangePage(index: index));
  }

  void optionFail({
    required BuildContext context,
    required bool isUpdate
  }){
    context.read<BananaEstimateOptionBloc>().add(ChangeUpdate(isUpdate: isUpdate));
  }


  void sortEstimate({
    required BuildContext context,
    required int index
  }) {
    if(context.read<BananaEstimateOptionBloc>().scrollController.hasClients){
      context.read<BananaEstimateOptionBloc>().scrollController.jumpTo(0.0);
    }
    context.read<BananaEstimateOptionBloc>().add(ChangeSort(index: index));
    context.read<BananaEstimateBloc>().add(RisingEstimate(index));
  }


  void gotoEstimateDetailView({
    required BuildContext context,
    required EstimateVO estimate,
  }) => context.read<VerseConfig>().tab.gotoEstimateDetailView(
    context: context,
    estimate: estimate,
    isEstimateView: true,
    isChatView: false
  );

  void endDeal(BuildContext context) => context.read<VerseConfig>().browser.dialog.customDialog(
      routerContext: context,
      mainText: '진행 중인 딜을 종료하시겠습니까?',
      captionText: '해당 목록을 삭제하려면, my딜 상단의 아이콘 메뉴를 이용해주세요.',
      confirmText: '종료', cancelText: '취소',
      conFirmOnTap: () async{
        await _postEndDeal(context);
      },
      cancelOnTap: (){
        context.read<VerseConfig>().route.closeDialog(context);
      }
  );

  Future<void> _postEndDeal(BuildContext context) async{
    final DataDto status = await context.read<EstimateRepositoryImpl>().postEndDeal(
        diHopePhone: myDeal.diHopePhone,
        uuid: context.read<BananaRouteCubit>().state.userVO.mUuid,
        diIdx: myDeal.diIdx
    );
    if(context.mounted && routerContext.mounted) {
      if (status.statusEnum == StatusEnum.success) {
        context.read<VerseConfig>().route.closeDialog(context);
        context.read<VerseConfig>().route.closePage(context);
        routerContext.read<BroadManager>().refreshDealData(routerContext);
      }
      else{
        context.read<VerseConfig>().route.closeDialog(context);
        context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '잠시 후, 다시 시도해주세요.');
      }
    }
  }

}