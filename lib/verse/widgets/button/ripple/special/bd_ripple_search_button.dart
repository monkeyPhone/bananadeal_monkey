import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BdRippleSearchButton extends StatelessWidget {
  final CommonSize size;
  final Color? iconColor;
  final GestureTapCallback onTap;
  final bool? lock;
  final double? padding;
  const BdRippleSearchButton({super.key,
    required this.size,
    this.iconColor,
    required this.onTap,
    this.padding,
    this.lock,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all( padding ?? size.sizedBox7_5),
      child: Material(
        borderRadius: BorderRadius.circular(999),
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: context.read<VerseConfig>().function.debounce(callback: onTap),
            child: switch(lock){
              null =>
                  Icon(Icons.search, size: size.sizedBox30, color: iconColor ?? yellow,),
              _ =>
                  Icon(switch(lock!){
                    true => Icons.lock,
                    false => Icons.lock_open_rounded
                  },
                    size: size.sizedBox18, color: yellow,),

            }
        ),
      ),
    );
  }
}