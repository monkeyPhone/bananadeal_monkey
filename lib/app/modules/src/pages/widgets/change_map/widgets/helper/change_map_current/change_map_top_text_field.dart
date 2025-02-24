import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../sign/views/widgets/top_text_field.dart';
import '../../../../../../src_components/controllers/src_info_controller.dart';
import '../../../change_map_controller.dart';

class ChangeMapTopTextField extends StatelessWidget {
  final BuildContext mediaContext;
  const ChangeMapTopTextField({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeMapController>(
      builder: (controller){
        return (MediaQuery.of(mediaContext).viewInsets.bottom > 0 && MediaQuery.of(mediaContext).viewInsets.bottom > WidgetSize(context).height041) || controller.extend.value
            ? SizedBox(
                height: WidgetSize(context).sizedBox10,
              )
            : Padding(
          padding: WidgetSize(context).paddingBodyWhole,
          child: TopTextField(text1: '반가워요. ${SrcInfoController.to.infoM.value.mName}님!', text2: '위치를 변경하시나요?', text3: '가까운 매장을 찾기 위해서 위치 설정이 필요해요.'),
        );
      },
    );
  }
}
