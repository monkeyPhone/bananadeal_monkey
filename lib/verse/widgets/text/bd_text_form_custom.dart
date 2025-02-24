import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';


class BdTextFormCustom extends StatelessWidget {
  final CommonSize size;
  final EdgeInsetsGeometry? contentPadding;
  final Color? hintColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final String? hintText;
  final String? errorText;
  final bool? enabled;
  final int? maxLength;
  final bool obscureText;
  final bool? autofocus;
  final bool? expands;
  final Color? fillColor;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? labelText;
  final InputBorder? inputBorder;
  final double? fontSize;
  const BdTextFormCustom({
    super.key,
    required this.size,
    this.contentPadding,
    this.hintColor,
    this.borderColor,
    this.fillColor,
    this.height,
    this.width,
    this.expands,
    this.hintText,
    this.errorText,
    this.enabled,
    this.maxLength,
    this.obscureText = false,
    this.autofocus,
    this.onChanged,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.labelText,
    this.inputBorder,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = inputBorder ?? OutlineInputBorder(
      borderSide: BorderSide(
          color: borderColor ?? greyCCCCCC,
          width: size.sizedBox1_5
      ),
      borderRadius: BorderRadius.all(Radius.circular(size.sizedBox10)),
    );
    return SizedBox(
      height: height,
      width: width ?? size.textFromWidth,
      child: TextFormField(
        expands: expands ?? false,
        style: TextStyle(fontSize: fontSize ?? size.callout,),
        focusNode: focusNode,
        controller: textController,
        cursorColor: yellow,
        textInputAction: textInputAction,
        //비밀번호 입력할때,
        obscureText: obscureText,
        autofocus: autofocus ?? false,
        onChanged: onChanged,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            counterText: maxLength == null || maxLength! < 1000 ? "" : null,
            labelText: labelText,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ?? EdgeInsets.all(size.sizedBox18),
            hintText: hintText,
            errorText: errorText,
            labelStyle: TextStyle(color: karajeck,  fontSize: fontSize ?? size.sizedBox14),
            hintStyle: TextStyle(
              color: hintColor ?? (enabled == true ? greyWrite : Colors.black),
              fontSize: fontSize ?? size.sizedBox14,
            ),
            fillColor: fillColor ?? (enabled == true ? white : greyD7D7D7),
            filled: true,
            enabled: enabled ?? true,
            disabledBorder: baseBorder,
            //모든 Input 상태의 기본 스타일 세팅
            enabledBorder: baseBorder,
            border: baseBorder,
            focusedBorder: inputBorder ?? baseBorder.copyWith(
                borderSide: baseBorder.borderSide.copyWith(
                  color: yellow,
                )
            )
        ),
      ),
    );
  }
}