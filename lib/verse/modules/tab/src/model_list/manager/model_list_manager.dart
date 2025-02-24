import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list/src/model_list_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/state/bloc/banana_model_list/banana_model_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModelListManager {
  final String tkIdx;
  final BuildContext routerContext;

  const ModelListManager({

    required this.tkIdx,
    required this.routerContext,
  });

  void changeIndex({
    required BuildContext context,
    required int index,
  }) => context.read<BananaModelListBloc>().add(ChangeIndex(index));

  void changeSort({
    required BuildContext context,
    required int index,
  }) => context.read<BananaModelListBloc>().add(ChangeSort(index));



  void showDialogSelect({
    required BuildContext context,
    required String main,
    required GestureTapCallback cancleOnTap,
    required GestureTapCallback conFirmOnTap,
  }) => context.read<VerseConfig>().browser.dialog.customDialogRow(
      routerContext: context,
      barrierDismissible: false,
      mainText: main, confirmText: '선택하기', cancelText: '취소',
      cancelOnTap: cancleOnTap,
      conFirmOnTap: conFirmOnTap
  );

  void gotoSearch({
    required BuildContext context,
    required List<String> keyword,
    required BuildContext readContext,
  }) => context.read<VerseConfig>().tab.gotoModelListSearchView(
      context: context,
      keyword: keyword,
      repository: context.read<ModelListRepositoryImpl>(),
      routerContext: routerContext,
      readContext: readContext, tkIdx: tkIdx
  );




}