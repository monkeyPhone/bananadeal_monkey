import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  final List<String>? display;
  const TimerText({super.key,
    this.display,
  });

  @override
  Widget build(BuildContext context) {
    final double size = display != null ?  WidgetSize(context).sizedBox39 : WidgetSize(context).sizedBox30;
    return SizedBox(
        height: size,
        width: WidgetSize(context).widthCommon,
        child: display != null
            ?  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _TextWidget1(
              text: display![0],
              size: size,
            ),
            _Pad2(),
            _TextWidget2(
              text: '시간',
              size: size,
            ),
            _Pad1(),
            _TextWidget1(
              text: display![1],
              size: size,
            ),
            _Pad2(),
            _TextWidget2(
              text: '분',
              size: size,
            ),
            _Pad1(),
            _TextWidget1(
              text: display![2],
              size: size,
            ),
            _Pad2(),
            _TextWidget2(
              text: '초',
              size: size,
            ),
            _Pad1(),
            _TextWidget2(
              text: '남음',
              size: size,
            ),
          ],
        ) : SizedBox(
          child: _TextWidget3(text: '종료된 딜입니다.', size: size,),
        )
    );
  }
}

class _Pad1 extends StatelessWidget {
  const _Pad1();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).sizedBox10,
    );
  }
}

class _Pad2 extends StatelessWidget {
  const _Pad2();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).sizedBox4,
    );
  }
}


class _TextWidget1 extends StatelessWidget {
  final String text;
  final double size;
  const _TextWidget1({
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Center(
              child: Text(text, style: TextStyle(
                  color: Style.bananaGreen,
                  fontSize: size, fontWeight: FontWeight.w600),),
            ))
    );
  }
}



class _TextWidget2 extends StatelessWidget {
  final String text;
  final double size;
  const _TextWidget2({
    required this.text,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size*0.9,
        child: FittedBox(
          alignment: Alignment.bottomCenter,
            fit: BoxFit.scaleDown,
            child: Center(
              child: Text(text, style: TextStyle(fontSize:size/1.75, fontWeight: FontWeight.w600,
              color: Style.bananaBack
              ),
                textAlign: TextAlign.center,
              ),
            ))
    );
  }
}

class _TextWidget3 extends StatelessWidget {
  final String text;
  final double size;
  const _TextWidget3({
    required this.text,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size*0.85,
        child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            child: Center(
              child: Text(text, style: TextStyle(fontSize:size/1.5, fontWeight: FontWeight.w700,
                  color: Style.greyWrite
              ),
                textAlign: TextAlign.center,
              ),
            ))
    );
  }
}