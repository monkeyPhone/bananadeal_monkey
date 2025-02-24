import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';



class ActiveAddressList extends StatelessWidget {

  final GestureTapCallback onTap;
  final String road;
  final String jibun;
  const ActiveAddressList({
    Key? key,

    required this.onTap,
    required this.road,
    required this.jibun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: WidgetSize(context).sizedBox5,
            vertical: WidgetSize(context).sizedBox8
        ),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).width03,
        decoration: BoxDecoration(
          color: Colors.transparent,
            border: Border(
              bottom: BorderSide(width: WidgetSize(context).sizedBox1_5, color: Style.greyLine),
            ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            listTile('도로명', road, context),
            listTile(' 지번 ', jibun, context)
          ],
        ),
      ),
    );
  }

  Widget listTile(String text, String addinfo, BuildContext context) {
    return Expanded(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox8, vertical: WidgetSize(context).width00025),
              decoration: BoxDecoration(
                  border: Border.all(color: Style.yellow, width: WidgetSize(context).width00025),
                  borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox50)
              ),
              child: Text(text,
                style: TextStyle(fontSize: WidgetSize(context).width00234, color: Style.brown, fontWeight:  FontWeight.w400
                ),
              ),
            ),
            SizedBox(width: WidgetSize(context).sizedBox6),
            Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  strutStyle: StrutStyle(fontSize: WidgetSize(context).sizedBox14),
                  text: TextSpan(
                      text:
                      addinfo,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: WidgetSize(context).sizedBox14,
                          )),
                )
            ),
          ],
        )
    );
  }

}