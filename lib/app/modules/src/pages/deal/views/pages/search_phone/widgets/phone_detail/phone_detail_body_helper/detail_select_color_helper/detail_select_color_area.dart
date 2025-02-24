import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_select_color_helper/detail_select_color_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_select_color_helper/detail_select_color_name.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/deal/model_detail_data.dart';

class DetailSelectColorArea extends StatelessWidget {
  final int currentColor;
  final int phoneImgLegth;
  final List<PhoneImg> phoneImg;
  const DetailSelectColorArea({
    required this.currentColor,
    required this.phoneImgLegth,
    required this.phoneImg,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailSelectColorName(phoneImg: phoneImg[currentColor]),
        Padding(
          padding: EdgeInsets.only(
            left: WidgetSize(context).sizedBox34,
            right: WidgetSize(context).width001,
            bottom: WidgetSize(context).sizedBox30,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DetailSelectColorButton(
              phoneImgLegth: phoneImgLegth,
              phoneImg: phoneImg,
            )
          ),
        ),
      ],
    );
  }
}
