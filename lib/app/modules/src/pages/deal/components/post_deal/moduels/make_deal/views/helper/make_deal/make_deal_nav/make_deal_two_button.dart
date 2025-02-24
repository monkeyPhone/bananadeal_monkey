import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';

class MakeDealTwoButton extends GetView<MakeDealController> {
  final int page;
  const MakeDealTwoButton({
    required this.page,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidgetSize(context).widthCommon,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 3,
            child: RippleDecorationButton(
                onTap: controller.onTapTwoBack,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                    color: Style.yellow,
                    width: WidgetSize(context).sizedBox2),
                height: WidgetSize(context).height60px,
                padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox20),
                widget: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '이전 단계로',
                      style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
            )

          ),
          SizedBox(width: WidgetSize(context).sizedBox16),
          Flexible(
            flex: 6,
            child: ObxValue((page)
            =>
                RippleDecorationButton(
                    padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox20),
                    onTap: controller.twoButtonOntapNext,
                    borderRadius: BorderRadius.circular(999),
                    color: controller.twoButtonColor(),
                    height: WidgetSize(context).height60px,
                    widget: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          page.value == 10
                              ? '딜 요청하러 가기'
                              : '다음 단계로',
                          style: TextStyle(
                              fontSize: WidgetSize(context).sizedBox18,
                              fontWeight:   page.value == 10
                                  ? FontWeight.w600 : FontWeight.w400),
                        ),
                      ),
                    )
                ), controller.currentStep)
          )
        ],
      ),
    );
  }
}
