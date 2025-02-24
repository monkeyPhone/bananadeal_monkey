import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/manager/login_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/state/bloc/banana_login_form/banana_login_form_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_search_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormPwLockSelector extends StatelessWidget {
  final TextEditingController textEditingController;
  const LoginFormPwLockSelector({super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaLoginFormBloc, BananaLoginFormState, bool>(
        selector: (state) => state.lock,
        builder: (context, lock) =>
            BdTextFormCustom(
              size: size,
              width: size.widthCommon,
              textController: textEditingController,
              onChanged: context.read<LoginManager>().formSubmitPw(context: context, isDebounce: true),
              onFieldSubmitted: context.read<LoginManager>().formSubmitPw(context: context, isDebounce: false),
              keyboardType: TextInputType.text,
              enabled: true,
              obscureText: lock,
              hintText: '비밀번호',
              autofocus: false,
              suffixIcon: BdRippleSearchButton(
                lock: lock,
                onTap: (){
                  context.read<LoginManager>().updateLockEvent(context);
                },
                size: size,
              ),
            )
    );
  }
}
