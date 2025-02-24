import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/auth/model/action/auth_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/auth/model/auth_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/sign/src/sign_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/manager/sign_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/state/bloc/banana_sign/banana_sign_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/view/builder/builder/sign_progress_src_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignProviderView extends StatelessWidget {
  const SignProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthApiImpl>(
              create: (BuildContext context) =>
              const AuthApiImpl(
                action: AuthAction(),
              )
          ),
          RepositoryProvider<SignRepositoryImpl>(
              create: (BuildContext context) =>
                  SignRepositoryImpl(
                      authApi: context.read<AuthApiImpl>(),
                      commonFunction: context.read<VerseConfig>().function,
                      dio: context.read<VerseConfig>().dio
                  )
          ),
          RepositoryProvider<SignManager>(
              create: (BuildContext context) =>
                  const SignManager()
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaSignBloc>(
                  create: (BuildContext context) =>
                  BananaSignBloc(
                    repository: context.read<SignRepositoryImpl>()
                  )
              )
            ],
            child: const SignProgressSrcBuilder()
        )
    );
  }
}

