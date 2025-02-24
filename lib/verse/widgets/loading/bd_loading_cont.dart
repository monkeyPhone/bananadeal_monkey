import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/material.dart';

class BdLoadingCont extends StatelessWidget {
  const BdLoadingCont({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
          color: Colors.white60,
          child: const BdLoadingSpin(),
        )
    );
  }
}
