import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/components/event_detail_content_area.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../../../css/app_basic_component/basic_app_bar_text.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/etc/etc_event_detail.dart';
import 'event_detail_colum_button.dart';
import 'event_detail_image_area.dart';

class EventDetailColumn extends StatelessWidget {
  final int eventIdx;
  final EtcEventDetailResult eventDetail;
  const EventDetailColumn({
    required this.eventIdx,
    required this.eventDetail,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BasicAppbar(
          title: BasicAppBarText2(
            text: eventDetail.beTitle,
          ),
        ),
        Expanded(
            child: Column(
              children: [
                Expanded(child:
                Container(
                  width: WidgetSize(context).widthCommon,
                  color: Style.greyF4F4F4,
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          EventDetailImageArea(imagePath: eventDetail.bePathImg2),
                          EventDetailImageArea(imagePath: eventDetail.bePathImg3),
                          SizedBox(
                            height: WidgetSize(context).sizedBox16,
                          ),
                          EtcDetailContentArea(beContent: eventDetail.beContent),
                          EventDetailColumButton(
                            beIdx: eventIdx,
                            eventDetail: eventDetail,
                          ),
                          SizedBox(height: WidgetSize(context).sizedBox16,)
                        ],
                      ),
                    ],
                  ),
                )),
                SizedBox(
                  height: WidgetSize(context).extendsGap,
                )
              ],
            )
        )
      ],
    );
  }
}
