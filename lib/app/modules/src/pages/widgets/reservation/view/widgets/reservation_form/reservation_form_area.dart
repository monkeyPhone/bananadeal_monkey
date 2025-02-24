import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/view/widgets/reservation_form/components/reservation_form_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/view/widgets/reservation_form/components/reservation_form_name.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../components/custom_text_form.dart';
import '../components/reservation_divider.dart';
import '../components/reservation_people_area.dart';

class ReservationFormArea extends StatelessWidget {
  const ReservationFormArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReservationDivider(mainText: '방문 고객', otherText: '* 필수'),
        ReservationPeopleArea(
            text: '방문자',
            widget: ReservationFormButton()
        ),
        ReservationPeopleArea(
            text: '성함',
            widget: ReservationFormName()
        ),
        ReservationPeopleArea(
            isbp: WidgetSize(context).sizedBox12,
            text: '연락처',
            widget: ReservationFormPhone()
        ),
      ],
    );
  }
}
