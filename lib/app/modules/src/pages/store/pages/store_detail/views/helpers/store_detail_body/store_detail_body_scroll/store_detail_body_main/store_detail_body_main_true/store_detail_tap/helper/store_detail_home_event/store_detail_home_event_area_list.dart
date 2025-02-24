import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../styles/image_data.dart';


class StoreDetailHomeEventAreaList extends StatelessWidget {
  final List storeEvent;
  final List storeIcon;
  const StoreDetailHomeEventAreaList({
    required this.storeEvent,
    required this.storeIcon,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) =>
      storeEvent[index] == '' &&  storeIcon[index] == ''
          ? SizedBox()
          : Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox7_5)),
            elevation: WidgetSize(context).sizedBox4,
            surfaceTintColor: Style.white,
            child: Container(
              constraints: BoxConstraints(
                minHeight: WidgetSize(context).height60px,
                maxHeight: double.infinity,
                minWidth: WidgetSize(context).width0921,
                maxWidth: WidgetSize(context).width0921,
              ),
              margin: EdgeInsets.all(WidgetSize(context).sizedBox10,),
              child: Row(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child:
                    Container(
                        padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
                        color: Style.white,
                        child: storeIcon[index] == ''
                            ? ImageData2('assets/images/icons/store/3.svg', WidgetSize(context).sizedBox34+WidgetSize(context).sizedBox5)
                            : ImageData2('assets/images/icons/store/${storeIcon[index]}.svg', WidgetSize(context).sizedBox34+WidgetSize(context).sizedBox5)
                    ),
                  ),
                  SizedBox(width: WidgetSize(context).sizedBox12,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(

                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: storeEvent[index] == ''
                                ? ''
                                : storeEvent[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: WidgetSize(context).sizedBox17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: WidgetSize(context).sizedBox14,)
        ],
      )
      ).toList(),
    );
  }
}
