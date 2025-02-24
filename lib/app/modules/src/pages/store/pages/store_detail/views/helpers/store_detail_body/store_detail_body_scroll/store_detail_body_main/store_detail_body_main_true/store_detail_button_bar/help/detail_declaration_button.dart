import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../components/declaration_dialog/declaration_dialog_detail.dart';

class DetailDeclarationButton extends GetView<StoreDetailController> {
  final bool isInvite;
  const DetailDeclarationButton({super.key,
    required this.isInvite,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.tight,
        child: DeclarationDialogDetail(
          isInvite: isInvite,
          ruIdx: '',
          text: '매장을 신고하시겠어요?',
          nickName: controller.storeDetail.value.smStoreName,
          someWidget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.report_gmailerrorred, size: WidgetSize(context).sizedBox24, color: Style.blackWrite,),
              Text('신고/차단', style: TextStyle(fontSize: WidgetSize(context).sizedBox15, color: Style.blackWrite),)
            ],
          ), type: 'STORE', userIdx: '', smId: controller.storeDetail.value.smMId,
        )
    );
  }
}
