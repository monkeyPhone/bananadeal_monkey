import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/create_deal_body_age_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/create_deal_body_current_agency_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/create_deal_body_finish_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/create_deal_body_rec_model_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/create_deal_body_rec_rate_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/create_deal_body_request_agency_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/create_deal_body_select_model_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/create_deal_body_select_rate_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/promotion/create_deal_body_promotion_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/nav/create_deal_create_nav_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_view_insets.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_step_progress_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_indexed_stack_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealCreateView extends StatelessWidget {
  const CreateDealCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
        canvasEnum: CanvasEnum.createDeal,
        appbar: ('딜 만들기', null, null, null),
        body: _Body(),
        isForm: true,
        navbarWidget: CreateDealCreateNavView()
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return  BdLayoutPadding(
        padding: PaddingEnum.progressBar,
        child: BlocSelector<BananaCreateDealBloc, BananaCreateDealState, StepEnum>(
            selector: (state) => state.step,
            builder: (context, step) =>
               BdUiIndexedStackAnimated(
                 index: step.index,
                 children:  [
                   const _IndexedBody(step: StepEnum.age),
                   const _IndexedBody(step: StepEnum.currentAgency),
                   const _IndexedBody(step: StepEnum.requestAgency),
                   const _IndexedBody(step: StepEnum.selectModel),
                   const _IndexedBody(step: StepEnum.recModel),
                   const _IndexedBody(step: StepEnum.selectRate),
                   const _IndexedBody(step: StepEnum.recRate),
                   _Promotion(step: step,),
                   const _IndexedBody(step: StepEnum.finish),
                 ],
               )
        )
    );
  }
}

class _Promotion extends StatelessWidget {
  final StepEnum step;
  const _Promotion({
    required this.step
  });

  @override
  Widget build(BuildContext context) {
    return step != StepEnum.promotion
        ? const SizedBox()
        : const _IndexedBody(step: StepEnum.promotion);
  }
}



class _IndexedBody extends StatelessWidget {
  final StepEnum step;
  const _IndexedBody({
    required this.step,
});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        _Progress(
          size: size,
          step: step,
        ),
        Expanded(
            child: BdLayoutPadding(
                padding: PaddingEnum.verticalOri,
                child: _CanvasBody(step: step,)
            )
        )
      ],
    );
  }
}

class _Progress extends StatelessWidget {
  final StepEnum step;
  final CommonSize size;
  const _Progress({
    required this.step,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return BdLayoutViewInsets(
      child: Column(
        children: [
          BdStepProgressIndicator(
            totalSteps: 9,
            currentStep: step.index+1,
            padding: 0.01,
            unselectedColor: greyD9D9D9,
            selectedColor: yellow,
            size: size.titleMain,
            roundedEdges: Radius.circular(size.widthCommon),
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          const BdCustomPad(padEnum: PadEnum.height16),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: BdTextWidget(
              text: switch(step){
                StepEnum.age => '개통하시는 분의 연령대는요?',
                StepEnum.currentAgency => '현재 이용하고 있는 통신사는요?',
                StepEnum.requestAgency => '개통을 원하는 통신사가 있나요?',
                StepEnum.selectModel => '구매하고 싶은 단말기가 있나요?',
                StepEnum.recModel => '추천 받을 단말기를 선택해주세요.',
                StepEnum.selectRate => '이용하고 싶은 요금제가 있나요?',
                StepEnum.recRate => '추천 받을 요금제를 선택해주세요.',
                StepEnum.promotion => '추가로 요청하실 내용이 있나요?',
                StepEnum.finish => '아래 내용으로 딜을 만들게요.',
              },
              textStyle: titleMainBold,
            ),
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
        ],
      ),
    );
  }
}

class _CanvasBody extends StatelessWidget {
  final StepEnum step;
  const _CanvasBody({
    required this.step
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          switch(step){
            StepEnum.age => const CreateDealBodyAgeView(),
            StepEnum.currentAgency => const CreateDealBodyCurrentAgencyView(),
            StepEnum.requestAgency => const CreateDealBodyRequestAgencyView(),
            StepEnum.selectModel => const CreateDealBodySelectModelView(),
            StepEnum.recModel => const CreateDealBodyRecModelView(),
            StepEnum.selectRate => const CreateDealBodySelectRateView(),
            StepEnum.recRate => const CreateDealBodyRecRateView(),
            StepEnum.promotion => const CreateDealBodyPromotionView(),
            StepEnum.finish => const CreateDealBodyFinishView(),
          }
        ],
      ),
    );
  }
}

