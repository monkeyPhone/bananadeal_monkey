import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/widgets/container_widget/inquiry_list_container.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../models/etc/in_question.dart';

class InquiryScrollBar extends StatelessWidget {
  final ScrollController scrollController;
  final int itemCounter;
  final List<QuestionList> questionList;
  final bool isWhere;
  const InquiryScrollBar({
    required this.scrollController,
    required this.itemCounter,
    required this.questionList,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.builder(
            controller: scrollController,
            itemCount: itemCounter,
            itemBuilder: (context, index){
              return InquiryListContainer(
                  index: index,
                  date: questionList[index].miQRegdate,
                  title: questionList[index].miTitle,
                  status: questionList[index].miStatus,
                  isWhere: isWhere,
              );

            }
        )
    );
  }
}
