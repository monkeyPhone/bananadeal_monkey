import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../routes/const_element.dart';

class ChatSendInvited extends StatelessWidget {
  const ChatSendInvited({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox28),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: WidgetSize(context).sizedBox34,
                maxHeight: double.infinity,
                minWidth: WidgetSize(context).widthCommon,
                maxWidth: WidgetSize(context).widthCommon

            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                color: Style.yellow
            ),
            padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                color: Style.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _svgPic(AppElement.iconBanana, context),
                  _pad8(context),
                  Text(
                    '초대장을 보냈어요!'
                    ,
                    style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400, color: Style.brown),
                  ),
                  _pad8(context),
                  _svgPic(AppElement.iconBanana2, context),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }

  Widget _pad8(BuildContext context){
    return SizedBox(
      width: WidgetSize(context).sizedBox8,
    );
  }

  Widget _svgPic(String asset, BuildContext context){
    return SvgPicture.asset(asset, width: WidgetSize(context).sizedBox14, height: WidgetSize(context).sizedBox13,);
  }



}
