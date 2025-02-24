import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_bookmark_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../models/store/store_list_info.dart';
import '../../../../../store/views/helpers/routes/store/store_container/store_container.dart';


class EtcBookMarkSettingContainer extends GetView<EtcBookmarkSettingController> {
  final List<Sinfo> store;
  const EtcBookMarkSettingContainer({
    required this.store,
  super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller.bookmarkController,
      thumbVisibility: true,
      child: ListView(
        padding: EdgeInsets.only(right: WidgetSize(context).sizedBox4),
        controller: controller.bookmarkController,
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            children: List.generate(
                store.length ,
                    (index) =>
                    StoreContainer(onTap: (){
                      controller.goToDetail(index);
                    }, store: store, index: index, rong: 2,)
            ).toList(),
          )
        ],
      ),
    );
    //   Column(
    //   children: [
    //     BookMarkSearchBar(
    //       store: store,
    //     ),
    //     current == false && search.isNotEmpty
    //     ?
    //     Expanded(
    //       child: Scrollbar(
    //         controller: controller.bookmarkController,
    //         thumbVisibility: true,
    //         child: ListView(
    //             padding: EdgeInsets.only(right: WidgetSize(context).sizedBox4),
    //             controller: controller.bookmarkController,
    //             physics: const ClampingScrollPhysics(),
    //             children: [
    //               Column(
    //                 children: List.generate(
    //                     current ?
    //                     store.length : search.length,
    //                         (index) =>
    //                         StoreContainer(onTap: (){
    //                           controller.goToDetail(index);
    //                         }, store: current ? store : search, index: index, rong: 2,)
    //                 ).toList(),
    //               )
    //             ],
    //         ),
    //       ),
    //     ) : DefaultView(text1: '검색된 즐겨찾기가 없어요.', text2: ' ',),
    //   ],
    // );
    //   ListView(
    //   physics: ClampingScrollPhysics(),
    //   children: List.generate(store.length,
    //           (index) => StoreContainer(onTap: (){
    //         controller.goToDetail(index);
    //       }, store: store, index: index, rong: 2,)).toList(),
    // );

    //   SingleChildScrollView(
    //   physics: ClampingScrollPhysics(),
    //   child: Column(
    //     children: List.generate(store.length,
    //             (index) => StoreContainer(onTap: (){
    //               controller.goToDetail(index);
    //             }, store: store, index: index, rong: 2,)),
    //   ),
    // );
  }
}
