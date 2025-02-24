import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/manager/estimate_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateDetailCategoryView extends StatelessWidget {
  const EstimateDetailCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BdCustomPad(padEnum: PadEnum.height12),
        const _Store(),
        const BdCustomPad(padEnum: PadEnum.height32),
        _Category(
            title: '가입 유형',
            content: context.read<EstimateDetailManager>().estimate.deType
          ),
        _Category(
            title: '개통 통신사',
            content: context.read<EstimateDetailManager>().switchEstimateJoinTkIdx()
        ),
        _Category(
            title: '통신사 할인',
            content: context.read<EstimateDetailManager>().switchEstimateSupType()
        ),
        const _PlanSrc(),
        _Category(
            isPad: false,
            title: '할부개월',
            content: context.read<EstimateDetailManager>().switchEstimateDeInstalmentMonth()
        ),
      ],
    );
  }
}

class _PlanSrc extends StatelessWidget {
  const _PlanSrc();

  @override
  Widget build(BuildContext context) {
    return context.read<EstimateDetailManager>().switchEstimateSupType() == '공시지원'
            ? const _Plan()
            : const SizedBox();
  }
}


class _Plan extends StatelessWidget {
  const _Plan();

  @override
  Widget build(BuildContext context) {
    final (String, String) plan = context.read<EstimateDetailManager>().switchEstimateDeContractPlan();
    return  _Category(title: plan.$1, content: plan.$2);

  }
}


class _Category extends StatelessWidget {
  final String title;
  final String content;
  final bool? isPad;
  const _Category({
    required this.title,
    required this.content,
    this.isPad
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BdTextWidget(
              text: title,
              textStyle: titleLittleBold,
            ),
            const BdCustomPad(padEnum: PadEnum.width32),
            const BdCustomPad(padEnum: PadEnum.width32),
            Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: BdTextWidget(
                    text: content,
                    textStyle: titleLittleBold,
                  ),
                )
            )
          ],
        ),
        isPad == false ? const SizedBox() : const BdCustomPad(padEnum: PadEnum.height16),
      ],
    );
  }
}


class _Store extends StatelessWidget {
  const _Store();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BdTextWidget(
          text: '매장명',
          textStyle: titleButtonBold,
        ),
        const BdCustomPad(padEnum: PadEnum.width32),
        const BdCustomPad(padEnum: PadEnum.width32),
        Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: BdTextWidget(
                text: context.read<EstimateDetailManager>().estimate.smStoreName,
                textStyle: titleButtonBold,
              ),
            )
        )
      ],
    );
  }
}
