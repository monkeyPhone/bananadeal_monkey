import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth/banana_auth_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/bd_loading_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLoadingSelector extends StatelessWidget {
  const AuthLoadingSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaAuthBloc, BananaAuthState, StatusEnum>(
        selector: (state) => state.dataDto.statusEnum,
        builder: (context, status) => switch(status){
          StatusEnum.loading => const BdLoadingCont(),
          _ => const SizedBox()
        }
    );
  }
}
