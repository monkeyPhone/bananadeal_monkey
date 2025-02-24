import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_profile/store_detail_bookmark_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../components/bookmark_button.dart';


class StoreDetailProfileButtonRoute extends StatelessWidget {
  final int? indexs1;
  final int? rong;
  final String storeName;
  const StoreDetailProfileButtonRoute({
    this.indexs1,
    required this.rong,
    required this.storeName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  indexs1 != null
        ? BookmarkButton(rong: rong, index: indexs1!, storeName: storeName,)
        : StoreDetailBookmarkButton();
  }
}
