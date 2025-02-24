import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../models/store/store_detail_review.dart';
import '../../controllers/store_detail_controller.dart';
import 'declaration_dialog_helper.dart';




class DeclarationDialogDetail extends GetView<StoreDetailController> {
  final String nickName;
  final String text;
  final String type;
  final String userIdx;
  final String smId;
  final String ruIdx;
  final StoreReViewList? review;
  final Widget someWidget;
  final bool isInvite;

  const DeclarationDialogDetail({
    required this.type,
    required this.nickName,
    required this.text,
    required this.userIdx,
    required this.smId,
    required this.ruIdx,
    this.review,
    required this.someWidget,
    required this.isInvite,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        color: Colors.transparent,
        padding: EdgeInsets.all(WidgetSize(context).sizedBox2),
        onTap: () {
          if(isInvite){
            controller.commonWidgets.customSnackbar('초대중에는 사용할 수 없습니다.');
          }
          else{
            DeclarationDialogHelper().modalOnTapSelect(
                nickName: nickName, text: text, type: type, userIdx: userIdx, smId: smId, ruIdx: ruIdx, routrerContext: context);
          }
        },
        widget: someWidget
    );
  }


}



