import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';


class Sign2TermBodyText extends StatelessWidget {
  final int index;
  final Color color;
  const Sign2TermBodyText({
    super.key,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        switch(index){
          0 => '전체동의',
          1 => '(필수) 서비스 이용약관',
          2 => '(필수) 개인정보 취급동의',
          3 => '(필수) 위치기반 서비스 이용동의',
          _ => ''
        },
        style: TextStyle(
          color: color,
          fontSize:  WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
