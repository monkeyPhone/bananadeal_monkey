import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_noti_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/deal_active/helper/deal_active_scroll_member/deal_active_list_view_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../routes/const_element.dart';

class DealActiveContainerChild extends StatelessWidget {
  const DealActiveContainerChild({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<AlertNotiController>(
      builder: (anC)=>
        anC.notiDeal.isNotEmpty
            ?  Scrollbar(
                  controller: anC.dealC,
                  thumbVisibility: true,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, ),
                      controller: anC.dealC,
                      itemCount: anC.notiDeal.length,
                      itemBuilder: (BuildContext context, int index){
                        return  DealActiveListViewColumn(
                          index: index,
                          titleBool: anC.notiDeal[index].title.contains('종료') || anC.notiDeal[index].title.contains('개통되었습니다.'),
                          elementBool: anC.notiDeal[index].title.contains('종료'),
                          imageurl:  anC.notiDeal[index].title.contains('참여')
                                        ? AppElement.dealParticipate
                                        : anC.notiDeal[index].title.contains('수정')
                                             ? AppElement.dealChange
                                             : AppElement.dealEnd,
                          name: anC.notiDeal[index].title.contains('종료') ? '종료' : anC.notiDeal[index].name,
                          originName: anC.notiDeal[index].name,
                          msg: anC.notiDeal[index].title.contains('종료')
                                ? '진행중인 딜이 종료되었어요.'
                                : anC.notiDeal[index].title,
                          time: anC.notiDeal[index].time,
                        );
                      }
                  ),
                )
            :  Center(
                  child: Text('현재 알림이 없습니다.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: WidgetSize(context).sizedBox17
                    ),
                  ),
        ),
    );




  }
}
