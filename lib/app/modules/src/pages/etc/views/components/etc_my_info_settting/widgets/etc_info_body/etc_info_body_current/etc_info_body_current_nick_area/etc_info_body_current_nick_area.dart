import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/widgets/etc_info_body/etc_info_body_current/etc_info_body_current_nick_area/etc_info_body_current_nick_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class EtcInfoBodyCurrentNickArea extends StatelessWidget {
  final String name;
  const EtcInfoBodyCurrentNickArea({
    required this.name,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Padding(
        padding: WidgetSize(context).paddingBodyWhole,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: WidgetSize(context).sizedBox62,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child:  Container(
                  width: WidgetSize(context).sizedBox200,
                  margin: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox28),
                  padding: WidgetSize(context).paddingBodyWhole,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Style.yellow,
                              width: WidgetSize(context).sizedBox1*1.5
                          )
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: WidgetSize(context).sizedBox5
                    ),
                    child: Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: WidgetSize(context).sizedBox17,
                              color: Style.blackWrite,
                              fontWeight: FontWeight.w700
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: WidgetSize(context).sizedBox5,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            EtcInfoBodyCurrentNickButton(
              name: name,
            ),
          ],
        ),
      ),
    );
  }
}
