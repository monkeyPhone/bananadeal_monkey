import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/range/state/bloc/banana_range_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RangeManager {

  final (String, String, int) address;
  final void Function(int range) callBack;

  const RangeManager({
    required this.address,
    required this.callBack,
  });


  void closePage(BuildContext context) => context.read<VerseConfig>().route.closePage(context);

  void showSnackBar({
    required BuildContext context,
    required String text,
  }) => context.read<VerseConfig>().browser.snackBar.showSnackBar(text: text, context: context);

  void fetchSelect({
    required BuildContext context,
    required int selectIndex,
  }) => context.read<BananaRangeBloc>().add(FetchSelect(selectIndex: selectIndex));

  void rangeSet({
    required BuildContext context,
    required int range,
  }){
    callBack(range);
    closePage(context);
  }


}