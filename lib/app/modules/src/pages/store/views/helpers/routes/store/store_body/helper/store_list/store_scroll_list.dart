import 'package:banana_deal_by_monkeycompany/app/models/store/store_list_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_container/store_container.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../controllers/store_controller.dart';


class StoreScrollList extends StatelessWidget {
  const StoreScrollList({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BdBotNavStoreController>(
        builder: (bdC){
          return
            GetBuilder<StoreController>(
                builder: (controller) {
                  return controller.rong.value == 0
                      ? _ListBuilder(
                    scrollController: controller.sController,
                    storeList: bdC.storeInfoSort,
                    rong: controller.rong.value,
                    isLoading: controller.loading.value,
                  )
                      :
                  _ListBuilder(
                    scrollController: controller.sController,
                    storeList: controller.storeSearch,
                    rong: controller.rong.value,
                    isLoading: controller.loading.value,
                  );
                }
            );
        }
    );
  }
}


class _ListBuilder extends GetView<StoreController> {
  final ScrollController scrollController;
  final List<Sinfo> storeList;
  final int rong;
  final bool isLoading;
  const _ListBuilder({
    required this.scrollController,
    required this.storeList,
    required this.rong,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: ListView.builder(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          itemCount: storeList.length,
          itemBuilder: (BuildContext context, int index) =>
              StoreContainer(
                onTap: (){
                  if(!isLoading){
                    controller.goToDetail(index: index, list: storeList, rong: rong);
                  }
                },
                store: storeList,
                index: index,
                rong: rong,),
      ),
    );
  }
}
