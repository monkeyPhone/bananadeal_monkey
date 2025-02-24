import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/state/bloc/banana_invite_deal_option/banana_invite_deal_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/state/bloc/banana_invite_deal_socket/banana_invite_deal_socket_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/state/bloc/banana_invite_deal_store/banana_invite_deal_store_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class InviteDealManagerHelperBloc {
  const InviteDealManagerHelperBloc();

  void refreshInvite(BuildContext context) {
    context.read<BananaInviteDealOptionBloc>().add(const InitOption());
    context.read<BananaInviteDealStoreBloc>().add(const StoreInitData());
  }

  void refreshAction(BuildContext context) {
    context.read<BananaInviteDealOptionBloc>().add(const GetStoreLength());
  }

  void clickSortButton({
    required BuildContext context,
    required bool value,
    required List<StoreVO> valueList,
  }) {
    context.read<BananaInviteDealOptionBloc>().add(OptionIsAllChange(value: value));
    context.read<BananaInviteDealOptionBloc>().add(FetchSelectListAll(valueList: valueList));
  }

  void clickStoreButton({
    required BuildContext context,
    required bool isAll,
    required StoreVO value
  }) {
    context.read<BananaInviteDealOptionBloc>().add(FetchSelectList(value));
    if(isAll){
      context.read<BananaInviteDealOptionBloc>().add(const OptionIsAllChange(value: false));
    }

  }

  void successUpdate({
    required BuildContext context,
    required int page,
    required bool isUpdate,
  }){
    context.read<BananaInviteDealOptionBloc>().add(FetchPage(page: page, isUpdate: isUpdate));
    context.read<BananaInviteDealOptionBloc>().add(const OptionIsAllChange(value: false));
    if(isUpdate){
      context.read<BananaInviteDealStoreBloc>().add(FetchStoreData(
        page: page
          )
      );
    }
  }


  void sendRequest({
    required BuildContext context,
    required bool isAll,
    required int diIdx,
    required List<StoreVO>? selectList
  }) {
    context.read<BananaInviteDealStoreBloc>().add(const ChangeStoreStatus(StatusEnum.loading));
    if(isAll || selectList!.isNotEmpty){
      final List<String> smIdConvert = selectList != null ? selectList.map((e)=> e.smMId).toList() : [];
      final String smList = selectList != null ? smIdConvert.toString().replaceAll('[', "").replaceAll(']', "").replaceAll(RegExp('\\s'), "") : '';
      context.read<BananaInviteDealSocketBloc>().add(
          SendInviteMulti(
              isAll: isAll,
              diIdx: diIdx,
              smMidList: smList)
      );
      context.read<CreateDealManager>().changeStepWidget(context: context, step: StepWidgetEnum.finish);
    } else {
      context.read<VerseConfig>().browser.dialog.customDialog(
          routerContext: context,
          mainText: '지금 딜을 등록하시겠습니까?',
          captionText: '초대한 매장이 없으면 견적을 받으실 수 없습니다.',
          confirmText: '네',
          conFirmOnTap: (){
            context.read<VerseConfig>().route.closeDialog(context);
            context.read<CreateDealManager>().changeStepWidget(context: context, step: StepWidgetEnum.finish);
          },
          cancelText: '아니요',
          cancelOnTap: (){
            context.read<VerseConfig>().route.closeDialog(context);
          }
      );
    }
    if(context.mounted){
      context.read<BananaInviteDealStoreBloc>().add(const ChangeStoreStatus(StatusEnum.success));
    }

  }




}