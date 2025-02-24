import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';


class InviteDealLoading extends StatelessWidget {
  final bool loading;
  final int watingSocket;
  const InviteDealLoading({
    required this.loading,
    required this.watingSocket,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      loading || watingSocket != 0
            ? Positioned.fill(
                child: Container(
                  color: Colors.black45,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Style.progressBar,
                    )
                  ),
                )
              )
            : SizedBox();
  }
}
