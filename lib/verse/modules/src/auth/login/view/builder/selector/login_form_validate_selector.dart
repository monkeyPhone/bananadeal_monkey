
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/state/bloc/banana_login_form/banana_login_form_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormValidateSelector extends StatelessWidget {
  const LoginFormValidateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<BananaLoginFormBloc, BananaLoginFormState, String>(
        selector: (state) => state.validate,
        builder: (context, validate) =>
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.read<VerseConfig>().size.sizedBox8,),
              child: BdTextWidget(
                text: validate,
                textStyle: validate == '' ? subWhite : subRed,),
            )
    );
  }
}
