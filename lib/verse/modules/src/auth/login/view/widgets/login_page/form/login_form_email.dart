import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/manager/login_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormEmail extends StatelessWidget {
  final TextEditingController textEditingController;
  const LoginFormEmail({super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdTextFormCustom(
      width: size.widthCommon,
      autofocus: false,
      onChanged: context.read<LoginManager>().formSubmitEmail(
        context: context,
        isDebounce: true,
      ),
      onFieldSubmitted: context.read<LoginManager>().formSubmitEmail(
        context: context,
        isDebounce: false,
      ),
      textController: textEditingController,
      keyboardType: TextInputType.emailAddress,
      enabled: true,
      hintText: '이메일',
      size: size,
    );
  }
}