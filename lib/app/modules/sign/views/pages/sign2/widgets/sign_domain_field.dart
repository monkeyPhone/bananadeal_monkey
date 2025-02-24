import 'package:flutter/material.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class SignDomainField extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  final Color color;
  final Color textColor;
  const SignDomainField({super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: Style.greyCCCCCC,
          width: WidgetSize(context).sizedBox1_5
      ),
      borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox10)),
    );
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              height: WidgetSize(context).etc0135,
              child: TextFormField(
                style: TextStyle(fontSize: WidgetSize(context).sizedBox14,),
                //비밀번호 입력할때,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(WidgetSize(context).sizedBox18),
                    fillColor: color,
                    filled: true,
                    enabled: false,
                    //모든 Input 상태의 기본 스타일 세팅
                    enabledBorder: baseBorder,
                    border: baseBorder,
                    disabledBorder: baseBorder,
                    focusedBorder: baseBorder.copyWith(
                        borderSide: baseBorder.borderSide.copyWith(
                          color: Style.yellow,
                        )
                    )
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.all(WidgetSize(context).sizedBox18),
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: WidgetSize(context).sizedBox14,),),
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
