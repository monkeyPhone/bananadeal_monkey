import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdAuthOtpOtpForm extends StatefulWidget {
  final VoidCallback onPressed;
  final ValueChanged<String> onChanged;
  final String otp;
  final bool isOtp;
  final bool isLoading;
  final String email;
  final VoidCallback functionInput;
  final String count;
  final VoidCallback functionResend;
  const BdAuthOtpOtpForm({super.key,
    required this.onPressed,
    required this.onChanged,
    required this.otp,
    required this.isOtp,
    required this.isLoading,
    required this.email,
    required this.functionInput,
    required this.count,
    required this.functionResend,
  });

  @override
  State<BdAuthOtpOtpForm> createState() => _BdAuthOtpOtpFormState();
}

class _BdAuthOtpOtpFormState extends State<BdAuthOtpOtpForm> {
  late final TextEditingController _otpController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        Column(
            children: [
              _Form(
                size: size,
                onChanged: widget.onChanged,
                otpController: _otpController,
                isLoading: widget.isLoading,
              ),

              const BdCustomPad(padEnum: PadEnum.height4),
              _ReInput(
                size: size,
                email: widget.email,
                onTap: () {
                  widget.functionInput();
                },
              ),
              const BdCustomPad(padEnum: PadEnum.height4),
              _Resend(
                size: size,
                count: widget.count,
                onTap: () {
                  _otpController.clear();
                  widget.functionResend();
                },
              ),
              const BdCustomPad(padEnum: PadEnum.height4),
              _Button(
                size: size,
                otp: widget.otp,
                isOtp: widget.isOtp,
                isLoading: widget.isLoading,
                onPressed: widget.onPressed,
              ),
            ]
        )
      ],
    );
  }
}



class _Form extends StatelessWidget {
  final CommonSize size;
  final ValueChanged<String> onChanged;
  final TextEditingController otpController;
  final bool isLoading;
  const _Form({
    required this.size,
    required this.onChanged,
    required this.otpController,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BdCustomPad(padEnum: PadEnum.height16),
        BdTextFormCustom(
          size: size,
          width: size.widthCommon,
          onChanged: onChanged,
          maxLength: 6,
          onFieldSubmitted: onChanged,
          textController: otpController,
          keyboardType: TextInputType.number,
          enabled: !isLoading,
          hintText: '인증번호',
        ),
        const BdCustomPad(padEnum: PadEnum.height8),
      ],
    );
  }
}


class _ReInput extends StatelessWidget {
  final CommonSize size;
  final String email;
  final GestureTapCallback onTap;
  const _ReInput({
    required this.size,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(
        size.sizedBox8,
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: BdTextWidget(
                  text: '$email  전송완료',
                  textStyle: subBrown,
                  textAlign: TextAlign.left,
                ),
            ),
          ),
          const BdCustomPad(padEnum: PadEnum.width12),
          Row(
            children: [
              BdRippleButtonBasic(
                onTap: onTap,
                padding: EdgeInsets.symmetric(
                    vertical: size.sizedBox10,
                    horizontal:size.sizedBox12
                ),
                color: yellow,
                borderRadius: BorderRadius.circular(999),
                child: const BdTextWidget(
                  text: '재입력',
                  textStyle: subBrown,
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Resend extends StatelessWidget {
  final CommonSize size;
  final String count;
  final GestureTapCallback onTap;
  const _Resend({
    required this.size,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        size.sizedBox8,
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BdTextWidget(
            text: '남은 시간 $count',
            textStyle: subBrown,
            textAlign: TextAlign.left,
          ),
          Row(
            children: [
              BdRippleButtonBasic(
                onTap: onTap,
                padding: EdgeInsets.symmetric(
                    vertical: size.sizedBox10,
                    horizontal:size.sizedBox12
                ),
                color: yellow,
                borderRadius: BorderRadius.circular(999),
                child: const BdTextWidget(
                  text: '재전송',
                  textStyle: subBrown,
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}



class _Button extends StatelessWidget {
  final CommonSize size;
  final String otp;
  final bool isOtp;
  final bool isLoading;
  final GestureTapCallback onPressed;
  const _Button({
    required this.size,
    required this.otp,
    required this.isOtp,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.sizedBox8,),
          child: BdTextWidget(
            text: otp == '' || isOtp  ? ' ' :  '인증번호가 일치하지 않습니다.',
            textStyle: otp == '' || isOtp ? subWhite : subRed,),
        ),
        switch(isOtp){
          true =>
          switch(isLoading){
            true =>  const BdDisabledButton(text: '인증번호 확인 중...',),
            false =>
                BdNeoButton(
                  size: size,
                  text: '인증번호 확인',
                  onPressed: onPressed,
                )
          },
          _ =>
          const BdDisabledButton(text: '인증번호 입력을 완료해주세요',)
        }
      ],
    );
  }
}






