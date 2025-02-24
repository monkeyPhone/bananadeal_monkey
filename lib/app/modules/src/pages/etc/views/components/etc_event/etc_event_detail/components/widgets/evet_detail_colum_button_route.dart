import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/components/widgets/shared_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_event/etc_event_detail/etc_evnet_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../components/disable_button.dart';
import '../../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../models/etc/etc_event_detail.dart';

class EventDetailColumButtonRoute extends GetView<EtcEventDetailController> {
  final int beIdx;
  final EtcEventDetailResult eventDetail;
  const EventDetailColumButtonRoute({
    required this.beIdx,
    required this.eventDetail,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      eventDetail.beStatus == '진행중'
          ?  eventDetail.beType == '참여형' || eventDetail.beType == '이동형'
                ?  eventDetail.beType == '참여형'
                      ?  Column(
                            children: [
                              eventDetail.bepIsPrize == null
                                  ?  NeumorphicButtons(
                                        text: '이벤트 참여하기',
                                        onPressed: (){
                                          controller.postEventJoin(beIdx);
                                        }
                                        )
                                  : DisableButton(text: '참여 완료') ,
                              SizedBox(
                                height: WidgetSize(context).sizedBox24,
                              ),
                              SharedButton(
                                  onTap: () async{
                                    await controller.shareEvent(beIdx);
                                  }),
                              SizedBox(
                                height: WidgetSize(context).sizedBox24,
                              ),
                            ],
                         )
                      : Column(
                          children: [
                            NeumorphicButtons(
                                text: '이벤트 참여하기',
                                onPressed: (){
                                  controller.launchInBrowser(controller.eventDetail.value.beUrl);
                                }),
                            SizedBox(
                              height: WidgetSize(context).sizedBox24,
                            ),
                            SharedButton(
                                onTap: () async{
                                  await controller.shareEvent(beIdx);
                                }
                                ),
                            SizedBox(
                              height: WidgetSize(context).sizedBox24,
                            ),

                          ],
                        )

                : SharedButton(
                    onTap: () async{
                      await controller.shareEvent(beIdx);
                      }
                    )
         : DisableButton(text: '종료된 이벤트');
  }
}
