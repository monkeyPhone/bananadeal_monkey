import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/info_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/components/components_info_setting_page.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/components/components_info_setting_title.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/nick_name/state/bloc/banana_nick_name/banana_nick_name_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoSettingTabNicknameDialog extends StatelessWidget {
  final BuildContext routerContext;
  final InfoEditRepository repository;
  const InfoSettingTabNicknameDialog({super.key,
    required this.routerContext,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BananaNickNameBloc>(
        create: (BuildContext context) =>
            BananaNickNameBloc(
                repository: repository,
                routerContext: routerContext
            ),
      child: const _Dialog(),
    );
  }
}


class _Dialog extends StatelessWidget {
  const _Dialog();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Dialog(
        backgroundColor: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
        ),
        child: const BdLayoutPadding(
          padding: PaddingEnum.dialog,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ComponentsInfoSettingTitle(title: '닉네임 변경'),
              _Alert(),
              _Form(),
              _Validate(),
              _Button()
            ],
          ),
        ),
      ),
    );
  }
}

class _Alert extends StatelessWidget {
  const _Alert();

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BdTextWidget(
          text: '닉네임은 2글자 이상 10글자 이하의 \n 영문, 숫자 혹은 완성된 한글만 가능합니다.',
          textStyle: subBrown,
          textAlign: TextAlign.start,
          maxLines: 3,
        ),
        BdCustomPad(padEnum: PadEnum.height20)
      ],
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  late final TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return ComponentsInfoSettingPage(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 8,
            child: BdTextFormCustom(
              onChanged: (val){
                context.read<BananaNickNameBloc>().add(const InitNickname());
              },
                size: size,
                enabled: true,
                textController: _controller),
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BdRippleButtonBasic(
                    height: size.sizedBox42,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.sized16grid,
                    ),
                    borderRadius: BorderRadius.circular(999),
                    color: yellow,
                    onTap: (){
                      FocusScope.of(context).unfocus();
                      context.read<BananaNickNameBloc>().add(CheckDuplication(name: _controller.text, context: context));
                    },
                    child: const Center(
                      child: BdTextWidget(
                        text: '확인',
                        textStyle: subBrown,
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class _Validate extends StatelessWidget {
  const _Validate();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaNickNameBloc, BananaNickNameState, String>(
        selector: (state) => state.validate, 
        builder: (context, validate) => 
            validate == ''
                ? BlocSelector<BananaRouteCubit, BananaRouteState, String>(
                selector: (state) => state.userVO.mName,
                builder: (context, mName) =>
                    BlocSelector<BananaNickNameBloc, BananaNickNameState, String>(selector: (state) => state.nickName,
                        builder: (context, nickName) =>
                            ComponentsInfoSettingPage(
                                child: nickName ==''
                              ? const Center(
                                child: BdLayoutPadding(
                                    padding: PaddingEnum.horizontal,
                                    child: BdTextWidget(text: '변경하실 닉네임을 입력한 이 후, 확인 버튼을 눌러 변경 가능 여부를 확인해주세요.', textStyle: subBrown, maxLines: 2, textAlign: TextAlign.center,)),
                              )
                               :


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const BdTextWidget(text: '변경 전', textStyle: caption,),
                                        const BdCustomPad(padEnum: PadEnum.height2),
                                        BdTextWidget(text: mName, textStyle: body,),
                                      ],
                                    ),
                                    const BdCustomPad(padEnum: PadEnum.width32),
                                    nickName == '' ? const SizedBox()
                                    : Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const BdTextWidget(text: '변경 후', textStyle: caption,),
                                            const BdCustomPad(padEnum: PadEnum.height2),
                                            BdTextWidget(text: nickName, textStyle: bodyBold,),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                            )
                    )
            )
                : ComponentsInfoSettingPage(
                child: Center(
                  child: BdLayoutPadding(
                      padding: PaddingEnum.horizontal,
                      child: BdTextWidget(text: validate, textStyle: subRed, maxLines: 2,)),
                )
            )
    );
  }
}


class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return ComponentsInfoSettingPage(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           BlocSelector<BananaNickNameBloc, BananaNickNameState, String>(
               selector: (state) => state.nickName,
               builder: (context, nickName) =>
                  nickName == ''
                ?  BdDisabledButton(
                      height: size.sizedAppbar,
                      textSize: size.titleLittle,
                      text: '변경하기')
                :  BdNeoButton(
                        size: size,
                       fontSize: size.titleLittle,
                       height: size.sizedAppbar,
                       onPressed: (){
                         context.read<BananaNickNameBloc>().add(ConfirmNickName(context: context));
                       }, text: '변경하기'
                   ),
           )
          ],
        ));
  }
}

