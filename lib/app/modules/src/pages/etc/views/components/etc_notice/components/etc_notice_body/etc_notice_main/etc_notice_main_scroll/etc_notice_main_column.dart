import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/components/etc_notice_body/etc_notice_main/etc_notice_main_scroll/etc_notice_main_column_image_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/components/etc_notice_body/etc_notice_main/etc_notice_main_scroll/etc_notice_main_scroll_container.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../models/etc/etc_notice.dart';


class EtcNoticeMainColumn extends StatelessWidget {
  final List<EtcNoticeList> currentQuestionList;
  final bool isEmptyList;
  final ScrollController columnController;
  final bool isWhere;
  const EtcNoticeMainColumn({
    required this.currentQuestionList,
    required this.isEmptyList,
    required this.columnController,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        EtcNoticeMainScrollContainer(
          index: 0,
          title: currentQuestionList.first.bnTitle,
          isEmptyList: isEmptyList,
          isWhere: isWhere,
        ),
        Expanded(
            child: Container(
              width: WidgetSize(context).widthCommon,
              padding: EdgeInsets.only(
                bottom:  WidgetSize(context).sizedBox16
              ),
              color: Style.greyF4F4F4,
              child: SingleChildScrollView(
                controller: columnController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   EtcNoticeMainColumnImageArea(bnPathImg: currentQuestionList.first.bnPathImg),
                    Padding(
                      padding: WidgetSize(context).paddingBodyWhole,
                      child: Text(currentQuestionList.first.bnContent,
                        style: TextStyle(
                          fontSize: WidgetSize(context).etcContentSize, fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
     ]
    );
  }
}
