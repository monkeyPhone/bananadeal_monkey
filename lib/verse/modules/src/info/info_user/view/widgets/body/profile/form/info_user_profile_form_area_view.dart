import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/banana_info_user/banana_info_user_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_width.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoUserProfileFormAreaView extends StatelessWidget {
  const InfoUserProfileFormAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BdCustomPad(padEnum: PadEnum.height32),
        _ProfileFormArea(),
      ],
    );
  }
}

class _ProfileFormArea extends StatelessWidget {
  const _ProfileFormArea();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaInfoUserBloc, BananaInfoUserState, String>(
        selector: (state)=> state.nickname,
        builder: (context, nickname)=> switch(nickname){
          '' => const _ProfileForm(),
          _ => _ProfileForm(nick: nickname,),
        }
    );
  }
}


class _ProfileForm extends StatefulWidget {
  final String? nick;
  const _ProfileForm({this.nick});

  @override
  State<_ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<_ProfileForm> {

  late final TextEditingController _nickNameController;

  @override
  void initState() {
    // TODO: implement initState
    _nickNameController = TextEditingController();
    if(widget.nick != null){
      _nickNameController.text = widget.nick!;
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nickNameController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BdTextFormCustom(
          size: size,
          width: size.widthCommon,
          onChanged: context.read<InfoUserManager>().onChangedNick(context: context),
          textController: _nickNameController,
          hintText: '닉네임을 입력해주세요.',
          enabled: true,
          onFieldSubmitted: context.read<InfoUserManager>().onChangedNick(context: context),
          keyboardType: TextInputType.name,
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
        const _ValidateAndButton(),
      ],
    );
  }
}

class _ValidateAndButton extends StatelessWidget {
  const _ValidateAndButton();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdLayoutWidth(
      child: BlocSelector<BananaInfoUserBloc, BananaInfoUserState, String>(
          selector: (state) => state.validate,
          builder: (context, validate) =>
          validate  != ''
              ?
          Row(
            mainAxisAlignment:  MainAxisAlignment.start,
            children: [
              BdTextWidget(
                text: validate,
                textStyle: subRed,
              ),
            ],
          ) :
          BlocSelector<BananaInfoUserBloc, BananaInfoUserState, String>(
              selector: (state) => state.nickname,
              builder: (context, nickName) =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nickName == '' || validate != ''
                          ?  const SizedBox()
                          : BdRippleButtonBasic(
                        onTap: (){
                          context.read<InfoUserManager>().checkNickName(context);
                          // await controller.sendName(controller.nickName.value);
                        },
                        padding: EdgeInsets.symmetric(vertical: size.sizedBox7_5, horizontal: size.sizedBox12),
                        color: yellow,
                        borderRadius:  BorderRadius.circular(size.sizedBox32),
                        child: Text('중복체크',
                          style: TextStyle(
                              color: brown,
                              fontSize: size.sizedBox14
                          ),
                        ),
                      )
                    ],
                  )
          )
      ),
    );
  }
}
