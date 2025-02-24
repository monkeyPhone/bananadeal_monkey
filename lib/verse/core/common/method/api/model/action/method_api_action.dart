import 'dart:io';

import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/manager/reset_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/manager/chat_log_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/finish_deal/manager/finish_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/manager/invite_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/manager/fcm_alert_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/store_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/manager/store_search_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/browser_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MethodApiAction {
  const MethodApiAction();

  GestureDragEndCallback? onHorizontalDragEnd(GestureDragEndCallback? onHorizontalDragEnd){
    return Platform.isIOS
        ? onHorizontalDragEnd : null;
  }

  void caseRouteFunction({
    required CanvasEnum canvasEnum,
    required bool? isCanPop,
    required bool? isForm,
    required BuildContext context,
    required bool? isFavorite,
    required void Function()? customFunction,
    required BrowserDialog dialog,
  }) {
    switch (canvasEnum) {
      case CanvasEnum.basic:
        _elseFunction(
            customFunction: customFunction,
            isCanPop: isCanPop, isForm: isForm, context: context, dialog: dialog);
      case CanvasEnum.home:
        _homeFunction(context, canvasEnum);
      case CanvasEnum.homeCom:
        _homeComFunction(context);
      case CanvasEnum.reset:
        context.read<ResetManager>().backSpace(context);
      case CanvasEnum.userInfo:
        context.read<InfoUserManager>().backSpaceEvent(context);
      case CanvasEnum.createDeal:
        _createDealFunction(context);
      case CanvasEnum.inviteDeal:
        _inviteDealFunction(context);
      case CanvasEnum.finishDeal:
        _finishDealFunction(context);
      case CanvasEnum.notification:
        _notificationFunction(context);
      case CanvasEnum.storeDetail:
        _storeDetailFunction(context);
      case CanvasEnum.chatLog:
        _chatLogFunction(context);
      case CanvasEnum.storeSearch:
        _storeSearchFunction(context, isFavorite ?? false);
    }
  }

  void _elseFunction({
    required void Function()? customFunction,
    required bool? isCanPop,
    required bool? isForm,
    required BuildContext context,
    required BrowserDialog dialog,
  }) {
    switch(customFunction){
      case null :
        switch (isCanPop) {
          case false:
            dialog.closeAppDialog(
              routerContext: context,
            );
          case true:
            if (isForm != null) {
              if (MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom > 0) {
                FocusScope.of(context).unfocus();
              } else {
                context.read<VerseConfig>().route.closePage(context);
              }
            } else {
              context.read<VerseConfig>().route.closePage(context);
            }
          default:
            context.read<VerseConfig>().route.closePage(context);
        }
      default:
        customFunction();
    }
  }

  void _homeComFunction(BuildContext context) {
    if (MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0) {
      FocusScope.of(context).unfocus();
    } else {
      context.read<BroadManager>().changePage(context: context, page: NavEnum.home);
    }
  }

  void _homeFunction(BuildContext context, CanvasEnum canvasEnum) {
    if (MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0) {
      FocusScope.of(context).unfocus();
    } else {
      context.read<BroadManager>().backSpace(context);
    }
  }

  // void _loginFunction({
  //   required BuildContext context,
  //   required(AuthProgressEnum progressEnum, bool isLoading) loginRecord,
  // }) {
  //   if (MediaQuery
  //       .of(context)
  //       .viewInsets
  //       .bottom > 0) {
  //     FocusScope.of(context).unfocus();
  //   } else {
  //     switch (loginRecord.$1) {
  //       case AuthProgressEnum.login:
  //         if (loginRecord.$2) {
  //
  //         } else {
  //           if(context.read<LoginManager>().isCanPop){
  //             context.read<LoginManager>().closePage(context);
  //           } else {
  //             context.read<LoginManager>().closeAppDialog(context);
  //           }
  //         }
  //       case AuthProgressEnum.sign:
  //         context.read<LoginManager>().closeSign(context);
  //     }
  //   }
  // }

  void _createDealFunction(BuildContext context) {
    if (MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0) {
      FocusScope.of(context).unfocus();
    } else {
      context.read<CreateDealManager>().closePageDialog(context);
    }
  }

  void _inviteDealFunction(BuildContext context) {
    context.read<InviteDealManager>().closePageDialog(context);
  }

  void _finishDealFunction(BuildContext context) {
    context.read<FinishDealManager>().closePage(context);
  }

  void _notificationFunction(BuildContext context) {
    context.read<FcmAlertManager>().blocCommitAlert();
    context.read<FcmAlertManager>().closePage(context);
  }

  //TODO: 해야 됨 yoyo
  void _storeDetailFunction(BuildContext context) {
    context.read<StoreDetailManager>().route.closePage(context);
  }

  void _chatLogFunction(BuildContext context) {
    context.read<ChatLogManager>().closePage(context, true);
  }

  void _storeSearchFunction(BuildContext context, bool isFavorite) {
    context.read<StoreSearchManager>().closePage(context: context, isFavorite: isFavorite);
  }
}