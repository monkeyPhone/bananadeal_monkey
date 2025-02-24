import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/helper/invite_deal_body/body_list/invite_deal_check/invite_deal_check_on.dart';
import 'package:flutter/material.dart';
import 'invite_deal_check_off.dart';

class InviteDealCheck extends StatelessWidget {
  final bool isInvite;
  final bool check;
  final bool unCheck;
  final bool allClick;
  const InviteDealCheck({
    required this.isInvite,
    required this.check,
    required this.unCheck,
    required this.allClick,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      isInvite
          ? SizedBox()
          :
      allClick
        ? unCheck
            ? InviteDealCheckOff()
            : InviteDealCheckOn()
        : check
          ?  InviteDealCheckOn()
          :  InviteDealCheckOff();
  }
}
