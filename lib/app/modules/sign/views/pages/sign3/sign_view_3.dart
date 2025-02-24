import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_main/sign3_body_main_column.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_bottom_nav/sign3_bottom_nav.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_positioned/sign3_body_positioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';
import '../../../controllers/sign_view_3_controller.dart';

class SignView3 extends GetView<SignView3Controller> {
  const SignView3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if(didPop){
          return;
        }
      },
      child: GestureDetector(
              onTap: () {
                controller.touchScreen();
              },
              child: Scaffold(
                backgroundColor: Style.white,
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Style.white,
                  toolbarHeight: WidgetSize(context).height60px,
                  surfaceTintColor: Style.white,
                  actions: [],
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: Stack(
                          children: [
                            Padding(
                              padding: WidgetSize(context).paddingBodyWhole,
                              child: SingleChildScrollView(
                                  child: Sign3BodyMainColumn(
                                    mediaContext: context,
                                  )
                              ),
                            ),
                            Sign3BodyPositioned()
                          ],
                        )
                    ),
                    SizedBox(
                      height: WidgetSize(context).sizedBox1,
                    )
                  ],
                ),
                bottomNavigationBar: Sign3BottomNav()
              ),
            ),
    );
  }

}
