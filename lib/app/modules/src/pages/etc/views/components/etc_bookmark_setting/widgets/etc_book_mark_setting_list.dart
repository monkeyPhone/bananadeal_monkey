import 'package:banana_deal_by_monkeycompany/app/components/default_banana.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_bookmark_setting_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_bookmark_setting/widgets/etc_book_mark_setting_container.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_body/helper/store_body_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../components/loading.dart';

class EtcBookMarkSettingList extends StatelessWidget {
  const EtcBookMarkSettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EtcBookmarkSettingController>(
        builder: (controller) =>
        Stack(
          children: [
            controller.favoriteStatus.value == 0
                ? Loading2(text: '잠시만 기다려주세요',)
                : controller.favoriteStatus.value == 200
                        ? controller.favoriteList.isNotEmpty
                            ? EtcBookMarkSettingContainer(
                                  store: controller.favoriteList,
              //   search: List<Sinfo>.generate(controller.search.length, (index) => controller.search[index]).toList(),
              // current: controller.searchStore.value == '',
                             )
                  : Counter1(
                text: '등록된 매장이 없습니다.'
            ) :DefaultBanana(
                onPressed: () async{
                  await controller.getFavoritePageInit();
                }),

            controller.loading.value
            ? Positioned.fill(child: Container(color: Colors.black45, child: Center(child: CircularProgressIndicator(color: Style.yellow,),),))
            : SizedBox()
          ],
        )
    );
  }
}
