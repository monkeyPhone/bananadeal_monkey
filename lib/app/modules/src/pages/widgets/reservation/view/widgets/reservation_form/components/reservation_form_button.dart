import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/controller/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const/const_info.dart';

class ReservationFormButton extends GetView<ReservationController> {
  const ReservationFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (people) =>
                Row(
                  children: [
                    Expanded(
                      child: _ReservationRippleButton(
                          color: switch(people.value){
                            InfoString.reservationMe => Style.yellow,
                            InfoString.reservationOther => Style.white,
                            _ => Style.white
                          },
                          text: InfoString.reservationMe,
                          onTap: (){
                            controller.peopleUpdate(InfoString.reservationMe);
                          }
                      ),
                    ),
                    SizedBox(
                      width: WidgetSize(context).sizedBox8,
                    ),
                    Expanded(
                      child: _ReservationRippleButton(
                          color: switch(people.value){
                            InfoString.reservationMe => Style.white,
                            InfoString.reservationOther => Style.yellow,
                            _ => Style.white
                          },
                          text: InfoString.reservationOther,
                          onTap: (){
                            controller.peopleUpdate(InfoString.reservationOther);
                          }
                      ),
                    ),
                  ],
                )
        , controller.reservationPeople
    );
  }
}


class _ReservationRippleButton extends StatelessWidget {
  final Color color;
  final String text;
  final GestureTapCallback onTap;
  const _ReservationRippleButton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        color: color,
        padding: EdgeInsets.symmetric(
          horizontal: WidgetSize(context).sizedBox8
        ),
        onTap: onTap,
        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox16),
        border: Border.all(
            width: WidgetSize(context).sizedBox1_5,
            color: switch(color){
              Style.yellow =>  Style.yellow,
              _ => Style.greyCCCCCC
              }
            ),
        widget: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: WidgetSize(context).sizedBox18,
                  fontWeight: FontWeight.w400,
                  color: Style.blackWrite
              ),
            ),
          ),


        )
    );
  }
}

