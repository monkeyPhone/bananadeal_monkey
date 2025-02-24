import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/esimate_detail/estimate_detail_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/helper/func/estimate_detail_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EstimateDetailManager {
  final bool isEstimateView;
  final bool isChatView;
  final EstimateVO estimate;
  final BuildContext routerContext;
  final EstimateDetailFunc func;
  final SharedPreferences mainPrefs;
  final EstimateDetailRepository estimateDetailRepository;
  const EstimateDetailManager({
    required this.isChatView,
    required this.isEstimateView,
    required this.estimate,
    required this.routerContext,
    required this.func,
    required this.mainPrefs,
    required this.estimateDetailRepository,
  });

  String switchEstimateJoinTkIdx() => func.switchEstimateJoinTkIdx(deJoinTkIdx: estimate.deJoinTkIdx);
  String switchEstimateSupType() => func.switchEstimateSupType(deSupportType: estimate.deSupportType);
  (String title, String content) switchEstimateDeContractPlan() => func.switchEstimateDeContractPlan(deContractPlan: estimate.deContractPlan);
  String switchEstimateDeInstalmentMonth() => func.switchEstimateDeInstalmentMonth(deInstallmentMonth: estimate.deInstallmentMonth);

  String convertStatus() => func.convertStatus(estimate.dStatus);



  Future<void> gotoChatLogView(BuildContext context) async{
    final int mIdx = context.read<BananaRouteCubit>().state.userVO.mIdx;
    final String smId = estimate.deSmMId;
    final (bool, ChatRoomVO) result = await estimateDetailRepository.getRoom(mIdx: mIdx, smId: smId);
    if(context.mounted){
      if(result.$1){
        _gotoChatLogView(context: context, room: result.$2);
      }
      else{
        _default(context);
      }
    }
  }



  void _gotoChatLogView({
    required BuildContext context,
    required ChatRoomVO room,
  }) => context.read<VerseConfig>().tab.gotoChatLogView(
        context: context,
        prefs: mainPrefs,
        smId: room.smMId,
        isChat: false, mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,

    );



  void _default(BuildContext context) {
    context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '잠시 후, 다시 시도해주세요.');
  }

}