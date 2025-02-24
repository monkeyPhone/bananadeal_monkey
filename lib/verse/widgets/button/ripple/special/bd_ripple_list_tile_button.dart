import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdRippleListTileButton extends StatelessWidget {
  final CommonSize size;
  final GestureTapCallback onTap;
  final IconData icon;
  final String text;
  final Color? iconColor;
  final String? textStyle;

  const BdRippleListTileButton({super.key,
    required this.size,
    required this.onTap,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // borderRadius: BorderRadius.circular(999),
        splashColor: yellowCheck,
        highlightColor: yellowCheck,
        hoverColor: yellowCheck,
        focusColor: yellowCheck,
        onTap: context.read<VerseConfig>().function.debounce(callback: onTap),
        child: SizedBox(
          width: size.widthCommon,
          height: size.sizedBox50,
          child: Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: size.sizedBox10,
                vertical: size.sizedBox5
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _FitBox(
                        size: size,
                        widget:  Icon(icon, color: iconColor ?? bananaBack,),
                      ),
                      SizedBox(width: size.sizedBox10,),
                      BdTextWidget(text: text, textStyle: textStyle ?? body,)
                      // FittedBox(
                      //   fit: BoxFit.fill,
                      //   child:,
                      // ),

                    ],
                  ),
                  _FitBox(
                    size: size,
                    widget: const Icon(Icons.arrow_forward_ios, color: ultimateGrey,),
                  )
                ]
            ),
          ),
        )
    );
  }
}

class _FitBox extends StatelessWidget {
  final CommonSize size;
  final Widget widget;
  const _FitBox({
    required this.size,
    required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.sizedBox25,
        width: size.sizedBox25,
        child:  FittedBox(
          child:
          widget,
        )
    );
  }
}