import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';

class DealActiveItemDeal extends StatelessWidget {
  final String imageurl;
  final String name;
  final String msg;
  final String time;
  const DealActiveItemDeal({
    required this.imageurl,
    required this.name,
    required this.msg,
    required this.time,
    super.key});

  @override
  Widget build(BuildContext context) {
    try{
      return Padding(
        padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon),
                  color: Style.white,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox62),
                  child: AssetImageBox(imageHeight:  WidgetSize(context).sizedBox32, imageWidth:  WidgetSize(context).sizedBox32,
                    imageUrl: imageurl, boxFit: BoxFit.cover,)

                // CacheImage(imageNetworkUrl: imageurl,
                //     errortAssetUrl: 'assets/images/default/bannerDefault.png', fit: BoxFit.cover, imageHeight: WidgetSize(context).sizedBox34, imageWidth: WidgetSize(context).sizedBox34),
              ),
            ),
            SizedBox(width: WidgetSize(context).sizedBox7_5,),
            Expanded(
                child: Text.rich(
                  TextSpan(
                      text: name,
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox16),
                      children: [
                        // TextSpan(
                        //     text: '  :  ',
                        //     style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox8)
                        // ),
                        // TextSpan(
                        //     text: msg,
                        //     style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox13)
                        // ),
                        TextSpan(
                            text: '     ',
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox8)
                        ),
                        TextSpan(
                            text: msg,
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox14)
                        ),
                        TextSpan(
                            text: '     ',
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox8)
                        ),
                        TextSpan(
                            text:
                            DateTimeConfig().now.difference(DateTime.parse(time)).inMinutes == 0
                                ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inSeconds}초 전'
                                :
                            DateTimeConfig().now.difference(DateTime.parse(time)).inHours == 0
                                ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inMinutes}분 전'
                                :
                            DateTimeConfig().now.difference(DateTime.parse(time)).inDays == 0
                                ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inHours}시간 전'
                                :
                            '${DateTimeConfig().now.difference(DateTime.parse(time)).inDays}일 전'
                            ,
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox10, color: Style.ultimateGrey)
                        ),
                      ]
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
            ),

          ],
        ),
      );
    } catch(e){
      return  Padding(
        padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon),
                  color: Style.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Style.ultimateGrey,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 1), // changes position of shadow
                    ),
                  ]
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox62),
                  child: AssetImageBox(imageHeight:  WidgetSize(context).sizedBox32, imageWidth:  WidgetSize(context).sizedBox32,
                    imageUrl: imageurl, boxFit: BoxFit.cover,)

                // CacheImage(imageNetworkUrl: imageurl,
                //     errortAssetUrl: 'assets/images/default/bannerDefault.png', fit: BoxFit.cover, imageHeight: WidgetSize(context).sizedBox34, imageWidth: WidgetSize(context).sizedBox34),
              ),
            ),
            SizedBox(width: WidgetSize(context).sizedBox7_5,),
            Expanded(
                child: Text.rich(
                  TextSpan(
                      text: '알 수 없음',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox16),
                      children: [

                        TextSpan(
                            text: '     ',
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox8)
                        ),
                        TextSpan(
                            text: '알림 기간이 지난 딜 내역입니다.',
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox14)
                        ),
                        TextSpan(
                            text: '     ',
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox8)
                        ),
                        TextSpan(
                            text: '알 수 없음'
                            ,
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox10, color: Style.ultimateGrey)
                        ),
                      ]
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
            ),

          ],
        ),
      );
    }
  }
}
