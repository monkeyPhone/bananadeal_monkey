import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdRippleButtonStack extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool isDelay;
  final BorderRadius? borderRadius;
  final Border? border;
  final Color? effect;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  const BdRippleButtonStack({
    super.key,
    required this.onTap,
    required this.isDelay,
    this.borderRadius,
    this.effect,
    this.border,
    this.margin,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: margin,
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: border,
                  borderRadius: borderRadius,
                  color: Colors.transparent
              ),
              padding: padding,
              child: child),
          Positioned.fill(
              child: Material(
                borderRadius: borderRadius,
                color: Colors.transparent,
                child:  InkWell(
                  highlightColor: effect ?? Colors.grey.shade200.withOpacity(0.3),
                  splashColor: effect ?? Colors.grey.shade200.withOpacity(0.3),
                  borderRadius: borderRadius,
                  onTap: switch(isDelay){
                    true => context.read<VerseConfig>().function.debounce(callback: onTap),
                    false => onTap
                  },
                ),
              )
          )
        ],
      ),
    );
  }
}
