import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdAuthOtpEmailForm extends StatefulWidget {
  final VoidCallback onPressed;
  final ValueChanged<String> onChanged;
  final String validate;
  final String email;
  final bool isLoading;
  const BdAuthOtpEmailForm({super.key,
    required this.onPressed,
    required this.onChanged,
    required this.validate,
    required this.email,
    required this.isLoading,
  });

  @override
  State<BdAuthOtpEmailForm> createState() => _BdAuthOtpEmailFormState();
}

class _BdAuthOtpEmailFormState extends State<BdAuthOtpEmailForm> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        const BdCustomPad(padEnum: PadEnum.height20),
        BdTextFormCustom(
          size: size,
          width: size.widthCommon,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onChanged,
          textController: _emailController,
          keyboardType: TextInputType.emailAddress,
          enabled: !widget.isLoading,
          hintText: '이메일',
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.sizedBox8,),
          child: BdTextWidget(
            text: widget.validate,
            textStyle: widget.validate == '' ? subWhite : subRed,),
        ),
        switch(widget.validate){
          '' =>
          switch(widget.email){
            '' => const BdDisabledButton(text: '인증 메일 보내기',),
            _ =>  switch(widget.isLoading){
              true =>  const BdDisabledButton(text: '이메일 보내는 중...',),
              false =>
                  BdNeoButton(
                    size: size,
                    text: '인증 메일 보내기',
                    onPressed: widget.onPressed,
                  )
            }
          },
          _ =>
          const BdDisabledButton(text: '이메일 입력을 완료해주세요',)
        }
      ],
    );
  }
}
