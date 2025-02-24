import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/manager/estimate_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/components/component_estimate_detail_category.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/components/component_estimate_detail_content.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateDetailRateView extends StatelessWidget {
  const EstimateDetailRateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ComponentEstimateDetailCategory(
            title: '요금제',
            content: context.read<EstimateDetailManager>().estimate.dePlan
        ),
        ComponentEstimateDetailContent(
            title: '월정액',
            content: context.read<EstimateDetailManager>().func.switchEstimatePrice(
                price: context.read<EstimateDetailManager>().estimate.dePlanBasic
            )
        ),
        const _Choice(),
        const _RatePlanDiscount(),
        const _WelfareDiscount(),
        const _Promotion(),
        const _MonthRate()
      ],
    );
  }
}

class _Choice extends StatelessWidget {
  const _Choice();

  @override
  Widget build(BuildContext context) {
    return context.read<EstimateDetailManager>().estimate.deSupportType != 'CHOICE'
      ?  const SizedBox()
      :  Column(
          children: [
            const _AgreementMonth(),
            ComponentEstimateDetailContent(
                title: '선택약정할인',
                content: context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
                    price: context.read<EstimateDetailManager>().estimate.deOptionalSale
                ),
                isColor: context.read<EstimateDetailManager>().func.resultIsColor(
                    context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
                        price: context.read<EstimateDetailManager>().estimate.deOptionalSale
                    )
                ),
            ),
            ],
    );
  }
}


class _AgreementMonth extends StatelessWidget {
  const _AgreementMonth();

  @override
  Widget build(BuildContext context) {
    return context.read<EstimateDetailManager>().estimate.deOptionalMonth == ''
    ? const SizedBox()
    : ComponentEstimateDetailContent(
        title: '약정개월',
        content: context.read<EstimateDetailManager>().estimate.deOptionalMonth == '0'
            ? '무약정'
            : '${context.read<EstimateDetailManager>().estimate.deOptionalMonth}개월'
    );
  }
}

class _RatePlanDiscount extends StatelessWidget {
  const _RatePlanDiscount();

  @override
  Widget build(BuildContext context) {
    final String deAgreementSale = context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
        price: context.read<EstimateDetailManager>().estimate.deAgreementSale
    );
    final bool isColor = context.read<EstimateDetailManager>().func.resultIsColor(deAgreementSale);
    return isColor ?
      ComponentEstimateDetailContent(
      title: '요금약정할인',
      content: deAgreementSale,
      isColor: isColor,
    ) : const SizedBox();
  }
}

class _WelfareDiscount extends StatelessWidget {
  const _WelfareDiscount();

  @override
  Widget build(BuildContext context) {
    final String deWelfareSale = context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
        price: context.read<EstimateDetailManager>().estimate.deWelfareSale
    );
    final bool isColor = context.read<EstimateDetailManager>().func.resultIsColor(deWelfareSale);
    return isColor ?
    ComponentEstimateDetailContent(
      title: '요금약정할인',
      content: deWelfareSale,
      isColor: isColor,
    ) : const SizedBox();
  }
}


class _Promotion extends StatelessWidget {
  const _Promotion();

  @override
  Widget build(BuildContext context) {
    final bool isOk =
        context.read<EstimateDetailManager>().estimate.dePromotionName.isNotEmpty &&
            context.read<EstimateDetailManager>().estimate.dePromotionSale.isNotEmpty;
    String title(int index) => context.read<EstimateDetailManager>().estimate.dePromotionName[index];
    String content(int index) => context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
        price: int.parse(context.read<EstimateDetailManager>().estimate.dePromotionSale[index])
    );
    bool isColor(int index) => context.read<EstimateDetailManager>().func.resultIsColor(content(index));

    return  isOk ?
    Column(
      children: [
        ...List.generate(
            context.read<EstimateDetailManager>().estimate.dePromotionName.length,
            (index) =>
            context.read<EstimateDetailManager>().estimate.dePromotionName[index] != '' &&
                context.read<EstimateDetailManager>().estimate.dePromotionSale[index] != '0'
            ? ComponentEstimateDetailContent(
              title: title(index),
              content: content(index),
              isColor: isColor(index),
            ) : const SizedBox()
        ).toList()
      ],
    ) : const SizedBox();
  }
}

class _MonthRate extends StatelessWidget {
  const _MonthRate();

  @override
  Widget build(BuildContext context) {
    final bool isOk =
        context.read<EstimateDetailManager>().estimate.dePromotionName.isNotEmpty &&
            context.read<EstimateDetailManager>().estimate.dePromotionSale.isNotEmpty;
    final String deMonthPrice = context.read<EstimateDetailManager>().func.switchEstimatePrice(
        price: context.read<EstimateDetailManager>().estimate.deMonthPrice
    );
    return Column(
      children: [
        BdCustomPad(padEnum:  isOk ? PadEnum.height24 : PadEnum.height32),
        ComponentEstimateDetailContent(
            title: '월 요금',
            content: deMonthPrice,
          isPad: false,
        ),
      ],
    );
  }
}
