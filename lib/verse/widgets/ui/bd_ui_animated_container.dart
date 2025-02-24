import 'package:flutter/material.dart';

class BdUiAnimatedContainer extends StatelessWidget {
  const BdUiAnimatedContainer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.ease,
  });

  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      child: child,
    );
  }
}