import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/deal/model_detail_data.dart';

class DetailSelectColorName extends StatelessWidget {
  final PhoneImg phoneImg;
  const DetailSelectColorName({
    required this.phoneImg,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox20),
      child: Text(
        phoneImg.piColorName,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: WidgetSize(context).sizedBox20
        ),
      ),
    );
  }
}
