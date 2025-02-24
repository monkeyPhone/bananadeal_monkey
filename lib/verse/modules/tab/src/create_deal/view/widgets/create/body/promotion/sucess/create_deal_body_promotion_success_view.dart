import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/promotion/sucess/promotion_button/create_deal_body_promotion_success_button_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/promotion/sucess/promotion_form/create_deal_body_promotion_success_form_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_view_insets.dart';
import 'package:flutter/material.dart';

class CreateDealBodyPromotionSuccessView extends StatelessWidget {
  const CreateDealBodyPromotionSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BdLayoutViewInsets(
            child: Column(
              children: [
                CreateDealBodyPromotionSuccessButtonView(),
                BdCustomPad(padEnum: PadEnum.height16),
                BdCustomPad(padEnum: PadEnum.height16)
              ],
            )
        ),
        CreateDealBodyPromotionSuccessFormView(isRead: false,)
      ],
    );
  }
}