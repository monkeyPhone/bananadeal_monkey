import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_body_main_area/expain_row_text.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_body_main_area/explain_pad.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_body_main_area/explain_row_camera.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../models/deal/model_detail_data.dart';
import 'ex_plain_column.dart';
import 'explain_etc.dart';

class DetailSpecArea extends StatelessWidget {
  final PhoneSpecDetail phoneSpecDetail;
  final String mk;
  const DetailSpecArea({
    required this.phoneSpecDetail,
    required this.mk,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: WidgetSize(context).sizedBox22, right: WidgetSize(context).sizedBox16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ExPlainColumn(
                child: Column(
                  children: [
                    ExPlainRowText(
                        text1: '제조사',
                        text2: mk
                    ),
                    ExPlainRowText(text1: '모델명', text2: phoneSpecDetail.psModel),
                    ExPlainRowText(text1: '출시일', text2: DateFormat('yyyy년 MM월 dd일').format(phoneSpecDetail.psReleaseDate)),
                    ExPlainPad()
                  ],
                )
            ),
            ExPlainColumn(
                child: Column(
                  children: [
                    ExPlainRowText(text1: 'OS', text2: phoneSpecDetail.psOs),
                    ExPlainRowText(text1: 'CPU', text2: phoneSpecDetail.psCpu),
                    ExPlainPad()
                  ],
                )
            ),
            ExPlainColumn(
                child: Column(
                  children: [
                    ExPlainRowText(text1: 'RAM', text2: phoneSpecDetail.psRam),
                    ExPlainRowText(text1: '내장메모리', text2: phoneSpecDetail.psInMemory),
                    ExPlainRowText(text1: '외장메모리', text2: phoneSpecDetail.psExMemory),
                    ExPlainPad()
                  ],
                )
            ),
            ExPlainColumn(
                child: Column(
                  children: [
                    ExPlainRowText(text1: '배터리', text2: phoneSpecDetail.psBattery),
                    ExPlainPad()
                  ],
                )
            ),
            ExPlainColumn(
                child: Column(
                  children: [
                    ExPlainRowText(text1: '무게', text2: phoneSpecDetail.psWeight),
                    ExPlainRowText(text1: '디스플레이', text2: phoneSpecDetail.psDisplay),
                    ExPlainRowText(text1: '화면', text2: phoneSpecDetail.psDisplaySize),
                    ExplainRowCamera(text1: phoneSpecDetail.psCameraFront, text2: phoneSpecDetail.psCameraBack),
                  ],
                )
            ),
            ExplainRowEtc(
              nfc: phoneSpecDetail.psSpecNfc,
              usim: phoneSpecDetail.psSpecUsim, type: phoneSpecDetail.psSpecType, film: phoneSpecDetail.psSpecFilm,
              aod: phoneSpecDetail.psSpecAod, pay: phoneSpecDetail.psSpecPay, ip: phoneSpecDetail.psSpecIp,
              component: phoneSpecDetail.psSpecComponent,),
            ExPlainPad()

          ],
        )
    );
  }



}
