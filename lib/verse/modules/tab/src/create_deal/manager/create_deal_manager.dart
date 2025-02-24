import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_finish/banana_create_deal_finish_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_init/banana_create_deal_init_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealManager {
  final int mIdx;
  final void Function() createCallback;

  const CreateDealManager({
    required this.mIdx,
    required this.createCallback,
  });


  void closePageDialog(BuildContext context) =>
      context.read<VerseConfig>().browser.dialog.customDialog(
          routerContext: context,
          barrierDismissible: true,
          mainText: '딜 생성을 종료하시겠습니까?',
          captionText: '진행사항은 저장되지 않습니다.',
          cancelText: '계속하기',
          confirmText: '그만하기',
          cancelOnTap: (){
           context.read<VerseConfig>().route.closeDialog(context);
            },
          conFirmOnTap: () {
            context.read<VerseConfig>().route.closeDialog(context);
            context.read<VerseConfig>().route.closePage(context);
          }
  );

  void showSnackBar({
    required BuildContext context,
    required String text,  String? label})
  =>  context.read<VerseConfig>().browser.snackBar.showSnackBar(
      text: text,
      label: label,
      context: context
  );

  String convertAgency({
    required String agency,
    required bool isCurrent
  }){
    return switch(agency){
      '1' => 'SK',
      '2' => 'KT',
      '3' => 'LG',
      '4' => '7모바일',
      '5' => 'M모바일',
      '6' => 'U모바일',
      '8' => 'Hello모바일 (KT망)',
      '12' => 'Hello모바일 (LG망)',
      '14' => '기타',
      _ => isCurrent ?'현재 이용하고 있는 통신사가 있어요.' : '원하는 통신사가 있어요.'
    };
  }

  void showSheetEvent({
    required BuildContext context,
    required bool isCurrent,setPromotion
  }){
    context.read<BananaCreateDealBloc>().add(ShowSheetEvent(context: context, isCurrent: isCurrent,));
  }

  void promotionSheet({
    required BuildContext context,
    required PromotionEnum promotionEnum,
    required List<String> stateList
  }) {
    final List<String>? caption = switch(promotionEnum){
      PromotionEnum.supportType => ['단말기지원금','요금할인',''],
      _ => null
    };

    final List<BottomSheetVO> sheetList = List.generate(stateList.length,
            (index) => BottomSheetVO(
            buttonName: stateList[index],
            onTap:  (){
              setPromotion(
                  promotionEnum: promotionEnum,
                  value: stateList[index] == '상관없음' || stateList[index] == '해당없음'
                      ? ''
                      : stateList[index],
                  context: context
              );
              Navigator.pop(context);
            }
        )

    );

    context.read<VerseConfig>().browser.sheet.showSheet(routerContext: context, sheetList: sheetList, caption: caption);

  }




  void nextStep(BuildContext context) =>
      context.read<BananaCreateDealBloc>().add(const NextStep());

  void previousStep(BuildContext context) =>
      context.read<BananaCreateDealBloc>().add(const PreviousStep());

  void changeCreateState({
    required BuildContext context,
    required String value}) =>
      context.read<BananaCreateDealBloc>().add(ChangeCreateState(value: value));

  void changeCreateStateModel({
    required BuildContext context,
    required (String, String, String, String) value}) =>
      context.read<BananaCreateDealBloc>().add(ChangeCreateState(value: value));

  void changeCreateState2({
    required BuildContext context,
    required (int, String) value}) =>
      context.read<BananaCreateDealBloc>().add(ChangeCreateState(value: value));



  void initModel(BuildContext context) =>
      context.read<BananaCreateDealBloc>().add(const InitModel());




  void gotoSelectModel({
    required String tkIdx,
    required BuildContext context,
  }) => context.read<VerseConfig>().tab.gotoModelListView(
    context: context,
    tkIdx: tkIdx,
  );


  // (int psIdx, String ldcpName, String ldcpModel, String piPath)
  void setModel({
    required BuildContext context,
    required String psIdx,
    required String ldcpName,
    required String ldcpModel,
    required String piPath,
  }) => context.read<BananaCreateDealBloc>().add(SetModel(
    selectModel: (psIdx, ldcpName, ldcpModel, piPath),
  ));

  void gotoDetail({
    required BuildContext context,
    required String psIdx,
    required String name,
  }) =>
      context.read<VerseConfig>().tab.gotoModelListDetailView(
        context: context,
        psIdx: psIdx,
        name: name,
      );

  void gotoRateListView({
    required BuildContext context,
    required String psIdx,
    required String tkIdx,

  }) => context.read<VerseConfig>().tab.gotoRateListView(context: context, psIdx: psIdx, tkIdx: tkIdx,);


  void setPromotion({
    required BuildContext context,
    required PromotionEnum promotionEnum,
    required String value
  }) => context.read<BananaCreateDealBloc>().add(SetPromotion(promotionEnum: promotionEnum, value: value));

  void postDeal(BuildContext context,) =>
      context.read<BananaCreateDealFinishBloc>().add(const PostDeal());

  void changeStepWidget({
    required BuildContext context,
    required StepWidgetEnum step
  }) =>
      context.read<BananaCreateDealInitBloc>().add(ChangeStepWidget(step));

}