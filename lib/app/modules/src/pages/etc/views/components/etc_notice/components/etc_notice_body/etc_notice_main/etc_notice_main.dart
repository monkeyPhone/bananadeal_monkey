import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/components/etc_notice_body/etc_notice_main/etc_notice_main_scroll/etc_notice_main_column.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/components/etc_notice_body/etc_notice_main/etc_notice_main_scroll/etc_notice_main_scroll.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/etc_notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../components/loading.dart';

class EtcNoticeMain extends StatelessWidget {
  const EtcNoticeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtcNoticeController>(
      builder: (controller)=>
      controller.questionList.isNotEmpty
          ? controller.currentQuestionList.isEmpty
              ? EtcNoticeMainScroll(
                  scrollController: controller.scrollController,
                  itemCounter: controller.questionList.length,
                  questionList: controller.questionList,
                  isEmptyList: controller.currentQuestionList.isEmpty,
                  isWhere: true,
                )
             : EtcNoticeMainColumn(
                  currentQuestionList: controller.currentQuestionList,
                  isEmptyList: controller.currentQuestionList.isEmpty,
                  columnController: controller.columnController,
                isWhere: false,
              )
          : DefaultView(text1: '등록된 공지사항이 없어요.', text2: '')
    );
  }
}
