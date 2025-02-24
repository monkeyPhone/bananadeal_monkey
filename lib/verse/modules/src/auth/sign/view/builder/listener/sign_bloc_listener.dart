import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/manager/auth_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/manager/sign_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/state/bloc/banana_sign/banana_sign_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignBlocListener extends StatelessWidget {
  const SignBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaSignBloc, BananaSignState>(
            listenWhen: (previousState, state){
              return previousState.dataDto.statusEnum != state.dataDto.statusEnum;
            },
            listener: (context, state){
              if(state.dataDto.error != null){
                context.read<SignManager>().listenerCaseError(text: state.dataDto.error!.dioExceptionType, context: context);
              }
              if(state.otpProgressEnum == OtpProgressEnum.finish){
                context.read<AuthManager>().postEmailLogin(context: context, email: state.email, pw: state.pw1);
              }
              // if(state.otpProgressEnum == OtpProgressEnum.finish){
              //   context.read<OtpManager>().listenerCaseFinish(context);
              // }
              // if(state.otpProgressEnum == OtpProgressEnum.finish){
              //   context.read<LoginManager>().postEmailLogin(email: state.email, pw: state.pw, context: context);
              // }
            },

          ),
        ],
        child: const SizedBox()
    );
  }
}
