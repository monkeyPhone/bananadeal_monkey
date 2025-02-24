import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/body/widgets/some_inquiry_correct_column.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/body/widgets/some_inquiry_correct_scroll.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/etc_some_inquiry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/loading.dart';

class SomeInquiryCorrect extends StatelessWidget {
  const SomeInquiryCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EtcSomeInquiryController>(
      builder: (controller) =>
      controller.questionList.isNotEmpty
          ?  controller.currentQuestionList.isEmpty
                ? SomeInquiryCorrectScroll(
                    scrollController: controller.scrollController,
                    itemCount: controller.questionList.length,
                    questionList: controller.questionList,
                    isEmptyList: controller.currentQuestionList.isEmpty,
                    isWhere: true,
                  )
                : SomeInquiryCorrectColumn(
                    columnController: controller.columnController,
                    currentQuestionList: controller.currentQuestionList,
                    imageList: controller.imageList,
                    isWhere: false,
                  )
          : DefaultView(text1: '등록된 문의 내역이 없어요.', text2: '')
      ,
    );
  }
}
