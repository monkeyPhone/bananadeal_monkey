import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal_edit/deal_edit_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/edit/state/bloc/deal_edit/deal_edit_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/manager/deal_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealEditManager {
  final BuildContext _routerContext;
  final DealEditApi _api;
  const DealEditManager({
    required DealEditApi api,
    required BuildContext routerContext,
  }) : _api = api, _routerContext = routerContext;

  void clickTotalButtonSuccess(BuildContext context) =>
      context.read<DealEditBloc>().add(const AllDelete());

  void clickTotalButtonCancel(BuildContext context) =>
      context.read<DealEditBloc>().add(const CancelDelete());

  void fetchDelete({
    required BuildContext context,
    required MyDealListVO value,
  }) =>
      context.read<DealEditBloc>().add(FetchDelete(value: value));


  Future<void> deleteDeal({
    required BuildContext context,
    required List<MyDealListVO> deleteList
  }) async{
    context.read<DealEditBloc>().add(const FetchStatus(StatusEnum.loading));
    List<int> value = deleteList.map((e) => e.diIdx).toList();
    String diIdxBundle = value.toString().replaceAll('[', "").replaceAll(']', "").replaceAll(RegExp('\\s'), "");
    final StatusEnum status = await _api.sendDeleteList(diIdxBundle: diIdxBundle, dio: context.read<VerseConfig>().dio);
    if(context.mounted && _routerContext.mounted){
      context.read<DealEditBloc>().add(const FetchStatus(StatusEnum.success));
      switch(status){
        case StatusEnum.success :
          context.read<VerseConfig>().route.closeDialog(context);
          _routerContext.read<DealManager>().refreshDealData(_routerContext);
          _routerContext.read<VerseConfig>().browser.snackBar.showSnackBar(
              context: context,
              text: '선택한 목록을 삭제했습니다.'
          );
        default:
          context.read<VerseConfig>().browser.snackBar.showSnackBar(
              context: context,
              text: '목록 삭제에 실패했습니다.'
          );
      }
    }

  }

}