import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';

import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/state/cubit/banana_alert_cubit/banana_alert_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FcmAlertManager {
  final BuildContext routerContext;

  const FcmAlertManager({
    required this.routerContext,
  });

  void closePage(BuildContext context) {
    context.read<BananaAlertCubit>().closeAlertFcm(true);
    context.read<VerseConfig>().route.closePage(context);
  }

  void openImageDialog({
    required BuildContext context,
    required int currentIndex,
    required List<String> imageList,
    required bool isDownload
  }) => context.read<VerseConfig>().browser.image.openDialog(
      routerContext: context,
      currentIndex: currentIndex,
      imageList: imageList,
      isDownload: isDownload,
      baseUrl: context.read<VerseConfig>().url.imageBananaUrl
  );

  void changeEditMode(BuildContext context) => context.read<BananaAlertCubit>().changeEditMode();

  void deleteListDto({
    required BuildContext context,
    required List<NotiEntity> dto
  }) =>
      context.read<BananaAlertCubit>().deleteListDto(dto);

  void setCurrentIndex({
    required BuildContext context,
    required int index,
  }) => context.read<BananaAlertCubit>().setCurrentIndex(index);

  void showBottomSheeted({
    required BuildContext context,
    required List<BottomSheetVO> sheetList,
  }) => context.read<VerseConfig>().browser.sheet.showSheet(routerContext: context, sheetList: sheetList,);

  void blocCommitAlert() =>
      routerContext.read<BroadManager>().commitAlert(routerContext);


}