import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_address_form_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_button_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_main_top_text_Field.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_state_pages/sign4_default_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_state_pages/sign4_result_area.dart';
import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';

class Sign4CurrentPage extends StatelessWidget {
  final BuildContext mediaContext;
  const Sign4CurrentPage({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: WidgetSize(context).sizedBox8,),
        Sign4MainTopTextField(),
        SizedBox(height: WidgetSize(context).sizedBox28,),
        Sign4AddressFormAreaCurrent(),
        SizedBox(height: WidgetSize(context).sizedBox20,),
        MediaQuery.of(mediaContext).viewInsets.bottom > 0
            ? SizedBox()
            : Column(
                children: [
                  Sign4ButtonArea(),
                  SizedBox(height: WidgetSize(context).sizedBox34,),
                ],
        ),
        Expanded(
            child:
            MediaQuery.of(mediaContext).viewInsets.bottom > 0
                ? Sign4DefaultView()
                : Sign4ResultArea()
        ),
      ],
    );
  }
}
