import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../../../../../models/etc/etc_event.dart';
import '../../../../../../../../routes/api_url.dart';
import '../../../../../../../../routes/const_element.dart';
import '../../../../../../src_components/controllers/src_info_controller.dart';
import 'etc_event_list_container_time.dart';

class EtcEventListContainer extends GetView<EtcEventController> {
  final EtcEventList event;
  const EtcEventListContainer({
    required this.event,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(width: WidgetSize(context).sizedBox1/2, color: Style.greyAAAAAA),
                  bottom: BorderSide(width: WidgetSize(context).sizedBox1/2, color: Style.greyAAAAAA)
              )

          ),
          child: RippleImageButton(
            onTap: (){
              controller.clickImage(eventIdx: event.beIdx, email: SrcInfoController.to.infoM.value.mEmail);
            },
            image:  ImageProviderState(
                imageWidth: WidgetSize(context).widthCommon,
                imageUrl: ApiConsole.imageBananaUrl+event.bePathImg1,
                errUrl: AppElement.defaultImg,  aspectRatio: AppElement.caseNotice
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).sizedBox72,
          decoration: BoxDecoration(
              color: Style.white,
              border: Border(
                  top: BorderSide(width: WidgetSize(context).sizedBox1/2, color: Style.greyAAAAAA),
                  bottom: BorderSide(width: WidgetSize(context).sizedBox1/2, color: Style.greyAAAAAA)
              )

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  event.beTitle, style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Style.blackWrite,
                    fontSize: WidgetSize(context).etcTitleSize
                ),
                ),
              ),
              SizedBox(height: WidgetSize(context).etcTimeGap,),
              EtcEvnetListContainerTime(startTime: event.bePeriodStart, endTime: event.bePeriodEnd,)
            ],
          ),
        )
      ],
    );
  }
}
