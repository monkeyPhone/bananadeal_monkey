import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_noti_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/etc_active/helper/etc_avtive_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';


class EtcActiveView extends GetView<AlertNotiController> {
  const EtcActiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AlertNotiController>(
      builder: (anC)=> Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: WidgetSize(context).extendsGap,
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(top: WidgetSize(context).sizedBox12),
                color: Colors.grey[100],
                child: anC.notiEtc.isNotEmpty
                    ?
                Scrollbar(
                  controller: anC.etcC,
                  thumbVisibility: true,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, ),
                      controller: anC.etcC,
                      itemCount: anC.notiEtc.length,
                      itemBuilder: (BuildContext context, int index){
                        return  EtcActiveColumn(
                          index: index,
                          timeBool: index == 0 ||
                              DateTime.parse(anC.notiEtc[index].time).day !=  DateTime.parse(anC.notiEtc[index-1].time).day,
                          imageUrl: anC.notiEtc[index].img,
                          title: anC.notiEtc[index].title,
                          msg: anC.notiEtc[index].msg,
                          time: anC.notiEtc[index].time,
                        );
                      }
                  ),
                )
                    :
                Center(
                  child: Text('현재 알림이 없습니다.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: WidgetSize(context).sizedBox17),),
                ),
              )
          ),
        ],
      ),
    );
  }



}
