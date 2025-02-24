import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/const/rank_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/state/bloc/banana_rank_all/banana_rank_all_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankAllManager {
  final void Function(RankVO rank) listClickCallback;

  const RankAllManager({
    required this.listClickCallback,
  });

  void changeCategoryOnTap({
    required BuildContext context,
    required RankEnum rankEnum,
  }) {
    context.read<BananaRankAllBloc>().add(ChangeCategory(rankEnum));
  }


  void changeList(BuildContext context) {
    context.read<BananaRankAllBloc>().add(const ChangeList());
  }

  void listElementClick({
    required RankVO rank,
  }) =>  listClickCallback(rank);


  String convertGrade(String text){
    return switch(text){
      'PREMIUM' => '프리미엄형',
      'HIGH' => '고급형',
      'NORMAL' => '보급형',
      'WORTHY' => '실속형',
      _ => ''
    };
  }

}