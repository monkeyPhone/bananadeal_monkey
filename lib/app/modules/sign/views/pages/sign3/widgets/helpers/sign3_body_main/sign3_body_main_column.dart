import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_main/sign3_body_hide/sign3_body_hide_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_main/sign3_body_main_top_text_area/sign3_body_main_top_text_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_main/sign3_body_nick_form/sign3_body_nick_form_area.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';



class Sign3BodyMainColumn extends StatelessWidget {
  final BuildContext mediaContext;
  const Sign3BodyMainColumn({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Sign3BodyMainTopTextArea(),
        Sign3BodyHideArea(mediaContext: mediaContext,),
        SizedBox(height: WidgetSize(context).sizedBox34,),
        Sign3BodyNickFormArea(),
      ],
    );
  }

}
