import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_main/inquiry_router/inquiry_column/comment/inquiry_comment_image_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_main/inquiry_router/inquiry_column/comment/inquiry_comment_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../css/style.dart';

class InquiryComment extends StatelessWidget {
  final List imageList;
  final List imageListC;
  final String miComment;
  const InquiryComment({
    required this.imageList,
    required this.imageListC,
    required this.miComment,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(color: Style.greyDDDDDD, width: WidgetSize(context).sizedBox1),
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
      ),
      margin: EdgeInsets.only(
          top: imageList.isNotEmpty ? WidgetSize(context).sizedBox18
                                    : WidgetSize(context).sizedBox12
      ),
      padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
      width: WidgetSize(context).widthCommon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('답변', style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: WidgetSize(context).sizedBox19,
              color: Style.blackWrite
          ),),
          InquiryCommentText(miComment: miComment,),
          InquiryCommentImageArea(imageListC: imageListC),
        ],
      ),
    );
  }
}
