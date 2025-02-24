import 'package:banana_deal_by_monkeycompany/app/models/store/store_list_info.dart';
import 'package:flutter/material.dart';
import '../../invite_deal_loading.dart';
import 'body_list/invite_deal_body_list.dart';

class InviteDealBodyMain extends StatelessWidget {
  final ScrollController sController;
  final int itemCount;
  final List<Sinfo> store;
  final List invitedList;
  final bool allClick;
  final bool loading;
  final List deletedList;
  final int watingSocket;
  const InviteDealBodyMain({
    required this.sController,
    required this.itemCount,
    required this.store,
    required this.invitedList,
    required this.allClick,
    required this.loading,
    required this.deletedList,
    required this.watingSocket,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        InviteDealBodyList(
          sController: sController,
          itemCount: store.length,
          store: store,
          invitedList: invitedList,
          allClick: allClick,
          deletedList: deletedList,
        ),
        InviteDealLoading(
          watingSocket: watingSocket,
          loading: loading,)
      ],
    );
  }
}
