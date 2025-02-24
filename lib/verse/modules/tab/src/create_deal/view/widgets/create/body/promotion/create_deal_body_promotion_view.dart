import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/promotion/model/action/promotion_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/promotion/model/promotion_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/promotion/src/promotion_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_promotion/banana_create_deal_promotion_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/promotion/sucess/create_deal_body_promotion_success_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodyPromotionView extends StatelessWidget {
  const CreateDealBodyPromotionView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BananaCreateDealBloc, BananaCreateDealState>(
        builder: (context, state) =>
              MultiRepositoryProvider(
                providers: [
                  RepositoryProvider<PromotionApiImpl>(
                      create: (BuildContext context) =>
                          const PromotionApiImpl(
                              action: PromotionAction(),
                          )
                  ),
                  RepositoryProvider<PromotionRepositoryImpl>(
                      create: (BuildContext context)=> PromotionRepositoryImpl(
                          api: context.read<PromotionApiImpl>(),
                          url: context.read<VerseConfig>().url,
                          dio: context.read<VerseConfig>().dio
                      )
                  )
                ],
              child: BlocProvider<BananaCreateDealPromotionBloc>(
                create: (context) => BananaCreateDealPromotionBloc(
                    repository: context.read<PromotionRepositoryImpl>()
                )..add(InitPromotion(tkIdx: state.requestAgency, psIdx: state.selectModel.$1)),
                child: const _Body(),
              ),
            )
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<BananaCreateDealPromotionBloc, BananaCreateDealPromotionState, StatusEnum>(
        selector: (state) => state.statusEnum,
        builder: (context, statusEnum) =>
        switch(statusEnum){
          StatusEnum.initial => const _Initial(),
          StatusEnum.success => const CreateDealBodyPromotionSuccessView(),
          _ =>   const _Default()
        }
    );
  }
}


class _Initial extends StatelessWidget {
  const _Initial();

  @override
  Widget build(BuildContext context) {

    return const Column(
      children: [
        BdCustomPad( padEnum: PadEnum.height16),
        BdCustomPad( padEnum: PadEnum.height16),
        BdCustomPad( padEnum: PadEnum.height16),
        BdLoadingSpin()
      ],
    );
  }
}

class _Default extends StatelessWidget {
  const _Default();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BdCustomPad( padEnum: PadEnum.height16),
        const BdCustomPad( padEnum: PadEnum.height16),
        const BdCustomPad( padEnum: PadEnum.height16),
        BlocBuilder<BananaCreateDealBloc, BananaCreateDealState>(
            builder: (context, state) =>
                BdRippleButtonBasic(
                    onTap: (){
                      context.read<BananaCreateDealPromotionBloc>().add(InitPromotion(tkIdx: state.requestAgency, psIdx: state.selectModel.$1));
                    },
                    child: const BdTextWidget(
                      text: '다시 시도',
                    )
                )
        )

      ],
    );
  }
}

