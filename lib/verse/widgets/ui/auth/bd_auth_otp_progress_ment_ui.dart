import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdAuthOtpProgressMentUi extends StatelessWidget {
  final OtpProgressEnum progressEnum;
  const BdAuthOtpProgressMentUi({super.key,
    required this.progressEnum
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      width: size.widthCommon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BdCustomPad(padEnum: PadEnum.height16),
          Text(
            switch(progressEnum){
              OtpProgressEnum.email =>
              '인증을 진행할 메일을 입력해주세요.',
              OtpProgressEnum.otp =>
              '인증 번호를 입력해주세요.',
              OtpProgressEnum.pw =>
              '비밀번호를 입력해주세요.',
              OtpProgressEnum.finish =>
              '잠시만 기다려주세요.'
            },
            style: TextStyle(
              fontSize: size.sizedBox16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
