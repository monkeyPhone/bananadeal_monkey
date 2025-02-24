import 'package:flutter/material.dart';

import '../../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class SignDivider extends StatelessWidget {
  const SignDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: WidgetSize(context).sizedBox16
      ),
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      child: Stack(
        children: [
          Center(
            child: Divider(
              thickness: WidgetSize(context).sizedBox1,
              color: Style.greyD9D9D9,
            ),
          ),
          Positioned(child: Center(
            child: Container(
              color: Style.white,
              width: WidgetSize(context).sign2w1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text14pxW400Color(
                    text: '또는',
                    color: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
