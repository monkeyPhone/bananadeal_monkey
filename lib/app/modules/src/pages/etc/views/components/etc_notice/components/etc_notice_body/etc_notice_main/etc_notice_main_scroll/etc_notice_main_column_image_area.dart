import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/components/etc_notice_body/etc_notice_main/etc_notice_main_scroll/etc_notice_main_column_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../css/size.dart';

class EtcNoticeMainColumnImageArea extends StatelessWidget {
  final String bnPathImg;
  const EtcNoticeMainColumnImageArea({
    required this.bnPathImg,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  bnPathImg == ''
        ? SizedBox(
            height: WidgetSize(context).sizedBox16,
          )
        : Column(
            children: [
              EtcNoticeMainColumnImage(imagePath: bnPathImg),
              SizedBox(height: WidgetSize(context).sizedBox16,)
            ]
    );
  }
}
