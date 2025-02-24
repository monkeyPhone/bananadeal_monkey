import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../css/size.dart';
import '../css/style.dart';
import '../modules/src/pages/etc/controllers/etc_bookmark_setting_controller.dart';
import '../modules/src/pages/store/controllers/store_controller.dart';
import '../modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';

class BookmarkButton extends StatelessWidget {
  final int? rong;
  final int index;
  final String storeName;
  const BookmarkButton({
    required this.rong,
    required this.index,
    required this.storeName,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      storeName == AppElement.unknownStore
      ? const SizedBox()
      :
          rong == null
      ? SizedBox()
              :
      rong == 0
            ? GetBuilder<BdBotNavStoreController>(
                builder: (bdC) {
                  return RippleIconButton(
                      onTap: () async{
                        bdC.storeInfoSort[index].favoriteStore == 0
                            ? await bdC.createFavorite(
                            fSmMid: bdC.storeInfoSort[index].smMId,
                            index: index
                        )
                            : await bdC.deleteFavorite(
                            fSmMid: bdC.storeInfoSort[index].smMId,
                            index: index
                        );
                      },
                      icon: bdC.storeInfoSort[index].favoriteStore == 0
                              ? Icons.bookmark_border
                              : Icons.bookmark,
                      iconColor: bdC.storeInfoSort[index].favoriteStore == 0
                                  ? Style.blackWrite
                                  : Style.yellow,
                      iconSize: WidgetSize(context).sizedBox32,
                     padding: WidgetSize(context).sizedBox1,
                  );
                  }
                )
            : rong == 1
                ? GetBuilder<StoreController>(
                    builder: (storeC) {
                      return RippleIconButton(
                        onTap: () async{
                          storeC.storeSearch[index].favoriteStore == 0
                              ? await storeC.createFavorite(
                              fSmMid: storeC.storeSearch[index].smMId,
                              index: index)
                              : await storeC.deleteFavorite(
                              fSmMid: storeC.storeSearch[index].smMId,
                              index: index);
                        },
                        icon: storeC.storeSearch[index].favoriteStore == 0
                            ? Icons.bookmark_border
                            : Icons.bookmark,
                        iconColor: storeC.storeSearch[index].favoriteStore == 0
                            ? Style.blackWrite
                            : Style.yellow,
                        iconSize: WidgetSize(context).sizedBox32,
                        padding: WidgetSize(context).sizedBox1,
                      );
                     }
                    )
                : GetBuilder<EtcBookmarkSettingController>(
                    builder: (bookC) {
                      return RippleIconButton(
                        onTap: () async{
                          bookC.deleteFavorite(
                              fSmMid: bookC.favoriteList[index].smMId,
                              index: index);
                        },
                        icon: Icons.bookmark ,
                        iconColor:  Style.yellow,
                        iconSize: WidgetSize(context).sizedBox32,
                        padding: WidgetSize(context).sizedBox1,
                      );
                     }
                    );
  }
}
