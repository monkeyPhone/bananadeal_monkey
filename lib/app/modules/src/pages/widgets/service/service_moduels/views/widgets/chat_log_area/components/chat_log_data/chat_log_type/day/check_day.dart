import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../css/style.dart';


class CheckDay extends StatelessWidget {
  final String regdate;
  final bool? isDate;
  const CheckDay({
    required this.regdate,
    this.isDate,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).sign2w1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: WidgetSize(context).sizedBox1_5,
                          color: isDate == true ? Style.grey999999 : Style.greyEAEAEA,
                        )
                    )
                ),
                height: WidgetSize(context).sizedBox26,
                width: WidgetSize(context).widthCommon,
              ),
            ],
          ),
        ),
        Positioned.fill(
            child: Center(
              child: Container(
                padding:
                isDate == true ? EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox8)
                    : EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox18 ,vertical: WidgetSize(context).sizedBox6),
                decoration: BoxDecoration(
                    color:  isDate == true ? Style.greyEAEAEA : Colors.black26,
                    borderRadius: BorderRadius.circular(isDate == true ? 0 : WidgetSize(context).sizedBox12)
                ),
                child: Text(
                  isDate == true
                      ?
                  DateFormat('yyyy년 MM월 dd일').format(DateTime.parse(regdate
                  ).toLocal())
                      :
                  regdate
                  ,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: WidgetSize(context).sizedBox14,
                      color: isDate == true ? Style.grey999999 : Style.white
                  ),
                ),
              ),
            )
        )
      ],
    );
  }
}
