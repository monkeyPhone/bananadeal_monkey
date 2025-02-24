import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/etc_widgets/etc_divider.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/etc_widgets/etc_list_as.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/etc_widgets/etc_list_my_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/widgets/list_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EtcObxMainUseState extends GetView<EtcController> {
  const EtcObxMainUseState({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.useController,
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          ListContainer(index: 0, text: '앱 설정', onTap0: controller.onTap0()),
          EtcDivider(),
          Column(
            children: [
              EtcListMyInfo(),
              ListContainer(index: 2, text: '단골매장 관리', onTap2: controller.onTap2(),),
              ListContainer(index: 3, text: '후기 관리', onTap3: controller.onTap3(),),
              ListContainer(index: 4, text: '차단 관리', onTap4: controller.onTap4(),),
            ],
          ),
          EtcDivider(),
          Column(
            children: [
              ListContainer(index: 5, text: '공지사항', onTap5: controller.onTap5(),),
              ListContainer(index: 6, text: '이벤트', onTap6: controller.onTap6(),),
            ],
          ),
          EtcDivider(),
          Column(
            children: [
              EtcListAs(),
              ListContainer(index: 8, text: '자주 하는 질문', onTap8: controller.onTap8(),),
            ],
          ),
          EtcDivider(),
          ListContainer(index: 9, text: '이용약관', onTap9: controller.onTap9(),),
        ],
      ),
    );
  }
}
