import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/model/action/maker_kind_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/maker_kind/model/maker_kind_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/mobile_data/model/action/mobile_data_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/mobile_data/model/mobile_data_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec/model/action/phone_spec_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec/model/phone_spec_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list/src/model_list_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/manager/model_list_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/state/bloc/banana_model_list/banana_model_list_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/view/widgets/body/model_list_body_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_icon_on_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModelListView extends StatelessWidget {
  final String tkIdx;
  final BuildContext routerContext;
  const ModelListView({super.key,
    required this.tkIdx,
    required this.routerContext
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [

          RepositoryProvider<PhoneSpecApiImpl>(
              create: (BuildContext context) =>
                  const PhoneSpecApiImpl(
                      action: PhoneSpecAction()
                  )
          ),

          RepositoryProvider<MakerKindApiImpl>(
              create: (BuildContext context) =>
                  const MakerKindApiImpl(
                      action: MakerKindAction()
                  )
          ),

          RepositoryProvider<MobileDataApiImpl>(
              create: (BuildContext context) =>
              const MobileDataApiImpl(
                  action: MobileDataAction()
              )
          ),

          RepositoryProvider<ModelListRepositoryImpl>(
            create: (BuildContext context) => ModelListRepositoryImpl(
                phoneSpecApi: context.read<PhoneSpecApiImpl>(),
                makerKindApi: context.read<MakerKindApiImpl>(),
                mobileDataApi: context.read<MobileDataApiImpl>(),
                monkeyUrl: context.read<VerseConfig>().url.monkeyUrl
            ),
          ),

          RepositoryProvider<ModelListManager>(
            create: (BuildContext context) => ModelListManager(
                tkIdx: tkIdx,
                routerContext: routerContext,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaModelListBloc>(
                create: (BuildContext context) =>
                BananaModelListBloc(
                    repository: context.read<ModelListRepositoryImpl>()
                )..add(InitModelList(tkIdx: tkIdx))
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
    return BlocSelector<BananaModelListBloc, BananaModelListState, StatusEnum>(
        selector: (state) => state.statusEnum,
        builder: (context, status) =>
            BdCanvas(
                canvasEnum: CanvasEnum.basic,
                appbar: ('단말기 선택하기', null, null,
                status == StatusEnum.initial
                    ? const SizedBox()
                    : const _SearchButton(),
                ),
                body: Column(
                  children: [
                    const BdCustomPad(padEnum: PadEnum.heightQuarter),
                    status == StatusEnum.initial
                        ? const _Initial()
                        : const ModelListBodyView(),
                  ],
                )
            )

    );
  }
}

class _Initial extends StatelessWidget {
  const _Initial();

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: BdLoadingSpin());
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaModelListBloc, BananaModelListState>(
        builder: (context, state) =>
            BdRippleIconOnButton(
                size: context.read<VerseConfig>().size,
                onTap: () {
                  List<String> keyword = [];
                  if(state.specList.samsung.isNotEmpty){
                    List<String> keyword1 = state.specList.samsung
                        .map((item) => item.psName
                    ).toList();
                    List<String> keyword2 = state.specList.apple
                        .map((item) => item.psName
                    ).toList();
                    List<String> keyword3 = state.specList.etc
                        .map((item) => item.psName
                    ).toList();

                    List<String> keyword4 = state.specList.samsung.
                    map((item) => item.psModel
                    ).toList();

                    List<String> keyword5 = state.specList.apple.
                    map((item) => item.psModel
                    ).toList();

                    List<String> keyword6 = state.specList.etc.
                    map((item) => item.psModel
                    ).toList();

                    keyword.addAll(keyword1);
                    keyword.addAll(keyword2);
                    keyword.addAll(keyword3);
                    keyword.addAll(keyword4);
                    keyword.addAll(keyword5);
                    keyword.addAll(keyword6);

                  }
                  if(state.mobileList.isNotEmpty){
                    List<String> keyword7 = state.mobileList
                        .map((item) => item.psName
                    ).toList();

                    List<String> keyword8 = state.mobileList
                        .map((item) => item.mdModel
                    ).toList();

                    keyword.addAll(keyword7);
                    keyword.addAll(keyword8);
                  }
                  context.read<ModelListManager>().gotoSearch(
                      context: context,
                      keyword: keyword,
                      readContext: context
                  );
                },
                padding: EdgeInsets.all(context.read<VerseConfig>().size.sizedBox11),
                icon: Icons.search
            )
    );
  }
}