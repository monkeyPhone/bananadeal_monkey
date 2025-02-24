import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_main/inquiry_router/inquiry_column/inquiry_column_image_list_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/widgets/container_widget/inquiry_list_container.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../models/etc/in_question.dart';
import 'comment/inquiry_comment_area.dart';

class InquiryColumn extends StatelessWidget {
  final List<QuestionList> currentQuestionList;
  final List imageList;
  final List imageListC;
  final bool isWhere;
  const InquiryColumn({
    required this.currentQuestionList,
    required this.imageList,
    required this.imageListC,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InquiryListContainer(
            index: 0,
            date: currentQuestionList.first.miQRegdate,
            title: currentQuestionList.first.miTitle,
            status: currentQuestionList.first.miStatus,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentQuestionList.first.miContent,
                  style: TextStyle(
                    fontSize: WidgetSize(context).etcContentSize, fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: WidgetSize(context).sizedBox8,),
                Column(
                  children: [
                    SizedBox(height: WidgetSize(context).sizedBox6,),
                    InquiryColumnImageListArea(imageList: imageList),
                  ],
                ),
                InquiryCommentArea(
                  miComment: currentQuestionList.first.miComment,
                  imageListC: imageListC,
                  imageList: imageList,
                )
              ],
            ),
          ),
        )
        )
      ],
    );
  }
}
