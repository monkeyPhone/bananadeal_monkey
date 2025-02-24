import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/manager/reset_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/state/bloc/banana_reset_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetBlocListener extends StatelessWidget {
  const ResetBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaResetBloc, BananaResetState>(
            listenWhen: (previousState, state){
              return previousState.dataDto.statusEnum != state.dataDto.statusEnum;
            },
            listener: (context, state){
              if(state.dataDto.error != null){
                context.read<ResetManager>().listenerCaseError(text: state.dataDto.error!.dioExceptionType, context: context);
              }
              if(state.otpProgressEnum == OtpProgressEnum.finish){
                context.read<ResetManager>().listenerFinish(context: context, email: state.email, pw: state.pw1);
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
