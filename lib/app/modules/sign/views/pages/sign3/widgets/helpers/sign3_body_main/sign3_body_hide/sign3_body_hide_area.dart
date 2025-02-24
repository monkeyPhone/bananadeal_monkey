import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_main/sign3_body_hide/sign3_avatar/sign3_body_avatar.dart';
import 'package:flutter/material.dart';

class Sign3BodyHideArea extends StatelessWidget {
  final BuildContext mediaContext;
   const Sign3BodyHideArea({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(mediaContext).viewInsets.bottom > 0
        ? SizedBox()
        : Column(
          children: [
            SizedBox(height: WidgetSize(context).sizedBox34,),
            Sign3BodyAvatar(),
          ],
        );
  }
}
