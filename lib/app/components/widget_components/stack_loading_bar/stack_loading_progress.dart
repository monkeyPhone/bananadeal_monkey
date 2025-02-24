import 'package:banana_deal_by_monkeycompany/app/components/widget_components/stack_loading_bar/stack_loading_bar.dart';
import 'package:flutter/material.dart';


class StackLoadingProgress extends StatelessWidget {
  const StackLoadingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: StackLoadingBar(),
        ),
      ),
    );
  }
}
