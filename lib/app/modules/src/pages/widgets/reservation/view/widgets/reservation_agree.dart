import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/controller/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';

class ReservationAgree extends GetView<ReservationController> {
  const ReservationAgree({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (sign) =>
              Column(
                children: [
                  RippleDecorationButton(
                      margin: EdgeInsets.symmetric(
                        horizontal: WidgetSize(context).sizedBox16,
                      ),
                      onTap: sign.value
                          ? (){
                        FocusScope.of(context).unfocus();
                        controller.setConfirm(false);
                      }
                          : (){
                        FocusScope.of(context).unfocus();
                        controller.setConfirm(true);
                      },
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:  WidgetSize(context).sizedBox8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: WidgetSize(context).sizedBox28,
                                width: WidgetSize(context).sizedBox28,
                                child: FittedBox(
                                  child: Center(
                                      child: Icon(
                                        sign.value
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: sign.value
                                                ? Colors.blue
                                                : Style.cocacolaRed,
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:  WidgetSize(context).sizedBox8,
                              ),
                              Text('개인정보 제3자 제공에 동의합니다.',
                                style: TextStyle(
                                    color:sign.value
                                        ? Colors.blue : Style.cocacolaRed,
                                    fontSize: WidgetSize(context).sizedBox18,
                                    fontWeight: FontWeight.w700
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: WidgetSize(context).sizedBox8,
                          ),

                        ],
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: WidgetSize(context).sizedBox16,
                      right: WidgetSize(context).sizedBox16,
                      bottom: WidgetSize(context).sizedBox16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('※  ',
                          style: TextStyle(
                            color: Style.greyWrite,
                            fontSize: WidgetSize(context).sizedBox15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('가입하신 정보는 약관에 따라 안전하게 보호되며, 딜 수락하신 매장에만 작성하신 방문정보가 전달됩니다.',
                                style: TextStyle(
                                  color: Style.greyWrite,
                                  fontSize: WidgetSize(context).sizedBox15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ],),
                  )
                ],
              )

        , controller.confirm);
  }
}
