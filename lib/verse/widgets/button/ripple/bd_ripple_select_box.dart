import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdRippleSelectBox extends StatelessWidget {
  final List<(String, String, GestureTapCallback)> buttonList;
  final int currentIndex;
  final EdgeInsetsGeometry? padding;

  const BdRippleSelectBox({super.key,
    required this.buttonList,
    required this.currentIndex,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      color: Colors.transparent,
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(buttonList.length,
                  (index) =>
                      _RippleColorsButton(
                          isDelay: false,
                          borderRadius: BorderRadius.circular(size.sizedBox12),
                          color:  index == currentIndex
                              ? yellowCheck
                              : white,
                      margin: EdgeInsets.only(bottom: size.sizedBox12),
                      border: Border.all(
                          width: size.sizedBox2,
                          color: index == currentIndex
                              ? yellow
                              : grey999999
                      ),
                      width: size.widthCommon,
                      height: size.height60px,
                      onTap: buttonList[index].$3,
                      widget: Row(
                        children: [
                          BdLayoutPadding(
                            padding: PaddingEnum.horizontal,
                              child: index == currentIndex
                                  ? const _CheckBox()
                                  : const _DefaultBox()
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: RichText(
                                  maxLines: 1,
                                  text: TextSpan(
                                      text: buttonList[index].$1,
                                      style: TextStyle(
                                        fontSize: size.body,
                                        color: index == currentIndex
                                            ? brown
                                            : grey999999,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: ' ${buttonList[index].$2}',
                                            style: TextStyle(
                                              fontSize: size.sub,
                                              color: index == currentIndex
                                                  ? brown
                                                  : grey999999,
                                              fontWeight: FontWeight.w400,
                                            )
                                        )
                                      ]
                                  ),

                                ),
                              )
                          ),
                          const _Pad()
                        ],
                      )
                  )
          ).toList(),
        ),
      ),
    );
  }
}


class _CheckBox extends StatelessWidget {
  const _CheckBox();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdAssetImageBinder(
      imageWidth: 110/90*size.sizedBox20,
      imageHeight: size.sizedBox20,
      imageUrl: checkImage,
    );
  }
}

class _DefaultBox extends StatelessWidget {
  const _DefaultBox();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      width: 110/90*size.sizedBox21,
      height: size.sizedBox21,
    );
  }
}

class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.read<VerseConfig>().size.sizedBox12,
    );
  }
}


class _RippleColorsButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final GestureLongPressCallback? onLongPress;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget widget;
  final double? height;
  final double? width;
  final bool? isDelay;
  const _RippleColorsButton({
    required this.onTap,
    this.onLongPress,
    this.borderRadius,
    this.border,
    this.color,
    this.margin,
    this.padding,
    required this.widget,
    this.height,
    this.width,
    this.isDelay
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? yellow,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: yellowCheck.withOpacity(0.5),
          splashColor: yellowCheck,
          borderRadius: borderRadius,
          onLongPress: onLongPress,
          onTap: isDelay == null
              ? context.read<VerseConfig>().function.debounce(callback: onTap)
              : onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: border,
                  borderRadius: borderRadius
              ),
              padding: padding,
              width: width,
              height: height,
              child: widget),
        ),
      ),
    );
  }
}

