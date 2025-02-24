import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../css/size.dart';
import '../../../../controllers/etc_my_info_setting_controller.dart';

class QuitTextForm extends GetView<EtcMyInfoSettingController> {
  const QuitTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (chk) =>
                chk.value == 5
                    ?
                CustomTextFormField2(
                  height: WidgetSize(context).width016,
                  width: WidgetSize(context).width0925,
                  onChanged: controller.inputEtc,
                  textController: controller.etcController,
                  hintText: '계정을 삭제하려는 이유를 입력해주세요.',
                  enabled: chk.value == 5 ? true : false,
                )
                    :
                SizedBox()
        , controller.check);
  }
}
