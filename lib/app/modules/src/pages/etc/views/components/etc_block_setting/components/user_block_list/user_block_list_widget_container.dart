import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_block_setting/components/thumb_nail_before.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/etc/user_block.dart';
import '../block_list_dialog_button.dart';

class UserBlockListWidgetContainer extends StatelessWidget {
  final UserBlockList user;
  const UserBlockListWidgetContainer({
    required this.user,
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
                  ThumbNailBefore(imageUrl: user.mPathImg ?? ''),
                  SizedBox(width: WidgetSize(context).sizedBox12,),
                  Expanded(
                    child: Text(user.mName ?? '',
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
            BlockListDialogButton(name: user.mName!, buIdx: user.buIdx)
          ],
        )
    );
  }
}
