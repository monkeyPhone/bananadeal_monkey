import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_block_setting/components/store_block_list/store_block_list_container.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/etc/user_block.dart';



class StoreBlockList extends StatelessWidget {
  final ScrollController scrollController1;
  final int itemCount;
  final List<UserBlockList> storeList;
  const StoreBlockList({
    required this.scrollController1,
    required this.itemCount,
    required this.storeList,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController1,
      thumbVisibility: true,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox12),
          physics: ClampingScrollPhysics(),
          itemCount: itemCount,
          controller: scrollController1,
          itemBuilder: (BuildContext context, int index){
            return StoreBlockListContainer(store: storeList[index]);
          }),
    );
  }

}
