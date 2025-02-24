import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/models/store/store_list_info.dart';
import 'package:flutter/material.dart';

class InviteDealFavoriteMark extends StatelessWidget {
  final Sinfo store;
  const InviteDealFavoriteMark({
    required this.store,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  store.favoriteStore == 1
        ?  Positioned(
      top: WidgetSize(context).sizedBox5,
      left: WidgetSize(context).sizedBox1,
      child: Icon(
        Icons.bookmark,
        color: Style.yellow,
        size: WidgetSize(context).sizedBox30,
      ),
    )
        :  const SizedBox();
  }
}
