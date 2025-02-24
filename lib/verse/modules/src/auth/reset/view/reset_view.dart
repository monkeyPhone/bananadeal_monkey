import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/auth/model/action/auth_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/auth/model/auth_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/reset/src/reset_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/manager/reset_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/state/bloc/banana_reset_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/view/builder/builder/reset_progress_src_builder.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/view/builder/listener/reset_bloc_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_view_insets.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_top_text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetView extends StatelessWidget {
  final TextEditingController emailC;
  final TextEditingController pwC;
  final BuildContext routerContext;
  const ResetView({super.key,
    required this.emailC,
    required this.pwC,
    required this.routerContext,
  });

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
          RepositoryProvider<ResetRepositoryImpl>(
              create: (BuildContext context) =>
                  ResetRepositoryImpl(
                      authApi: context.read<AuthApiImpl>(),
                      commonFunction: context.read<VerseConfig>().function,
                      dio: context.read<VerseConfig>().dio
                  )
          ),
          RepositoryProvider<ResetManager>(
              create: (BuildContext context) =>
                  ResetManager(
                      emailC: emailC,
                      pwC: pwC,
                      routerContext: routerContext
                  )
          )
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaResetBloc>(
                  create: (BuildContext context) =>
                      BananaResetBloc(
                          repository: context.read<ResetRepositoryImpl>()
                      )
              ),
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
    return const BdCanvas(
      canvasEnum: CanvasEnum.reset,
      listener: ResetBlocListener(),
      appbar: ('', null, null, null),
      body:  _Body(),
      isForm: true,
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.read<VerseConfig>().size.sizedBox16),
      child: Column(
        children: [
          BdLayoutViewInsets(
              child: BdTopTextArea(
                size: context.read<VerseConfig>().size,
                text1: '비밀번호가 기억나지 않나요?',
                text2: '이메일 인증을 진행해주세요.',
                isZero: true,
              )
          ),
          const ResetProgressSrcBuilder()
        ],
      ),
    );
  }
}


