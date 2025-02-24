import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/body/components/some_inquiry_list_container.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/body/widgets/some_inquiry_correct_column_image_area.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/etc/some_question.dart';

class SomeInquiryCorrectColumn extends StatelessWidget {
  final ScrollController columnController;
  final List<SomeQuestionList> currentQuestionList;
  final List imageList;
  final bool isWhere;
  const SomeInquiryCorrectColumn({
    required this.columnController,
    required this.currentQuestionList,
    required this.imageList,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SomeInquiryListContianer(
            index: 0,
            title: currentQuestionList.first.bfqAsk,
            isEmptyList: currentQuestionList.isEmpty,
            isWhere: isWhere,
        ),
        Expanded(
            child: Container(
          width: WidgetSize(context).widthCommon,
          padding: EdgeInsets.symmetric(
              vertical: WidgetSize(context).sizedBox15,
              horizontal: WidgetSize(context).sizedBox16
          ),
          color: Colors.grey.shade100,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            controller: columnController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentQuestionList.first.bfqAnswer,
                  style: TextStyle(
                    fontSize: WidgetSize(context).etcContentSize, fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: WidgetSize(context).sizedBox16,),
                SomeInquiryCorrectColumnIamgeArea(imageList: imageList)
              ],
            ),
          ),
        )
        )
      ],
    );
  }
}
