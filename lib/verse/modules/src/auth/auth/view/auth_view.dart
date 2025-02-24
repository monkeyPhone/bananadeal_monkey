import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/login/model/action/login_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/login/model/login_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/login/src/login_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/manager/auth_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth/banana_auth_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/state/bloc/banana_auth_route/banana_auth_route_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/view/builder/listener/auth_bloc_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/view/builder/selector/auth_loading_selector.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/view/builder/selector/auth_progress_src_selector.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_view_insets.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_top_text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  final bool isCanPop;
  const AuthView({
    super.key,
    required this.isCanPop,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LoginApiImpl>(
              create: (BuildContext context) =>
              const LoginApiImpl(
                action: LoginAction(),
              )
          ),
          RepositoryProvider<LoginRepositoryImpl>(
            create: (BuildContext context) =>
                LoginRepositoryImpl(
                    dio: context.read<VerseConfig>().dio,
                    provider: context.read<VerseConfig>().cache.authCacheProvider,
                    api: context.read<LoginApiImpl>(),
                    commonFunction: context.read<VerseConfig>().function
                ),
          ),

          RepositoryProvider<AuthManager>(
              create: (BuildContext context) =>
                  AuthManager(
                    isCanPop: isCanPop
                  )
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaAuthBloc>(
                  create: (BuildContext context) =>
                      BananaAuthBloc(
                          repository: context.read<LoginRepositoryImpl>()
                      )
              ),
              BlocProvider<BananaAuthRouteBloc>(
                  create: (BuildContext context) =>
                      BananaAuthRouteBloc(
                          dialog: context.read<VerseConfig>().browser.dialog,
                          route: context.read<VerseConfig>().route,
                          tab: context.read<VerseConfig>().tab
                      )
              )
            ],
            child: const _Canvas()
        )
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return BdCanvas(
        canvasEnum: CanvasEnum.basic,
        customFunction: (){
          context.read<AuthManager>().backSpace(context);
        },
        listener: const AuthBlocListener(),
        appbar: ('', null, null, null),
        isForm: true,
        body: const _BodySrc()
    );
  }
}

class _BodySrc extends StatelessWidget {
  const _BodySrc();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _Body(),
        AuthLoadingSelector()
      ],
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: context.read<VerseConfig>().size.sized16grid),
      physics: const ClampingScrollPhysics(),
      children: const [
        _TopTextArea(),
        AuthProgressSrcSelector()
      ],
    );
  }
}


class _TopTextArea extends StatelessWidget {
  const _TopTextArea();

  @override
  Widget build(BuildContext context) {
    return  BdLayoutViewInsets(
      child:  BdTopTextArea(
        text1: '안녕하세요!',
        text2: '바나나딜에 오신 것을 환영해요!',
        isZero: true,
        size: context.read<VerseConfig>().size,
      ),
    );
  }
}


