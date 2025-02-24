import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/fcm_edit/model/action/fcm_edit_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/fcm_edit/model/fcm_edit_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/fcm_edit/src/fcm_edit_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/alert_setting/manager/alert_setting_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/alert_setting/state/bloc/banana_alert_setting/banana_alert_setting_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/alert_setting/state/listener/alert_setting_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EtcTabAlertSettingView extends StatelessWidget {
  const EtcTabAlertSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<FcmEditApiImpl>(
              create: (BuildContext context) =>
                  const FcmEditApiImpl(action: FcmEditAction())
          ),
          RepositoryProvider<FcmEditRepositoryImpl>(
              create: (BuildContext context) =>
                  FcmEditRepositoryImpl(
                    api: context.read<FcmEditApiImpl>(),
                    dio: context.read<VerseConfig>().dio
               )
          ),
          RepositoryProvider<AlertSettingManager>(
              create: (BuildContext context) =>
                const AlertSettingManager()
          ),
        ],
        child: BlocProvider<BananaAlertSettingBloc>(
          create: (BuildContext context) => BananaAlertSettingBloc(
            repository: context.read<FcmEditRepositoryImpl>()
          ),
          child: const _Canvas(),
        )
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: ('알림 설정', null, null, _Actions()),
      body: _Body(),
      listener: AlertSettingListener(),
      navbarWidget: _Nav(),
    );
  }
}


class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context
        .read<VerseConfig>()
        .size;
    return BlocSelector<BananaAlertSettingBloc, BananaAlertSettingState, bool>(
        selector: (state) => state.isEditMode,
        builder: (context, isEditMode) =>
        isEditMode
            ? BdNeoButton(
          size: size,
          height: size.sizedAppbar,
          fontSize: size.titleLittle,
          text: '저장하기',
          onPressed: () {
            context.read<BananaAlertSettingBloc>().add(const FetchStatus());
          },
        )
            : const SizedBox()
    );
  }
}


class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaAlertSettingBloc, BananaAlertSettingState, bool>(
        selector: (state) => state.isEditMode,
        builder: (context, isEditMode) =>
        isEditMode
            ? BdRippleButtonBasic(
                padding: EdgeInsets.all(context
                    .read<VerseConfig>()
                    .size.sized8grid),
                margin: EdgeInsets.only(
                  right: context
                      .read<VerseConfig>()
                      .size.sized8grid
                ),
                onTap: (){
                  context.read<AlertSettingManager>().changeViewMode(context);
                },
                child: const BdTextWidget(text: '취소', textStyle: bodyRed,)
              )
            : const SizedBox()
    );
  }
}



class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaAlertSettingBloc, BananaAlertSettingState, bool>(
        selector: (state) => state.isEditMode,
        builder: (context, isEditMode) =>
            isEditMode
                ? const _EditMode()
                : const _ViewMode()
    );
  }
}

class _EditMode extends StatelessWidget {
  const _EditMode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaAlertSettingBloc, BananaAlertSettingState>(
      builder: (context, state) =>
          Column(
            children: [
              _Setting(
                text: '서비스 알림 수신 설정',
                text2: state.isSpDate,
                isValue: state.isSpValue,
                onChanged: (val) => {
                  context.read<AlertSettingManager>().alertResult(context: context, isSp: true, originDate: state.isOriginSpDate, val: val)
                },
              ),
              _Sub(
                isSpValue: state.isSpValue,
                isDealPushValue: state.isDealPush,
                isChatPushValue: state.isChatPush,
                isAddPushValue: state.isAddPush,
                dealPushChanged: (val) => {
                  context.read<BananaAlertSettingBloc>().add(ChangeDeal(isDealPush: val))
                },
                chatPushChanged: (val) => {
                  context.read<BananaAlertSettingBloc>().add(ChangeChat(isChatPush: val))
                },
                addPushChanged: (val) => {
                  context.read<BananaAlertSettingBloc>().add(ChangeAdd(isAddPush: val))
                },

              ),
              _Setting(
                text: '광고성 정보 수신 설정',
                text2: state.isMpDate,
                isValue: state.isMpValue,
                onChanged: (val) => {
                  context.read<AlertSettingManager>().alertResult(context: context, isSp: false, originDate: state.isOriginMpDate, val: val)
                },
              ),

            ],
          ),
    );
  }
}

class _ViewMode extends StatelessWidget {
  const _ViewMode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaRouteCubit, BananaRouteState>(
      builder: (context, state) =>
        Column(
          children: [
            _Setting(
              text: '서비스 알림 수신 설정',
              text2: state.userVO.mEditDateSp,
              isValue: state.userVO.mSpPush == 'Y',
              onChanged: null,
            ),
            _Sub(
              isSpValue: state.userVO.mSpPush == 'Y',
              isDealPushValue: state.userVO.mAppPush == 'Y',
              isChatPushValue: state.userVO.mChatPush == 'Y',
              isAddPushValue: state.userVO.mGwanggoPush == 'Y',
              dealPushChanged: null, chatPushChanged: null, addPushChanged: null,

            ),
            _Setting(
              text: '광고성 정보 수신 설정',
              text2: state.userVO.mEditDateMp,
              isValue: state.userVO.mMpPush == 'Y',
              onChanged: null,
            ),

          ],
        ),
    );
  }
}

class _Sub extends StatelessWidget {
  final bool isSpValue;
  final bool isDealPushValue;
  final ValueChanged<bool>? dealPushChanged;
  final bool isChatPushValue;
  final ValueChanged<bool>? chatPushChanged;
  final bool isAddPushValue;
  final ValueChanged<bool>? addPushChanged;

  const _Sub({
    required this.isSpValue,
    required this.isDealPushValue,
    required this.dealPushChanged,
    required this.isChatPushValue,
    required this.chatPushChanged,
    required this.isAddPushValue,
    required this.addPushChanged,
  });

  @override
  Widget build(BuildContext context) {
    return isSpValue
        ? Column(
            children: [
              _SettingSub(
                text: '견적 알림',
                isValue: isDealPushValue,
                onChanged: dealPushChanged,
              ),
              _SettingSub(
                text: '채팅 알림',
                isValue: isChatPushValue,
                onChanged: chatPushChanged,
              ),
              _SettingSub(
                text: '문의 알림',
                isValue: isAddPushValue,
                onChanged: addPushChanged,
              ),
            ],
          )
        : const SizedBox();
  }
}

class _SettingSub extends StatelessWidget {
  final String text;
  final bool isValue;
  final ValueChanged<bool>? onChanged;
  const _SettingSub({
    required this.text,
    required this.isValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize widgetSize = context
        .read<VerseConfig>()
        .size;
    return Container(
        decoration: BoxDecoration(
          color: isValue ? white : Colors.grey.shade100,
        ),
        width: widgetSize.widthCommon,
        height: widgetSize.ratio58_4,
        padding: EdgeInsets.only(
            left: widgetSize.sized32grid,
            right: widgetSize.sized16grid
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BdTextWidget(text: text, textStyle: calloutBold,),
            _SwitchButton(value: isValue, onChanged: onChanged,)
          ],
        )
    );
  }
}


class _Setting extends StatelessWidget {
  final String text;
  final String text2;
  final bool isValue;
  final ValueChanged<bool>? onChanged;
  const _Setting({
    required this.text,
    required this.text2,
    required this.isValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize widgetSize = context
        .read<VerseConfig>()
        .size;
    return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        width: widgetSize.widthCommon,
        height: widgetSize.ratio58_4,
        padding: EdgeInsets.symmetric(
            horizontal: widgetSize.sized16grid
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BdTextWidget(
              text: text,
              textStyle: bodyBold,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widgetSize.sized8grid),
                child: BdTextWidget(
                  text: text2 == '' ? text2 : '($text2)',
                  textStyle: subGrey,
                ),
              ),
            ),
            _SwitchButton(value: isValue, onChanged: onChanged,)
          ],
        )
    );
  }
}

class _SwitchButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  const _SwitchButton({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize widgetSize = context
        .read<VerseConfig>()
        .size;
    return SizedBox(
      width: widgetSize.sizedBox70,
      height:  widgetSize.sizedBox40,
      child: FittedBox(
        fit: BoxFit.fill,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged ?? (val){
            context.read<AlertSettingManager>().changeEditeMode(context);
          },
          activeColor: yellow,
        ),
      ),
    );
  }
}
