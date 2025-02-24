import 'package:banana_deal_by_monkeycompany/app/components/pad.dart';
import 'package:banana_deal_by_monkeycompany/app/models/fcm/message_data_name.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_noti_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../../src_components/controllers/src_info_controller.dart';
import 'svg_pic.dart';

class DealActiveOpenAlert extends GetView<AlertNotiController> {

  final MessageDataName messageData;
  const DealActiveOpenAlert({
    required this.messageData,
    super.key});

  @override
  Widget build(BuildContext context) {

    try{
      return  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPic(asset: AppElement.iconBanana),
              Pad(width: WidgetSize(context).sizedBox10,),
              Container(
                constraints: BoxConstraints(
                    maxWidth: WidgetSize(context).sizedBox0_6,
                    minWidth: 0,
                    minHeight: 0,
                    maxHeight: WidgetSize(context).sizedBox0_1,
                ),
                child: Text(
                  "${SrcInfoController.to.infoM.value.mName}님 개통을 축하드립니다!",
                      style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400, color:
                      Style.brown),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Pad(width: WidgetSize(context).sizedBox10,),
              SvgPic(asset: AppElement.iconBanana2),
            ],
          ),
          _openRow(
              textBefore: '가게명:',
              textAfter: messageData.name,
            context: context
          ),
          _openRow(
              textBefore: '기기명:',
              textAfter: messageData.dePsName,
            context: context
          ),

          _openRow(
              textBefore: '할부원금 / 월납부액:',
              textAfter: '${NumberFormat('###,###').format(messageData.deInstallmentPrincipal)}원 / '
                  '${NumberFormat('###,###').format(messageData.deMonthTotalPrice)}원',
            context: context
          ),
        ],
      );
    } catch(_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPic(asset:  AppElement.iconBanana),
          Pad(width: WidgetSize(context).sizedBox8,),
          Container(
            constraints: BoxConstraints(
                maxWidth: WidgetSize(context).sizedBox0_6,
                minWidth: 0,
                minHeight: 0,
                maxHeight: WidgetSize(context).sizedBox0_1,
            ),
            child: Text(
              '알림 기간이 지난 개통된 딜입니다.',
              style: TextStyle(fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
          ,
          Pad(width: WidgetSize(context).sizedBox8,),
          SvgPic(asset: AppElement.iconBanana2),
        ],
      );
    }
  }

  Widget _openRow({required String textBefore, required String textAfter, required BuildContext context}){
    return Padding(
      padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _opentext(textBefore, context),
          SizedBox(width: WidgetSize(context).sizedBox8,),
          Expanded(child: _opentext(textAfter, context)),
        ],
      ),
    );
  }

  Widget _opentext(String text, BuildContext context){
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox12,
          fontWeight: FontWeight.w400
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

}
