import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../../../../../../../../../components/widget_components/ripple_button/ripple_search_icon_button.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../controllers/store_detail_controller.dart';


class StoreDetailBookmarkButton extends StatelessWidget {
  const StoreDetailBookmarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreDetailController>(
        builder: (sdC){
          return RippleIconButton(
            onTap: () async{
              sdC.storeDetail.value.favoriteStore == 0
                  ? sdC.createFavorite(
                fSmMid: sdC.storeDetail.value.smMId,)
                  : sdC.deleteFavorite(
                fSmMid: sdC.storeDetail.value.smMId,);
            },
            icon: sdC.storeDetail.value.favoriteStore == 0
                ? Icons.bookmark_border
                : Icons.bookmark,
            iconColor: sdC.storeDetail.value.favoriteStore == 0
                ? Style.blackWrite
                : Style.yellow,
            iconSize: WidgetSize(context).sizedBox32,
            padding: WidgetSize(context).sizedBox1,
          );
        }
    );
  }
}
