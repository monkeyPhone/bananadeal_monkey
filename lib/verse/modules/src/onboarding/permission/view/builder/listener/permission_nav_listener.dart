import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/manager/permission_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/state/bloc/banana_permission/banana_permission_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../config/verse/verse.dart';

class PermissionNavListener extends StatelessWidget {
  const PermissionNavListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BananaPermissionBloc, BananaPermissionState>(
        listenWhen: (previous, current) {
          // 특정 조건을 반환 (true면 listener 호출)
          return current != previous;
        },
        listener: (context, state){
          if(state.nextPage){
            context.read<PermissionManager>().listenerResult(context);
          }
        },
        child: BdNeoButton(
          size: context.read<VerseConfig>().size,
          text: '계속하기',
          onPressed: () {
            context.read<PermissionManager>().navButton(context);
          },
        ),
    );
  }
}
