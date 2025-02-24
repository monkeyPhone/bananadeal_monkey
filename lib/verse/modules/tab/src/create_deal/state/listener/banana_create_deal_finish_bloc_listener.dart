import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_finish/banana_create_deal_finish_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BananaCreateDealFinishBlocListener extends StatelessWidget {
  const BananaCreateDealFinishBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BananaCreateDealFinishBloc, BananaCreateDealFinishState>(
      listener: (context, state){
        switch(state.apiStatus){
          case StatusEnum.success:
            context.read<CreateDealManager>().changeStepWidget(step: StepWidgetEnum.invite, context: context);
          case StatusEnum.initial:
            null;
          default:
            context.read<CreateDealManager>().showSnackBar(text: '잠시 후, 다시 시도해주세요.', context: context);
        }
      },
      child: const SizedBox(),
    );
  }
}
