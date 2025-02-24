import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/action/method_api_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/browser_dialog.dart';
import 'package:flutter/material.dart';


abstract class MethodProvider {
  const MethodProvider();

  GestureDragEndCallback? onHorizontalDragEnd(GestureDragEndCallback? onHorizontalDragEnd);

  void caseRouteFunction({
    required CanvasEnum canvasEnum,
    required bool? isCanPop,
    required bool? isForm,
    required BuildContext context,
    required bool? isFavorite,
    required void Function()? customFunction,
  });

}

class MethodProviderImpl implements MethodProvider {
  final MethodApiAction action;
  final BrowserDialog dialog;
  const MethodProviderImpl({
    required this.action,
    required this.dialog,
  });

  @override
  GestureDragEndCallback? onHorizontalDragEnd(GestureDragEndCallback? onHorizontalDragEnd) => action.onHorizontalDragEnd(onHorizontalDragEnd);

  @override
  void caseRouteFunction({
    required CanvasEnum canvasEnum,
    required bool? isCanPop,
    required bool? isForm,
    required BuildContext context,
    required bool? isFavorite,
    required void Function()? customFunction,
  }) => action.caseRouteFunction(
    context: context,
    canvasEnum: canvasEnum,
    isCanPop: isCanPop,
    isForm: isForm,
    isFavorite: isFavorite,
    customFunction: customFunction,
    dialog: dialog,
  );

}