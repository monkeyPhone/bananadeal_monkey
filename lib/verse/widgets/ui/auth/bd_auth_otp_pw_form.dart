import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_search_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdAuthOtpPwForm extends StatefulWidget {
  final bool isLoading;
  final bool lock1;
  final bool lock2;
  final String validate;
  final ValueChanged<String> onChanged1;
  final GestureTapCallback lock1Function;
  final ValueChanged<String> onChanged2;
  final GestureTapCallback lock2Function;
  final GestureTapCallback pwFunction;
  const BdAuthOtpPwForm({super.key,
    required this.isLoading,
    required this.lock1,
    required this.lock2,
    required this.validate,
    required this.onChanged1,
    required this.lock1Function,
    required this.onChanged2,
    required this.lock2Function,
    required this.pwFunction,
  });

  @override
  State<BdAuthOtpPwForm> createState() => _BdAuthOtpPwFormState();
}

class _BdAuthOtpPwFormState extends State<BdAuthOtpPwForm> {
  late final TextEditingController _pw1Controller;
  late final TextEditingController _pw2Controller;


  @override
  void initState() {
    // TODO: implement initState.
    _pw1Controller = TextEditingController();
    _pw2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pw1Controller.dispose();
    _pw2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.sizedBox8,),
          child: const BdTextWidget(
            text: '비밀번호는 5글자 이상 영어 소문자 + 숫자로 이뤄져야 합니다.',
            textStyle: subBrown,
            textAlign: TextAlign.left,
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
        BdTextFormCustom(
          size: size,
          width: size.widthCommon,
          textController: _pw1Controller,
          keyboardType: TextInputType.text,
          enabled: !widget.isLoading,
          obscureText: widget.lock1,
          hintText: '비밀번호를 입력해주세요.',
          onChanged: widget.onChanged1,
          onFieldSubmitted: widget.onChanged1,
          suffixIcon: BdRippleSearchButton(
            size: size,
            lock: widget.lock1,
            onTap: widget.lock1Function,
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
        BdTextFormCustom(
          size: size,
          width: size.widthCommon,
          textController: _pw2Controller,
          keyboardType: TextInputType.text,
          enabled: !widget.isLoading,
          obscureText: widget.lock2,
          hintText: '비밀번호를 한번 더 입력해주세요.',
          onChanged: widget.onChanged2,
          onFieldSubmitted: widget.onChanged2,
          suffixIcon: BdRippleSearchButton(
            size: size,
            lock: widget.lock2,
            onTap: widget.lock2Function,
          ),
        ),
        SizedBox(
          width: size.widthCommon,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.sizedBox8,),
            child: BdTextWidget(
              text: widget.validate,
              textStyle: widget.validate == '' ? subWhite : subRed,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        switch(widget.validate){
          '' =>
          switch(widget.isLoading){
            true => const BdDisabledButton(text: '비밀번호 확인 중...', ),
            false =>
                BdNeoButton(
                  size: size,
                  text: '비밀번호 설정',
                  onPressed: widget.pwFunction,
                )
          },
          _ =>
          const BdDisabledButton(text: '비밀번호 입력을 완료해주세요.', )
        }
      ],
    );
  }
}
