import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_body/helper/sign2_route_no.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_body/helper/sign_form/sign_login_form_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'helper/sign_form/sign_pass_form_area.dart';

class Sign2Body extends StatelessWidget {
  const Sign2Body({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView2Controller>(
        builder: (controller) =>
            Stack(
              children: [
                Sign2RouteNo(),
                Positioned(
                  child:
                  controller.currentTap.value == 0 || controller.confirm.value
                      ? Container(
                    color: Style.white,
                    height: MediaQuery.of(context).viewInsets.bottom > 0 && MediaQuery.of(context).viewInsets.bottom > WidgetSize(context).deviceMent
                        ? WidgetSize(context).heightCommon
                        : 0,
                  )
                      : SizedBox(),
                ),

                Positioned(
                    child:
                    MediaQuery.of(context).viewInsets.bottom > 0 && MediaQuery.of(context).viewInsets.bottom > WidgetSize(context).deviceMent
                        ?   Padding(
                        padding: EdgeInsets.only(
                            right: WidgetSize(context).sizedBox16,
                            left: WidgetSize(context).sizedBox16,
                            top: WidgetSize(context).sizedBox8
                        ),
                        child: controller.currentTap.value == 0
                            ? SignLoginFormArea()
                            : controller.confirm.value && controller.currentTap.value == 1
                            ? SignPassFormArea()
                            : SizedBox()
                    )
                        :   SizedBox()
                )
              ],
            )
    );
  }
}
