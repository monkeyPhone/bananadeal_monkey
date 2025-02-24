import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/create_deal/model/action/create_deal_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/create_deal/model/create_deal_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/create_deal/src/create_deal_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_finish/banana_create_deal_finish_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_init/banana_create_deal_init_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/finish_deal/view/finish_deal_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/view/invite_deal_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/create_deal_create_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_indexed_stack_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealView extends StatelessWidget {
  final int mIdx;
  final void Function() createCallback;
  final (String psIdx, String ldcpName, String ldcpModel, String piPath)? selectModel;
  const CreateDealView({super.key,
    required this.mIdx,
    required this.selectModel,
    required this.createCallback,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CreateDealApiImpl>(
              create: (BuildContext context) =>
              const CreateDealApiImpl(
                action: CreateDealAction(),
              )
          ),
          RepositoryProvider<CreateDealRepositoryImpl>(
              create: (BuildContext context) =>
              CreateDealRepositoryImpl(
                api: context.read<CreateDealApiImpl>(),
                commonFunction: context.read<VerseConfig>().function,
                url: context.read<VerseConfig>().url,
                dio: context.read<VerseConfig>().dio,
              )
          ),
          RepositoryProvider<CreateDealManager>(
            create: (BuildContext context) => CreateDealManager(
                mIdx: mIdx,
              createCallback: createCallback
            ),

          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaCreateDealInitBloc>(
              create: (BuildContext context) => BananaCreateDealInitBloc()..add(
                  InitInfo(selectModel: selectModel)
              ),
            ),
            BlocProvider<BananaCreateDealBloc>(
              create: (BuildContext context) => BananaCreateDealBloc(
                  repository: context.read<CreateDealRepositoryImpl>()
              )..add(SetModel(selectModel: selectModel ?? ('','','',''))),
            ),
            BlocProvider<BananaCreateDealFinishBloc>(
              create: (BuildContext context) => BananaCreateDealFinishBloc(
                  repository: context.read<CreateDealRepositoryImpl>()
              ),
            ),
          ],
          child: const _Canvas(),
        )
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaCreateDealInitBloc, BananaCreateDealInitState, StepWidgetEnum>(
      selector: (state) => state.stepWidget,
      builder: (context, step) =>
        switch(step){
          StepWidgetEnum.deal => const CreateDealCreateView(),
          StepWidgetEnum.invite => const InviteDealView(),
          StepWidgetEnum.finish => const FinishDealView()
        },
    );
  }
}