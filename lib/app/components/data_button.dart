import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/flutter_neumorphic.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';
import '../css/size.dart';

class DataButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  const DataButton({super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox52,
      width: WidgetSize(context).widthCommon*0.6,
      child: NeumorphicButton(
        onPressed: const AppOutsFunction().debounce(callback: onPressed),
        style: NeumorphicStyle(
          // depth: Get.width*0.01,
          // surfaceIntensity: 0,
          // intensity: 0.75,
          shadowDarkColor: Style.yellow.withOpacity(0.8),
          depth: WidgetSize(context).etc01,//Get.width*0.0187,
          intensity: 0.6,//0.86,
          surfaceIntensity: 0,//0.5,
          shape: NeumorphicShape.flat,
          color: Style.yellow,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(999)),
        ),
        child: Center(
            child: Text('데이터 불러오기',
              style: TextStyle(fontSize: WidgetSize(context).sizedBox17, color: Style.brown, fontWeight: FontWeight.w400),
        )
        )
      ),
    );
  }
}
