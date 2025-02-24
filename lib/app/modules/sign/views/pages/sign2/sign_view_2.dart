import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_appbar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_body/sign2_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../css/style.dart';
import '../../../controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';


class SignView2 extends GetView<SignView2Controller> {
  const SignView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: BasicCanvas(
          canPop: false,
          onPopInvoked: (bool didPop, Object? result) async{
            if(didPop){
              return;
            }
             controller.srcBackFunc(context);
          },
          body: Column(
            children: [
              Sign2Appbar(),
              Expanded(
                  child: Container(
                    color: Style.white,
                    child: SafeArea(
                      child: Sign2Body(),
                    ),
                  ),
              )
            ],
          ),
        )
    );
  }

}
