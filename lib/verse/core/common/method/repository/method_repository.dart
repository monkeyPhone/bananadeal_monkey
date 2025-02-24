import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/provider/method_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:flutter/material.dart';

abstract class MethodRepository {
  const MethodRepository();

  PopInvokedWithResultCallback invokedCase({
    required CanvasEnum canvasEnum,
    required BuildContext context,
    required bool? isCanPop,
    required bool? isForm,
    required void Function()? customFunction,
    required bool? isFavorite,
  });

  GestureDragEndCallback? dragCase({
    required CanvasEnum canvasEnum,
    required BuildContext context,
    required bool? isCanPop,
    required bool? isForm,
    required bool? isFavorite,
    required void Function()? customFunction,
  });

  GestureTapCallback gestureCase({
    required CanvasEnum canvasEnum,
    required BuildContext context,
    required bool? isCanPop,
    required bool? isForm,
    required void Function()? customFunction,
    required bool? isFavorite,
  });

}

class MethodRepositoryImpl implements MethodRepository{
  final MethodProvider provider;
  const MethodRepositoryImpl({
    required this.provider,
  });

  @override
  PopInvokedWithResultCallback invokedCase({
    required CanvasEnum canvasEnum,
    required BuildContext context,
    required bool? isCanPop,
    required bool? isForm,
    required void Function()? customFunction,
    required bool? isFavorite,
  }) =>  (bool didPop, Object? result) {
    if(didPop){
      return ;
    }
    provider.caseRouteFunction(canvasEnum: canvasEnum, context: context, isCanPop: isCanPop, isForm: isForm, customFunction: customFunction, isFavorite: isFavorite);
  };

  @override
  GestureDragEndCallback? dragCase({
    required CanvasEnum canvasEnum,
    required BuildContext context,
    required bool? isCanPop,
    required bool? isForm,
    required bool? isFavorite,
    required void Function()? customFunction,
  }) =>  provider.onHorizontalDragEnd(
          (DragEndDetails details) {
        if(details.primaryVelocity! > 100){
          provider.caseRouteFunction(canvasEnum: canvasEnum, context: context, isCanPop: isCanPop, isForm: isForm, customFunction: customFunction, isFavorite: isFavorite);
        }
      }
  );

  @override
  GestureTapCallback gestureCase({
    required CanvasEnum canvasEnum,
    required BuildContext context,
    required bool? isCanPop,
    required bool? isForm,
    required void Function()? customFunction,
    required bool? isFavorite,
  }) => (){
    provider.caseRouteFunction(canvasEnum: canvasEnum, context: context, isCanPop: isCanPop, isForm: isForm, customFunction: customFunction, isFavorite: isFavorite);
  };

}