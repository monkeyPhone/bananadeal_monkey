import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan/plan_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/state/bloc/banana_rate_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RateListManager {
  final PlanRepository repository;
  final BuildContext routerContext;
  final String psIdx;
  final String tkIdx;



  const RateListManager({
    required this.repository,
    required this.routerContext,
    required this.psIdx,
    required this.tkIdx,
  });


  void showBottomSheet({
    required BuildContext context,
    required bool isLocation,
    required List<BottomSheetVO> sheetList
  }) =>
      context.read<VerseConfig>().browser.sheet.showSheet(routerContext: context, sheetList: sheetList);

  void changeCategory({
    required BuildContext context,
    required int index,
  }) => context.read<BananaRateListBloc>().add(ChangeCategory(index));

  void changeSort({
    required BuildContext context,
    required int index,
  }) => context.read<BananaRateListBloc>().add(ChangeSort(index));


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

  void gotoRateDetailDialog({
    required BuildContext context,
    required String pIdx,
    required String baseUrl
  }) async{
    context.read<VerseConfig>().tab.gotoRateDetailDialog(context: context, pIdx: pIdx, baseUrl: baseUrl);
  }

  void gotoRateListSearchView({
    required BuildContext context,
    required  List<String> keyword,
    required BuildContext readContext,
  }) => context.read<VerseConfig>().tab.gotoRateListSearchView(
      context: context,
      keyword: keyword,
      readContext: readContext,
      routerContext: routerContext,
      tkIdx: tkIdx,
      psIdx: psIdx,
      repository: repository

  );


}