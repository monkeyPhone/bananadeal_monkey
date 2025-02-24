import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/sign_change_auth/helper/sign_change_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign_pad/sign_pad.dart';
import 'package:flutter/material.dart';
import '../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import 'helper/sign_top_textfield.dart';


class SignChangeAuthBody extends StatelessWidget {
  final String email;
  final String domain;
  const SignChangeAuthBody({super.key,
    required this.email,
    required this.domain,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BasicAppbar(title: Text('')),
        Expanded(
          child: Container(
              padding: WidgetSize(context).paddingBodyWhole,
              width: WidgetSize(context).widthCommon,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SignTopTextField(),
                    SignPad8(),
                    SignPad8(),
                    SignChangeArea(email: email, domain: domain,),
                  ],
                ),
              )
          ),
        ),
        Container(
          color: Style.white,
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).height60px,
        )
      ],
    );
  }
}
