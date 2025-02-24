import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/permission/src/permission_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/state/bloc/banana_permission/banana_permission_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionManager {

  const PermissionManager();

  void navButton(BuildContext context){
    context.read<BananaPermissionBloc>().add(const PermissionRequestAll());
  }


  void leadingButton(BuildContext context){
    context.read<VerseConfig>().route.closeDialog(context);
  }

  void listenerResult(BuildContext context)
    => context.read<VerseConfig>().route.appRouting(context);

  void lifecycleResume(BuildContext context) =>  context.read<BananaPermissionBloc>().add(const PermissionFetched());


}
