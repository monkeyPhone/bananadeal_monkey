import 'package:flutter/material.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';





class SignTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator? validator;
  final bool? enabled;
  final bool? filled;
  final int? maxLength;
  final Widget? suffixIcon;
  final TextStyle inputTextStyle;
  final TextInputAction? textInputAction;
  SignTextForm({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.enabled = true,
    this.filled = false,
    this.maxLength,
    this.suffixIcon,
    required this.inputTextStyle,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        counterText:'',
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: WidgetSize(context).sizedBox14,
            color: Style.greyWrite,
            fontWeight: FontWeight.w400 ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(WidgetSize(context).sizedBox12)
            ),
            borderSide: BorderSide(color: Style.greyLine, width: WidgetSize(context).sizedBox2)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Style.greyLine,
              width: WidgetSize(context).sizedBox2
          ),
          borderRadius: BorderRadius.circular(
              WidgetSize(context).sizedBox12
          ),
        ),
        filled: filled
      ),
      style: inputTextStyle,
      cursorColor: Style.blackWrite.withOpacity(0.8),
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLength: maxLength,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled,
      validator: validator,
    );
  }
}
