import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/components/declaration_dialog_only/declaration_only_dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../models/store/store_detail_review.dart';
import '../../controllers/store_detail_controller.dart';


class DeclarationOnlyDialogDetail extends GetView<StoreDetailController> {
  final String nickName;
  final String text;
  final String type;
  final String userIdx;
  final String smId;
  final String ruIdx;
  final Widget someWidget;

  const DeclarationOnlyDialogDetail({
    required this.type,
    required this.ruIdx,
    required this.nickName,
    required this.text,
    required this.userIdx,
    required this.smId,
    required this.someWidget,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: (){
          DeclarationOnlyDialogHelper().openDeclarationDialog(
            isOnly: true,
              type: type, ruIdx: ruIdx, nickName: nickName, text: text, userIdx: userIdx, smId: smId,);
        }, child: someWidget);
  }



}
