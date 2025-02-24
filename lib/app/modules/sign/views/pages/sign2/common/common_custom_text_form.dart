import 'package:banana_deal_by_monkeycompany/app/components/custom_text_form.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/common/common_custom_text_suffix.dart';
import 'package:flutter/material.dart';

class CommonCustomTextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  const CommonCustomTextForm({super.key,
    required this.textEditingController,
    required this.enabled,
    required this.onChanged,
    this.hintText,
    this.keyboardType,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextFormField(
          autofocus: false,
          enabled: enabled,
          keyboardType: keyboardType ?? TextInputType.text,
          hintText: hintText,
          onChanged: onChanged, textController: textEditingController,
          suffixIcon: onTap == null ?  null : CommonCustomTextSuffix(onTap: onTap!),
      ),
    );
  }
}
