import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/widgets/etc_obx_value_main.dart';
import 'package:flutter/material.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';

class EtcView extends StatelessWidget {
  const EtcView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Style.white,
              border: Border(
                  bottom: BorderSide(
                      width: WidgetSize(context).sizedBox1,
                      color: Style.greyDDDDDD
                  )
              )
          ),
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).sizedBox62,
          child: Padding(
            padding: EdgeInsets.only(
                left: WidgetSize(context).sizedBox16
            ),
            child: Row(
              children: [
                Text('더 보기',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: WidgetSize(context).sizedBox24
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: EtcObxValueMain()
        )
      ],
    );
  }
  
}
