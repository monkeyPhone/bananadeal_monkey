import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class SignChangeFindEmail extends StatelessWidget {
  final String email;
  final String domain;
  final int currentStep;
  const SignChangeFindEmail({
    super.key,
    required this.email,
    required this.domain,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return   MediaQuery.of(context).viewInsets.bottom > 0 && currentStep != 0
        ? SizedBox()
        : Container(
      padding: WidgetSize(context).paddingBodyWhole,
      width: WidgetSize(context).widthCommon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$email@$domain ',
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox18,
                color: Style.blackWrite,
                fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '계정의 비밀번호 재설정 중입니다.',
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox16,
                color: Style.blackWrite.withOpacity(0.8),
                fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          currentStep == 0   ? SizedBox(height: WidgetSize(context).width003,) : SizedBox(height: WidgetSize(context).width003,),
        ],
      ),
    );
  }
}
