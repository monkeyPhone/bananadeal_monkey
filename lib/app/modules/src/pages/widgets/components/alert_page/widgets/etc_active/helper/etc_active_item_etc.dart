import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../managers/image/image_dialog_manager.dart';
import '../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../routes/const_element.dart';

class EtcActiveItemEtc extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String msg;
  final String time;
  const EtcActiveItemEtc({
    required this.imageUrl,
    required this.title,
    required this.msg,
    required this.time,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: WidgetSize(context).sizedBox15, bottom:  WidgetSize(context).sizedBox20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon),
                  color: Style.karajeck,

                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox62),
                    child: AssetImageBox(imageHeight:  WidgetSize(context).sizedBox32, imageWidth:  WidgetSize(context).sizedBox32,
                      imageUrl: AppElement.bananaLaunch, boxFit: BoxFit.cover,)

                ),
              ),
              SizedBox(width: WidgetSize(context).sizedBox7_5,),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(WidgetSize(context).sizedBox5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox16),),
                        _padHeight(context),
                        Text(msg, style: TextStyle(fontWeight: FontWeight.normal, fontSize: WidgetSize(context).sizedBox13),),
                        _padHeight(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            imageUrl == ''
                                ?   const SizedBox()
                                :   RippleImageButton(
                                      image: ImageProviderState(imageUrl: ApiConsole.imageBananaUrl+imageUrl, errUrl: AppElement.defaultPhone,
                                          imageWidth: WidgetSize(context).sizedBox0_62, aspectRatio: AppElement.caseNotice),
                                      onTap: (){
                                        ImageDialogManager().openImageDownLoad(routerContext: context, imageUrl: imageUrl, isDownload: false);
                                      }
                            ),
                            _padWidth(context),
                            Text(
                              DateTimeConfig().now.difference(DateTime.parse(time)).inMinutes == 0
                                ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inSeconds}초 전'
                                : DateTimeConfig().now.difference(DateTime.parse(time)).inHours == 0
                                    ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inMinutes}분 전'
                                    : DateTimeConfig().now.difference(DateTime.parse(time)).inDays == 0
                                        ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inHours}시간 전'
                                        : '${DateTimeConfig().now.difference(DateTime.parse(time)).inDays}일 전',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(context).sizedBox10,
                                  color: Style.ultimateGrey
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _padWidth(BuildContext context){
    return SizedBox(
      width: WidgetSize(context).sizedBox8,
    );
  }

  Widget _padHeight(BuildContext context){
    return SizedBox(
      height: WidgetSize(context).sizedBox15,
    );
  }

}
