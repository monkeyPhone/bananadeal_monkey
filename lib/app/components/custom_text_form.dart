import 'package:flutter/material.dart';
import '../css/size.dart';
import '../css/style.dart';



class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final Color? hintColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final String? hintText;
  final String? errorText;
  final bool? enabled;
  final bool obscureText;
  final bool autofocus;
  final Color? fillColor;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  const CustomTextFormField({
    this.contentPadding,
    this.hintColor,
    this.borderColor,
    this.fillColor,
    this.height,
    this.width,
    this.hintText,
    this.errorText,
    this.enabled,
    this.obscureText = false,
    this.autofocus = false,
    required this.onChanged,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Style.greyCCCCCC,
        width: WidgetSize(context).sizedBox1_5
      ),
      borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox10)),
    );

    return Container(
      height: height ?? WidgetSize(context).etc0135,
      width: width ?? WidgetSize(context).textFromWidth,
      child: TextFormField(
        style: TextStyle(fontSize: WidgetSize(context).sizedBox14,),
        focusNode: focusNode,
        controller: textController,
        cursorColor: Style.yellow,
        textInputAction: textInputAction,
        //비밀번호 입력할때,
        obscureText: obscureText,
        autofocus: autofocus,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ?? EdgeInsets.all(WidgetSize(context).sizedBox18),
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(
            color: hintColor != null ? hintColor : enabled == true ? Style.greyWrite : Colors.black,
            fontSize: WidgetSize(context).sizedBox14,
          ),
          fillColor: fillColor != null ? fillColor : enabled == true ? Style.white : Style.greyD7D7D7,
          filled: true,
          enabled: enabled ?? true,
            disabledBorder: baseBorder,
          //모든 Input 상태의 기본 스타일 세팅
            enabledBorder: baseBorder,
          border: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
              color: Style.yellow,
            )
          )
        ),
      ),
    );
  }
}

class CustomTextFormField2 extends StatelessWidget {
  final double? height;
  final double? width;
  final String? hintText;
  final String? errorText;
  final bool? enabled;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  const CustomTextFormField2({
    this.height,
    this.width,
    this.hintText,
    this.errorText,
    this.enabled,
    this.obscureText = false,
    this.autofocus = false,
    required this.onChanged,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: Style.greyCCCCCC,
          width: WidgetSize(context).sizedBox1_5
      ),
      borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).width00234)),
    );

    return Container(
      height: height ?? WidgetSize(context).etc0135,
      width: width ?? WidgetSize(context).textFromWidth,
      child: TextFormField(
        controller: textController,
        cursorColor: Style.yellow,
        //비밀번호 입력할때,
        obscureText: obscureText,
        autofocus: autofocus,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.all(WidgetSize(context).sizedBox18),
            hintText: hintText,
            errorText: errorText,
            hintStyle: TextStyle(
              color: Style.greyAAAAAA,
              fontSize: WidgetSize(context).sizedBox14,
            ),
            fillColor: Style.greyEAEAEA,
            filled: true,
            enabled: true,
            //모든 Input 상태의 기본 스타일 세팅
            enabledBorder: baseBorder,
            border: baseBorder,
            focusedBorder: baseBorder.copyWith(
                borderSide: baseBorder.borderSide.copyWith(
                  color: Style.yellow,
                )
            )
        ),
      ),
    );
  }
}


class CustomTextFormField3 extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final Color? hintColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final String? hintText;
  final String? errorText;
  final bool? enabled;
  final bool obscureText;
  final bool autofocus;
  final Color? fillColor;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  const CustomTextFormField3({
    this.contentPadding,
    this.hintColor,
    this.borderColor,
    this.fillColor,
    this.height,
    this.width,
    this.hintText,
    this.errorText,
    this.enabled,
    this.obscureText = false,
    this.autofocus = false,
    required this.onChanged,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: borderColor ?? Style.greyCCCCCC,
          width: WidgetSize(context).sizedBox1_5
      ),
      borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox10)),
    );

    return TextFormField(
      expands: true,
      maxLines: null,
      minLines: null,
      style: TextStyle(fontSize: WidgetSize(context).sizedBox14,),
      focusNode: focusNode,
      controller: textController,
      cursorColor: Style.yellow,
      textInputAction: textInputAction,
      //비밀번호 입력할때,
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(

          suffixIcon: suffixIcon,
          contentPadding: contentPadding ?? EdgeInsets.all(WidgetSize(context).sizedBox18),
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(
            color: hintColor != null ? hintColor : enabled == true ? Style.greyWrite : Colors.black,
            fontSize: WidgetSize(context).sizedBox14,
          ),
          fillColor: fillColor != null ? fillColor : enabled == true ? Style.white : Style.greyD7D7D7,
          filled: true,
          enabled: enabled ?? true,
          disabledBorder: baseBorder,
          //모든 Input 상태의 기본 스타일 세팅
          enabledBorder: baseBorder,
          border: baseBorder,
          focusedBorder: baseBorder.copyWith(
              borderSide: baseBorder.borderSide.copyWith(
                color: Style.yellow,
              )
          )
      ),
    );
  }
}
