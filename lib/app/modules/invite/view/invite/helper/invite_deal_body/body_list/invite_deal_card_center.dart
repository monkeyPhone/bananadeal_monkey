import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/models/store/store_list_info.dart';
import 'package:flutter/material.dart';

class InviteDealCardCenter extends StatelessWidget {
  final Sinfo store;
  const InviteDealCardCenter({
    required this.store,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: WidgetSize(context).etc041,
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text:
                    store.smStoreName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: WidgetSize(context).sizedBox18,
                    ),
                  ),
                ),
              ),
              SizedBox(width: WidgetSize(context).sizedBox6,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox2, vertical: WidgetSize(context).width0001),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox6),
                    color: Style.ultimateGrey,
                  ),
                  child: Text(
                    store.smRange < 1.0
                        ?
                    '${(store.smRange*1000).roundToDouble().toInt()}m'
                        :
                    '${(store.smRange).toStringAsFixed(2)}km',
                    style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox14,
                      fontWeight: FontWeight.w400,
                      color: Style.white,
                    ),
                  )


              )
            ],
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox8,
          ),
          Row(
            children: [
              Text('참여',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: WidgetSize(context).sizedBox14,
                    color: Style.greyTextButton
                ),
              ),
              SizedBox(width: WidgetSize(context).sizedBox6,),
              RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.start,
                text: TextSpan(
                  text:
                  '${store.sendDeal}건 / ${store.inviteDeal}건',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: WidgetSize(context).sizedBox14,
                  ),
                ),
              ),
              // Text(
              //
              //   '  0%'
              //
              //   ,
              //   style: TextStyle(
              //       fontWeight: FontWeight.w400,
              //       fontSize: Get.width*0.0326,
              //       color: Style.greyTextButton
              //   ),
              // ),
            ],
          ),
          _rowText('수락',
              '${store.openDeal}건'
              ,SizedBox(),
              context
          ),
          _rowText('후기',
              '${store.reviewCnt}개'
              ,SizedBox(),
              context
          ),
          _rowText('평점',
              store.avgPoint,
              Icon(Icons.star,color: Style.yellow, size: WidgetSize(context).width004,),
              context
          ),
        ],
      ),
    );
  }
  Widget _rowText(String text, String text2, Widget icon, BuildContext context){
    return Row(
      children: [
        Text(text,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: WidgetSize(context).sizedBox14,
              color: Style.greyTextButton
          ),
        ),
        SizedBox(width: WidgetSize(context).sizedBox6,),
        icon,
        Text(text2,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: WidgetSize(context).sizedBox14,
              color: Style.blackWrite
          ),
        ),
      ],
    );
  }

}
