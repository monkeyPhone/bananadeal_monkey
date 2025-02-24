import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class ReservationPeopleArea extends StatelessWidget {
  final String text;
  final Widget widget;
  final double? isbp;
  const ReservationPeopleArea({
    super.key,
    required this.text,
    required this.widget,
    this.isbp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(
            left: WidgetSize(context).sizedBox16,
            right: WidgetSize(context).sizedBox16,
          ),
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).sizedBox45,
          child: Row(
            children: [
              SizedBox(
                width: WidgetSize(context).sizedBox110,
                height: WidgetSize(context).sizedBox45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: WidgetSize(context).sizedBox16
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: WidgetSize(context).sizedBox20,
                            fontWeight: FontWeight.w600,
                            color: Style.blackWrite
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: widget)
            ],
          ),
        ),
        SizedBox(height: WidgetSize(context).sizedBox16,)
      ],
    );
  }
}
