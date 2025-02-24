import 'package:banana_deal_by_monkeycompany/app/modules/dialog/type/declaration_page.dart';
import 'package:get/get.dart';


class DeclarationOnlyDialogHelper {
  void openDeclarationDialog({
    required bool isOnly,
    required String type,
    required String ruIdx,
    required String nickName,
    required String text,
    required String userIdx,
    required String smId,
    }){
    Get.to(()=>DeclarationPage(
        isOnly: isOnly,
        type: type, ruIdx: ruIdx, nickName: nickName, text: text, userIdx: userIdx, smId: smId, ));
  }

}