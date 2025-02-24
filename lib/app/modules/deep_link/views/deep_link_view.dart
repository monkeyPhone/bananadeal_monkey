import 'package:banana_deal_by_monkeycompany/app/modules/deep_link/components/default_link.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/deep_link/components/event/link_event_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/deep_link/components/store/link_store_view.dart';
import 'package:flutter/material.dart';



class DeepLinkRouter extends StatelessWidget {
  final String type;
  final String idx;
  const DeepLinkRouter({
    super.key,
    required this.type,
    required this.idx,
    });

  @override
  Widget build(BuildContext context) {
    switch(type){
      case 'store':
        return LinkStoreView(idx: int.parse(idx));
      case 'event':
        return LinkEventView(idx: int.parse(idx));
     default:
        return const DefaultLink();

    }
  }
}
