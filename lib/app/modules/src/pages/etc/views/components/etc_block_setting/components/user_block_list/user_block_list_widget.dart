import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_block_setting/components/user_block_list/user_block_list_widget_container.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/etc/user_block.dart';



class UserBlockListWidget extends StatelessWidget {
  final ScrollController scrollController2;
  final int itemCount;
  final List<UserBlockList> userList;
  const UserBlockListWidget({
    required this.scrollController2,
    required this.itemCount,
    required this.userList,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController2,
      thumbVisibility: true,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox12),
          physics: ClampingScrollPhysics(),
          itemCount: itemCount,
          controller: scrollController2,
          itemBuilder: (BuildContext context, int index){
            return UserBlockListWidgetContainer(user: userList[index]);
          }),
    );
  }

}
