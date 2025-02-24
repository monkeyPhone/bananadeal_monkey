import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/manager/login_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/state/bloc/banana_login_form/banana_login_form_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/view/widgets/login_page/form/login_page_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginProviderView extends StatelessWidget {
  const LoginProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LoginManager>(
              create: (BuildContext context) =>
                  const LoginManager()
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaLoginFormBloc>(
                create: (BuildContext context) =>
                    BananaLoginFormBloc(
                        commonFunction: context.read<VerseConfig>().function
                    )
            )
          ],
          child: const   LoginPageFormView(),
        )
    );
  }
}

