import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth/banana_auth_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/manager/login_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/state/bloc/banana_login_form/banana_login_form_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormButtonBuilder extends StatelessWidget {
  const LoginFormButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaAuthBloc, BananaAuthState, StatusEnum>(
        selector: (state) => state.dataDto.statusEnum,
        builder: (context, status) =>
          status == StatusEnum.success
              ? const BdDisabledButton(text: '로그인 진행중...')
              :
            BlocBuilder<BananaLoginFormBloc, BananaLoginFormState>(
                builder:  (context, state) {
                  if ((state.email == '' || state.pw == '') || state.validate != '' || status == StatusEnum.success){
                    return const BdDisabledButton(text: '로그인');
                  }
                  else{
                    return  BdNeoButton(
                      size: context.read<VerseConfig>().size,
                      text: '로그인',
                      onPressed: () {
                        context.read<LoginManager>().postEmailLogin(context: context, email: state.email, pw: state.pw);
                      },
                    );
                  }
                }
            )
    );
  }
}
