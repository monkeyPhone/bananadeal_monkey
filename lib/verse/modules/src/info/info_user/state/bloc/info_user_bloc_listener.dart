import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/banana_info_user/banana_info_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoUserBlocListener extends StatelessWidget {
  const InfoUserBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BananaInfoUserBloc, BananaInfoUserState>(
      listener: (context, state) {
        if(state.error != null) {
          context.read<InfoUserManager>().listenerError(text: state.error!.dioExceptionType, context: context);
        }
        if(state.isComplete){
          context.read<InfoUserManager>().listenerComplete(context);
        }
      },

      //여기 스낵바 끄는 방법 찾아보기.

      child: const SizedBox(),
    );
  }
}
