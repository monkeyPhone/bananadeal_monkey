import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term_body/sign2_term_body_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../sign2_term_controller.dart';

class Sign2TermBody extends GetView<Sign2TermController> {
  const Sign2TermBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
            () =>
                Padding(
                  padding: EdgeInsets.only(
                    left: WidgetSize(context).sizedBox5,
                    right: WidgetSize(context).sizedBox16
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                          4, (index) =>
                          Container(
                            margin: EdgeInsets.only(
                                top: index == 1 ?  WidgetSize(context).sizedBox8 : 0
                            ),
                            width: WidgetSize(context).widthCommon,
                            height: WidgetSize(context).sizedBox72,
                            decoration:
                            index == 0
                              ? BoxDecoration(
                              color: Colors.transparent,
                              border: Border(
                                bottom: BorderSide(
                                    width: WidgetSize(context).sizedBox1,
                                    color: Style.greyEAEAEA
                                )
                              )
                            )
                            : BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: RippleDecorationButton(
                              height: WidgetSize(context).sizedBox72,
                              inerMargin: EdgeInsets.symmetric(
                                  horizontal: WidgetSize(context).sizedBox8,
                              ),
                                onTap: (){
                                  controller.clickCheck(context, index);;
                                },
                                widget: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(children: [
                                      Container(
                                        margin: EdgeInsets.only(right: WidgetSize(context).sizedBox12),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(999)
                                        ),
                                        height: WidgetSize(context).sizedBox48,
                                        width: WidgetSize(context).sizedBox48,
                                        child: FittedBox(
                                          child: Padding(
                                            padding: EdgeInsets.all(WidgetSize(context).sizedBox6_5),
                                            child: Center(child: Icon(
                                              controller.checkValue(index) ? Icons.check_circle : Icons.circle_outlined ,
                                              color: controller.checkValue(index)  ? Style.yellow : Style.blackWrite,)),
                                          ),
                                        ),
                                      ),
                                      Sign2TermBodyText(
                                        index: index,
                                        color:  controller.checkValue(index)
                                            ? Style.blackWrite
                                            : Style.grey999999,
                                      ),
                                    ],),
                                   Icon(Icons.arrow_forward_ios_sharp, color: Style.ultimateGrey, size: WidgetSize(context).sizedBox22,)
                                  ],
                                )
                            ),
                          )
                      )
                    ],
                  ),
                )
    );
  }
}
