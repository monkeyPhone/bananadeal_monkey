import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;
  final Color? backgroundColor;
  final Color? iconColor;
  const BdFloatingActionButton({super.key,
    required this.onPressed,
    required this.iconData,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      width: size.srcFloatingActionBarSize,
      height: size.srcFloatingActionBarSize,
      child: FloatingActionButton(
        backgroundColor: backgroundColor ?? yellow,
        onPressed: onPressed,
        elevation: 1,
        child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: EdgeInsets.all(size.sized24grid),
                child: Icon(
                  color: iconColor ?? white,
                  size: size.width0307,
                  iconData ,),
              ),
            )
        ),
      ),
    );
  }
}
