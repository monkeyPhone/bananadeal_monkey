import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_deal.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/manager/estimate_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/components/component_estimate_detail_category.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/components/component_estimate_detail_content.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateDetailTerminalView extends StatelessWidget {
  const EstimateDetailTerminalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ComponentEstimateDetailCategory(
            title: '단말기',
            content: context.read<EstimateDetailManager>().estimate.dePsName
        ),
        ComponentEstimateDetailContent(
            title: '출고가',
            content: context.read<EstimateDetailManager>().func.switchEstimatePrice(
                price: context.read<EstimateDetailManager>().estimate.deFactoryPrice
            )
        ),
        const _Gongsi(),
        ComponentEstimateDetailContent(
            title: '기타할인',
            content: context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
                price: context.read<EstimateDetailManager>().estimate.deSale
            ),
          isColor: context.read<EstimateDetailManager>().func.resultIsColor(
              context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
              price: context.read<EstimateDetailManager>().estimate.deSale
            )
          ),
        ),
        ComponentEstimateDetailContent(
          title: context.read<EstimateDetailManager>().estimate.deInstallmentMonth == 0 
              ? '현금'
              : '할부원금',
          content: context.read<EstimateDetailManager>().func.switchEstimatePrice(
              price: context.read<EstimateDetailManager>().estimate.deInstallmentPrincipal
          ),
        ),
        const _Interest(),
        const _MonthCoast()
      ],
    );
  }
}


class _Gongsi extends StatelessWidget {
  const _Gongsi();

  @override
  Widget build(BuildContext context) {
    return context.read<EstimateDetailManager>().estimate.deSupportType == 'CHOICE'
            ? const SizedBox()
            : Column(
      children: [
        ComponentEstimateDetailContent(
          title: pay1,
          content: context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
              price: context.read<EstimateDetailManager>().estimate.deSupportPrice
          ),
          isColor: context.read<EstimateDetailManager>().func.resultIsColor(
              context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
                  price: context.read<EstimateDetailManager>().estimate.deSupportPrice
              )
          ),
        ),
        const _GongsiAdd(),
        const _ConvertSup(),
        const _ConvertSupAdd(),
      ],
    );
  }
}


class _GongsiAdd extends StatelessWidget {
  const _GongsiAdd();

  @override
  Widget build(BuildContext context) {
    final String deAddSupportPrice = context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
        price: context.read<EstimateDetailManager>().estimate.deAddSupportPrice
    );
    final bool isColor = context.read<EstimateDetailManager>().func.resultIsColor(deAddSupportPrice);
    return context.read<EstimateDetailManager>().estimate.deAddSupportPrice == 0
        ? const SizedBox()
        :   ComponentEstimateDetailContent(
      title: pay2,
      content: deAddSupportPrice,
      isColor: isColor,
    );
  }
}

class _ConvertSup extends StatelessWidget {
  const _ConvertSup();

  @override
  Widget build(BuildContext context) {
    final String deTransPrice = context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
        price: context.read<EstimateDetailManager>().estimate.deTransPrice
    );
    final bool isColor = context.read<EstimateDetailManager>().func.resultIsColor(deTransPrice);
    return context.read<EstimateDetailManager>().estimate.deTransYN == 'N' || context.read<EstimateDetailManager>().estimate.deTransPrice == 8
        ? const SizedBox()
        :   ComponentEstimateDetailContent(
      title: pay3,
      content: deTransPrice,
      isColor: isColor,
    );
  }
}

class _ConvertSupAdd extends StatelessWidget {
  const _ConvertSupAdd();

  @override
  Widget build(BuildContext context) {
    final String deAddTransPrice = context.read<EstimateDetailManager>().func.switchEstimatePriceMinus(
        price: context.read<EstimateDetailManager>().estimate.deAddTransPrice
    );
    final bool isColor = context.read<EstimateDetailManager>().func.resultIsColor(deAddTransPrice);
    return context.read<EstimateDetailManager>().estimate.deAddTransPrice == 0
        ? const SizedBox()
        :   ComponentEstimateDetailContent(
      title: pay4,
      content: deAddTransPrice,
      isColor: isColor,
    );
  }
}


class _Interest extends StatelessWidget {
  const _Interest();

  @override
  Widget build(BuildContext context) {
    return
      context.read<EstimateDetailManager>().estimate.deInstallmentMonth == 0
      ? const SizedBox()
      : ComponentEstimateDetailContent(
      title: '할부이자',
      content: context.read<EstimateDetailManager>().func.switchEstimatePrice(
          price: context.read<EstimateDetailManager>().estimate.deInstallmentInterest
      ),
        isPad: false,
    );
  }
}

class _MonthCoast extends StatelessWidget {
  const _MonthCoast();

  @override
  Widget build(BuildContext context) {
    return context.read<EstimateDetailManager>().estimate.deInstallmentMonth == 0
        ? const SizedBox()
        : Column(
      children: [
        const BdCustomPad(padEnum: PadEnum.height32),
        ComponentEstimateDetailContent(
          title: '월 할부금',
          content: context.read<EstimateDetailManager>().func.switchEstimatePrice(
              price: context.read<EstimateDetailManager>().estimate.deInstallmentMonthPrice
          ),
          isPad: false,
        )
      ],
    );
  }
}
