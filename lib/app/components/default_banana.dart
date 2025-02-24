import 'package:banana_deal_by_monkeycompany/app/components/data_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';
import '../css/size.dart';


class DefaultBanana extends StatelessWidget {
  final GestureTapCallback onPressed;

  const DefaultBanana({
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //125 95
        Text('현재 접속이 원활하지 않습니다',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox20,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        ),
        Text('',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox20,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        ),
        Text('일시적인 오류로 서버와 연결이 끊겼습니다.',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox17,
              fontWeight: FontWeight.w700,
              color: Style.greyWrite
          ),
        ),
        Text('아래 버튼을 눌러 다시 시도 해주세요.',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox17,
              fontWeight: FontWeight.w700,
              color: Style.greyWrite
          ),
        ),
        Text('\n',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox20,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        ),
        DataButton(
          onPressed: onPressed,
        )
      ],
    );
  }
}

class DefaultBananaStack extends StatelessWidget {
  final GestureTapCallback onPressed;

  const DefaultBananaStack({
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //125 95
        Text('현재 접속이 원활하지 않습니다',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox20,
              fontWeight: FontWeight.w700,
              color: Style.white
          ),
        ),
        Text('',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox20,
              fontWeight: FontWeight.w700,
              color: Style.white
          ),
        ),
        Text('일시적인 오류로 서버와 연결이 끊겼습니다.',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox17,
              fontWeight: FontWeight.w700,
              color: Style.white
          ),
        ),
        Text('아래 버튼을 눌러 재접속해주세요.',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox17,
              fontWeight: FontWeight.w700,
              color: Style.white
          ),
        ),
        Text('\n',
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox20,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        ),
        RippleDecorationButton(
            color: Style.yellow,
            borderRadius: BorderRadius.circular(999),
            height: WidgetSize(context).sizedBox52,
            width: WidgetSize(context).widthCommon*0.6,
            onTap: onPressed,
            widget: Center(
                child: Text('재접속',
                  style: TextStyle(fontSize: WidgetSize(context).sizedBox17, color: Style.brown, fontWeight: FontWeight.w400),
                )
            )
        )
      ],
    );
  }
}