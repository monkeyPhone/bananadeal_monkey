import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_status.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class EstimateEndStatusBarText extends StatelessWidget {
  final String dealStatus;
  const EstimateEndStatusBarText({
    required this.dealStatus,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      dealStatus == ''
      ?  '로딩중'
          :
      dealStatus == '에러'
      ? '나중에 다시 시도해주세요.'
          :
      '$dealStatus된 딜이에요',
      style: TextStyle(
          color: Style.ultimateGrey,
          fontSize: WidgetSize(context).sizedBox10,
          fontWeight: FontWeight.w400
      ),
    );
  }
}
