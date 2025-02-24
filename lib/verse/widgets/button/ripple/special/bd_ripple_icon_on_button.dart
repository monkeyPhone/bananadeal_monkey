import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdRippleIconOnButton extends StatelessWidget {
  final CommonSize size;
  final bool? isDebounce;
  final GestureTapCallback onTap;
  final IconData icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? innerMargin;
  const BdRippleIconOnButton({super.key,
    required this.size,
    this.isDebounce,
    required this.onTap,
    required this.icon,
    this.padding,
    this.margin,
    this.innerMargin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.sizedPaddingOnlyAppBar),
        color: Colors.transparent,
      ),
      margin: margin,
      child: Material(
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(size.sizedPaddingOnlyAppBar),
            onTap: isDebounce == null ? context.read<VerseConfig>().function.debounce(callback: onTap) : onTap,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.sizedPaddingOnlyAppBar),
                  color: Colors.transparent,
                ),
                margin: innerMargin,
                padding: padding ?? EdgeInsets.all(size.sizedPaddingOnlyAppBar),
                child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Icon(icon, size: size.sizedAppbar,)
                )
            ),
          )
      ),
    );
  }
}