import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const/const_info.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/nav/deal/deal_status.dart';
import '../../../../../../../../../../routes/const_element.dart';

class DealListMainStatusIngImageArea extends StatelessWidget {
  final DealStatusList  dealStatus;
  final double borderGap;
  final BorderRadius borderRadius;
  const DealListMainStatusIngImageArea({
    required this.dealStatus,
    required this.borderGap,
    required this.borderRadius,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding:  EdgeInsets.symmetric(
                vertical: WidgetSize(context).sizedBox5,
                horizontal: WidgetSize(context).sizedBox8
            ),
            height: WidgetSize(context).sizedBox121,
            width: WidgetSize(context).sizedBox119,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: dealStatus.diStatus == '진행중' ? Style.greyF4F4F4 : Style.white,
                  width: borderGap,
                ),
                borderRadius: borderRadius
            ),
            child:   dealStatus.diHopePhoneImg != ''
                ?
            ImageProviders(
                imageWidth: WidgetSize(context).sizedBox119,
                imageHeight: WidgetSize(context).sizedBox121,
                imageUrl: '${ApiConsole.monkeyImageUrl}${dealStatus.diHopePhoneImg}',
                errUrl: AppElement.defaultPhone,
                imageLabel: AppElement.caseHeight
            )
                :
            AssetImageBox(imageHeight: WidgetSize(context).heightCommon, imageWidth: WidgetSize(context).widthCommon,
                imageUrl: AppElement.defaultPhone
            ),
        ),

        Positioned.fill(
            child: dealStatus.diStatus != '진행중'
                ?
            Container(
              margin: EdgeInsets.all(borderGap),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: borderRadius,
              ),
              child:  Center(
                  child: Text(
                    dealStatus.diStatus,
                    style: TextStyle(
                        color: switch(dealStatus.diStatus){
                          InfoString.dealStatusAcp => Style.white,
                          InfoString.dealStatusOpen => Style.yellow,
                          _ => Colors.pinkAccent
                        },

                        fontSize: WidgetSize(context).sizedBox20,
                        fontWeight: FontWeight.w700),
                  )
              ),
            )
                : SizedBox()
        )
      ],
    );
  }
}
