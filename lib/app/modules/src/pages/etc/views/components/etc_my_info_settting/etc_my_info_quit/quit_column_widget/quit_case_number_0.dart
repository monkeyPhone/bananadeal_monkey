import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_my_info_settting/etc_my_info_quit/quit_column_widget/quit_case_number_text.dart';
import 'package:flutter/material.dart';

class QuitCaseNumber0 extends StatelessWidget {
  const QuitCaseNumber0({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuitCaseNumberText(text: '채팅, 후기 등 모든 회원 정보에 접근할수 없어요.'),
        QuitCaseNumberText(text: '계정이 삭제된 이후에는 회원 정보를 복구할 수 없어요.'),
        QuitCaseNumberText(text: '현재 계정으로 다시 로그인할 수 없으며, 재가입을 해야만 해요.'),
        QuitCaseNumberText(text: '다른 사용자에게 보낸 채팅 메시지, 거래 후기 등 일부 정보는 계속 남아있을 수 있어요.'),
      ],
    );
  }
}
