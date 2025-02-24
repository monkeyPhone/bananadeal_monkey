import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RippleIconOnButtonDefault extends StatelessWidget {
  const RippleIconOnButtonDefault({super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
        child: Padding(
            padding: EdgeInsets.all(size.sizedPaddingOnlyAppBar),
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Icon(Icons.add, size:size.sizedAppbar, color: Colors.transparent,)
            )
        )
    );
  }
}

class RippleIconOnButton extends StatelessWidget {
  final CommonSize size;
  final bool? isDebounce;
  final GestureTapCallback onTap;
  final IconData icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? innerMargin;
  const RippleIconOnButton({super.key,
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
            onTap: isDebounce == null ?context.read<VerseConfig>().function.debounce(callback: onTap) : onTap,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.sizedPaddingOnlyAppBar),
                  color: Colors.transparent,
                ),
                margin: innerMargin,
                padding: padding ?? EdgeInsets.all(size.sizedPaddingOnlyAppBar),
                child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Icon(icon, size:size.sizedAppbar,)
                )
            ),
          )
      ),
    );
  }
}

class RippleBackButton extends StatelessWidget {
  final CommonSize size;
  final bool? isDebounce;
  final GestureTapCallback onTap;

  const RippleBackButton({super.key,
    required this.size,
    this.isDebounce,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: size.sized16grid),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.sizedPaddingOnlyAppBar),
        color: Colors.transparent,
      ),
      child: Material(
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(size.sizedPaddingOnlyAppBar),
            onTap: isDebounce == null ? context.read<VerseConfig>().function.debounce(callback: onTap) : onTap,
            child: Container(
                padding: EdgeInsets.only(
                    right: size.sizedPaddingOnlyAppBar,
                    top: size.sizedPaddingOnlyAppBar,
                    bottom: size.sizedPaddingOnlyAppBar
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.sizedPaddingOnlyAppBar),
                  color: Colors.transparent,
                ),
                child: FittedBox(child: Icon(Icons.arrow_back_ios, size: size.sizedAppbar,))
            ),
          )
      ),
    );
  }
}
