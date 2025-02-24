import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/body/components/some_inquiry_list_container.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../models/etc/some_question.dart';


class SomeInquiryCorrectScroll extends StatelessWidget {
  final ScrollController scrollController;
  final int itemCount;
  final List<SomeQuestionList> questionList;
  final bool isEmptyList;
  final bool isWhere;
  const SomeInquiryCorrectScroll({
    required this.scrollController,
    required this.itemCount,
    required this.questionList,
    required this.isEmptyList,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.builder(
            controller: scrollController,
            itemCount: itemCount,
            itemBuilder: (context, index){
              return SomeInquiryListContianer(
                  index: index,
                  title: questionList[index].bfqAsk,
                  isEmptyList: isEmptyList,
                  isWhere: isWhere,
              );
            }
        )
    );
  }
}
