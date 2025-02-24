import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_block_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_block_setting/components/user_block_list/user_block_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../components/loading.dart';
import '../components/store_block_list/store_block_list.dart';


class EtcBlockSettingBodyMainCorrect extends StatelessWidget {
  const EtcBlockSettingBodyMainCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EtcBlockSettingController>(
      builder: (controller) =>
      controller.userBlock.value.result.isEmpty
          ?
      Loading2(text: '잠시만 기다려주세요',)
          :
      controller.currentTap.value == 0
          ? controller.storeList.isNotEmpty
              ?  StoreBlockList(
                  scrollController1: controller.scrollController1,
                  itemCount: controller.storeList.length,
                  storeList: controller.storeList,
                 )
              : DefaultView(text1: '차단 목록이 없어요.', text2: '',)
          : controller.userList.isNotEmpty
              ?  UserBlockListWidget(
                  scrollController2: controller.scrollController2,
                  itemCount: controller.userList.length,
                  userList: controller.userList,
                )
              : DefaultView(text1: '차단 목록이 없어요.', text2: '',)
      ,
    );
  }
}
