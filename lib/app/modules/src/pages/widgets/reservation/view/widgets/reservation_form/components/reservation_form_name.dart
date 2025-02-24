import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/controller/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class ReservationFormName extends GetView<ReservationController>{
  const ReservationFormName({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (name) =>
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField3(
                          contentPadding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox10),
                          enabled: true,
                          onChanged: controller.nameForm,
                          textController: controller.nameController,
                          borderColor: name.value != '' ? Style.yellow : null,
                      ),
                    ),
                    SizedBox(width: WidgetSize(context).extendsGap,)
                  ],
                )
        , controller.reservationName);
  }
}
//텍스트 필드 다 바꾸기
class ReservationFormPhone extends GetView<ReservationController>{
  const ReservationFormPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return  ObxValue(
            (phone) =>
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField3(
                        enabled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox10),
                        onChanged: controller.phoneForm,
                        textController: controller.phoneController,
                        keyboardType: TextInputType.number,
                        borderColor: phone.value != '' ? Style.yellow : null,
                      ),
                    ),
                    SizedBox(width: WidgetSize(context).extendsGap,)
                  ],
                )
        , controller.reservationPhone
    );
  }
}
