import 'package:banana_deal_by_monkeycompany/verse/core/fcm/state/cubit/banana_fcm/banana_fcm_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BroadListener extends StatelessWidget {
  const BroadListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaFcmCubit, BananaFcmState>(
            listener: (context, state){
              if(state.isStop){
                context.read<BroadManager>().appRouting(context);
              }
            },
          )
        ],
        child: const SizedBox()
    );
  }
}
