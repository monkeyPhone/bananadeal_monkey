import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/view/widgets/body/button_area/permission_button_area.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/view/widgets/body/permission_body_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionBodyView extends StatelessWidget {
  const PermissionBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  Column(
      children: [
        const BdCustomPad(padEnum: PadEnum.height8),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(
                left: size.sized16grid,
                right: size.sized16grid
            ),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PermissionText(text: '바나나딜은 아래 권한들을 필요로 합니다.', size: size),

                  context.read<VerseConfig>().cache.mainCache.isIos
                      ? const SizedBox()
                      :  PermissionText(text: '앱 서비스 이용을 위해서는 권한 요청 시 허용해주세요.', size: size),
                  SizedBox(height: size.permissionGap,)
                ],
              ),
              const PermissionButtonArea(),

            ],
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
      ],
    );
  }
}