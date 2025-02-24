import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';


class Sign3BodyMainTopTextArea extends StatelessWidget {
  const Sign3BodyMainTopTextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidgetSize(context).widthCommon,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '자신을 표현해보세요.',
              style: TextStyle(
                fontSize: WidgetSize(context).sizedBox24,
                color: Style.blackWrite,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: WidgetSize(context).sizedBox8,),
            RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              text: TextSpan(
                  text: '바나나딜에서 사용할 이미지와 닉네임을 설정해주세요.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: WidgetSize(context).sizedBox16,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
