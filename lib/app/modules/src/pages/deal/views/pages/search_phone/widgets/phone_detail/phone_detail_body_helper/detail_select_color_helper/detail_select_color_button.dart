import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/detail_select_color.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/deal/model_detail_data.dart';


class DetailSelectColorButton extends StatelessWidget {
  final int phoneImgLegth;
  final List<PhoneImg> phoneImg;
  const DetailSelectColorButton({
    required this.phoneImgLegth,
    required this.phoneImg,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: List.generate(phoneImgLegth,
              (index) =>
              Row(
                children: [
                  DetailSelectColor(
                    piColorHax: phoneImg[index].piColorHax,
                    index: index,
                  ),
                  SizedBox(width: WidgetSize(context).sizedBox16,)
                ],
              )

      ).toList(),
    );;
  }
}
