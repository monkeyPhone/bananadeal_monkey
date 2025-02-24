import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate/banana_estimate_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate_option/banana_estimate_option_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateListener extends StatelessWidget {
  const EstimateListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaEstimateOptionBloc, BananaEstimateOptionState>(
              listener: (context, state) {
                if(state.statusEnum == StatusEnum.exception){
                  context.read<BananaEstimateBloc>().add(const FetchStatus());
                }
              }
          )
        ],
        child: const SizedBox());
  }
}
