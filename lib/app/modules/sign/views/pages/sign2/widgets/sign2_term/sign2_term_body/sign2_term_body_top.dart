import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class Sign2TermBodyTop extends StatelessWidget {
  const Sign2TermBodyTop({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontSize: WidgetSize(context).sizedBox17,
        fontWeight: FontWeight.w400,
        color: Style.greyWrite
    );
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Padding(
        padding: EdgeInsets.all(
            WidgetSize(context).sizedBox16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '바나나딜에서 제공하는 서비스를 이용하시려면',
              style: textStyle,
            ),
            SizedBox(
              height: WidgetSize(context).sizedBox3,
            ),
            Text(
              '아래의 약관 동의 후, 회원가입이 필요해요.',
              style: textStyle,
            ),
          ],
        ),

      ),
    );
  }
}

class Sign2TermBodyBottom extends StatelessWidget {
  const Sign2TermBodyBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontSize: WidgetSize(context).sizedBox15,
        fontWeight: FontWeight.w400,
        color: Style.greyWrite
    );
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Padding(
        padding: EdgeInsets.symmetric(
        vertical: WidgetSize(context).sizedBox16,
        horizontal: WidgetSize(context).sizedBox32
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '필수약관에 동의하지 않으시면,',
              style: textStyle,
            ),
            SizedBox(
              height: WidgetSize(context).sizedBox3,
            ),
            Text(
              '회원가입이 제한됩니다.',
              style: textStyle,
            ),
            SizedBox(
              height: WidgetSize(context).sizedBox17,
            ),
            Text(
              '약관 동의 후, 회원가입을 완료하면',
              style: textStyle,
            ),
            SizedBox(
              height: WidgetSize(context).sizedBox3,
            ),
            Text(
              '바나나딜 서비스 이용이 가능합니다.',
              style: textStyle,
            ),
          ],
        ),

      ),
    );
  }
}
