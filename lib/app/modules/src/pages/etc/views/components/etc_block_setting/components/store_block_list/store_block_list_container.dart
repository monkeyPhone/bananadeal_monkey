import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_block_setting/components/thumb_nail_before.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/etc/user_block.dart';
import '../block_list_dialog_button.dart';

class StoreBlockListContainer extends StatelessWidget {
  final UserBlockList store;
  const StoreBlockListContainer({
    required this.store,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).sizedBox84,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD)
            )
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  ThumbNailBefore(imageUrl: store.smPathImg0!),
                  SizedBox(width: WidgetSize(context).sizedBox12,),
                  Expanded(
                    child: Text(store.smStoreName!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: WidgetSize(context).sizedBox20,
                          color: Style.blackWrite
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            BlockListDialogButton(name: store.smStoreName!, buIdx: store.buIdx)
          ],
        )
    );
  }
}
