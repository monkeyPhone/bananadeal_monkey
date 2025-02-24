import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/manager/login_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/view/builder/builder/login_form_button_builder.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/view/builder/selector/login_form_pw_lock_selector.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/view/builder/selector/login_form_validate_selector.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/view/builder/selector/login_sns_button_selector.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/view/widgets/login_page/form/login_form_email.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_view_insets.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageFormView extends StatefulWidget {
  const LoginPageFormView({super.key});

  @override
  State<LoginPageFormView> createState() => _LoginPageFormViewState();
}

class _LoginPageFormViewState extends State<LoginPageFormView> {
  late final TextEditingController _emailController;
  late final TextEditingController _pwController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BdCustomPad(padEnum: PadEnum.height16),
        LoginFormEmail(textEditingController: _emailController,),
        const BdCustomPad(padEnum: PadEnum.height12),
        LoginFormPwLockSelector(textEditingController: _pwController,),
        const LoginFormValidateSelector(),
        const LoginFormButtonBuilder(),
        BdLayoutViewInsets(
          child: Column(
            children: [
              _GotoReset(
                email: _emailController,
                pw: _pwController,
              ),
              _SnsLogin()
            ],
          ),
        )
      ],
    );
  }
}

class _GotoReset extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController pw;
  const _GotoReset({
    required this.email,
    required this.pw
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: EdgeInsets.only(top: size.sizedBox18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BdTextWidget(text: '비밀번호가 기억나지 않나요?', textStyle: sub,),
          SizedBox(width: size.sizedBox8,),
          BdRippleButtonBasic(
              onTap: (){
                context.read<LoginManager>().gotoOtp(
                  context: context,
                  email: email,
                  pw: pw
                );
              },
              margin: EdgeInsets.all(size.sizedBox7_5),
              border: Border(bottom: BorderSide(width: size.sizedBox1, color: brown)),
              child: const BdTextWidget(text: '비밀번호 재발급 받기', textStyle: subBrown,)
          )
        ],
      ),
    );
  }
}



class _SnsLogin extends StatelessWidget {
  const _SnsLogin();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _SnsDivider(),
        SizedBox(
          height: context.read<VerseConfig>().size.sizedBox10,
        ),
        const LoginSnsButtonSelector()
      ],
    );
  }
}


class _SnsDivider extends StatelessWidget {
  const _SnsDivider();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.sizedBox16
      ),
      width: size.widthCommon,
      height: size.height60px,
      child: Stack(
        children: [
          Center(
            child: Divider(
              thickness: size.sizedBox1,
              color: greyD9D9D9,
            ),
          ),
          Positioned(
              child: Center(
                child: Container(
                  color: white,
                  width: size.sign2w1,
                  child:  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BdTextWidget(
                        text: '또는',
                        textStyle: subBrown,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}



