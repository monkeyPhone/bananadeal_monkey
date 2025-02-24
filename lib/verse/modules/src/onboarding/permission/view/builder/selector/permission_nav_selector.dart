import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/state/bloc/banana_permission/banana_permission_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/view/builder/listener/permission_nav_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionNavSelector extends StatelessWidget {
  const PermissionNavSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaPermissionBloc, BananaPermissionState, bool>(
        selector: (state) => state.nextPage,
        builder: (context, nextPage) =>
        switch(nextPage){
          true => const BdDisabledButton(text: '잠시만 기다려주세요......',),
          _ =>
          const PermissionNavListener()
        }
    );
  }
}
