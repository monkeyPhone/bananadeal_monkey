import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';


class BdRippleSortButton extends StatelessWidget {
  final CommonSize size;
  final SortEnum? sortEnum;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String text;
  final bool isSort;
  final GestureTapCallback onTap;
  const BdRippleSortButton({super.key,
    required this.size,
    this.sortEnum,
    this.margin,
    this.padding,
    required this.text,
    required this.isSort,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonBasic(
        margin: margin ?? EdgeInsets.only(
          right: size.sizedPaddingHalf,
        ),
        isDebounce: false,
        borderRadius: BorderRadius.circular(999),
        color: white,
        // isSort ? Style.yellow :Style.white,
        padding: padding ?? EdgeInsets.symmetric(
            horizontal: size.sizedPaddingW,
            vertical: size.sizedPaddingHalfDouble
        ),
        border:  Border.all(
            width: size.sizedBox1,
            color: sortEnum == null ? isSort ? brown : greyD7D7D7 : bananaBack
        ),
        onTap: onTap,
        child: Center(
          child: BdTextWidget(
              text: text,
              textStyle: sortEnum == null ? isSort ? subBrown : subGrey : sub

          ),
        )
    );
  }
}
