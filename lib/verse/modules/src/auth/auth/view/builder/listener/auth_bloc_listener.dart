import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/manager/auth_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth/banana_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaAuthBloc, BananaAuthState>(
            // listenWhen: (previousState, state){
            //   return previousState.loginEntity.statusEnum != state.loginEntity.statusEnum;
            // },
            listener: (context, state) async{
              if(state.dataDto.statusEnum == StatusEnum.success) {
                if(state.checkLogin != ''){
                  context.read<AuthManager>().listenerCaseSuccess(context);
                }
              }
              else if(state.dataDto.error != null){
                context.read<AuthManager>().listenerError(text: state.dataDto.error!.dioExceptionType, context: context);
              }
            },
          ),
        ],
        child: const SizedBox()
    );
  }
}