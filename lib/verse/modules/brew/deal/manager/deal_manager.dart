import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_deal/banana_broad_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/edit/deal_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealManager {
  final DealEdit edit;
  const DealManager({
    required this.edit
  });


  void refreshDealData(BuildContext context) =>
      context.read<BananaBroadDealBloc>().add(const InitDealData());

  void gotoCreateDealView(BuildContext context) =>
      context.read<VerseConfig>().tab.gotoCreateDealView(
        context: context,
        createCallback: (){
          context.read<BroadManager>().refreshDealData(context);
        }
      );

  void gotoEstimateView({
    required BuildContext context,
    required MyDealListVO myDeal,
  }) => switch(myDeal.diEstimateCnt){
    0 => switch(myDeal.diStatus){
      '진행중' => context.read<VerseConfig>().tab.gotoEstimateView(context: context, myDeal: myDeal),
      _ => context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '받은 견적이 없습니다.')
    },
    _ => context.read<VerseConfig>().tab.gotoEstimateView(context: context, myDeal: myDeal)
  };

}