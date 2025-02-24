import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/helper/inquiry_body/inquiry_main/inquiry_router/inquiry_column/comment/inquiry_comment.dart';
import 'package:flutter/material.dart';


class InquiryCommentArea extends StatelessWidget {
  final String miComment;
  final List imageListC;
  final List imageList;
  const InquiryCommentArea({
    required this.miComment,
    required this.imageListC,
    required this.imageList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return miComment != '' || imageListC.isNotEmpty
        ? InquiryComment(imageListC: imageListC, imageList: imageList, miComment: miComment,)
        : SizedBox();
  }
}
