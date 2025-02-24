import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/etc_inquiry_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_main/inquiry_router/inquiry_column/inquiry_column.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_main/inquiry_router/inquiry_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../components/loading.dart';

class InquiryMainCorrect extends StatelessWidget {
  const InquiryMainCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtcInquiryController>(
        builder: (controller)=>
        controller.questionList.isNotEmpty
            ?  controller.currentQuestionList.isEmpty
                  ? InquiryScrollBar(
                      scrollController: controller.scrollController,
                      itemCounter: controller.questionList.length,
                      questionList: controller.questionList,
                      isWhere: true,
                    )
                  : InquiryColumn(
                      currentQuestionList: controller.currentQuestionList,
                      imageList: controller.imageList,
                      imageListC: controller.imageListC,
                      isWhere: false,
                    )
            : DefaultView(text1: '진행중인 문의 내역이 없어요.', text2: '')
    );
  }
}
