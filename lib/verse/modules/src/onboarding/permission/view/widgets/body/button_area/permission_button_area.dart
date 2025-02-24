import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/permission/src/permission_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_deal.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/app_data/bd_rich_text_element.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/view/widgets/body/permission_body_text_widget.dart';


class PermissionButtonArea extends StatelessWidget {
  const PermissionButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        const _PermissionButtonFrame(
          title: '알림', sub: '',
          explain: permissionNoti,
          explainMini: '알림 메시지는 앱 설정에서 수신 거부 가능해요',
          iconMain: Icons.notifications,
          mainIconColor: yellow,
        ),

        _PermissionButtonFrame(
          title: '위치',
          sub: context.read<PermissionRepositoryImpl>().sdkVersion
              == 0 ? '(선택)' : '',
          explain: permissionLocation,
          explainMini: null,
          iconMain: Icons.location_on,
          mainIconColor: cocacolaRed,
        ),

        context.read<PermissionRepositoryImpl>().sdkVersion >= 33 || context.read<PermissionRepositoryImpl>().sdkVersion == 0
            ?  _PermissionButtonFrame(
          title: '사진',
          sub: context.read<PermissionRepositoryImpl>().sdkVersion == 0 ? '(선택)' : '',
          explain: permissionPhoto,
          explainMini: null,
          iconMain: Icons.photo,
          mainIconColor: smaragdineGreen,
        )
            :   _PermissionButtonFrame(
          title: '저장소',
          sub: context.read<PermissionRepositoryImpl>().sdkVersion == 0 ? '(선택)' : '',
          explain: permissionPhoto,
          explainMini: null,
          iconMain: Icons.storage,
          mainIconColor: smaragdineGreen,
        ),

        _PermissionButtonFrame(
          title: '카메라',
          sub: context.read<PermissionRepositoryImpl>().sdkVersion == 0 ? '(선택)' : '',
          explain: permissionCamera,
          explainMini: null,
          iconMain: Icons.camera_alt,
          mainIconColor: ironGrey,
        ),
      ],
    );
  }
}


class _PermissionButtonFrame extends StatelessWidget {
  final String title;
  final String sub;
  final String explain;
  final String? explainMini;
  final IconData iconMain;
  final Color mainIconColor;
  const _PermissionButtonFrame({
    required this.title,
    required this.sub,
    required this.explain,
    required this.explainMini,
    required this.iconMain,
    required this.mainIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PermissionButtonFrameTitle(
          title: title,
          sub: sub,
          iconMain: iconMain,
          mainIconColor: mainIconColor,
        ),
        const BdCustomPad(padEnum: PadEnum.height8),
        Padding(
          padding: EdgeInsets.only(left: size.sized12grid),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PermissionTextThinWidget(text: explain, size: size,),
              explainMini != null ?
              Column(
                children: [
                  const BdCustomPad(padEnum: PadEnum.height4),
                  PermissionTextSmallWidget(text: explainMini!, size: size),
                ],
              ) : const SizedBox(),
            ],
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.height32),
      ],
    );
  }
}

class _PermissionButtonFrameTitle extends StatelessWidget {
  final String title;
  final String sub;
  final IconData iconMain;
  final Color? mainIconColor;
  const _PermissionButtonFrameTitle({
    required this.title,
    required this.sub,
    required this.iconMain,
    required this.mainIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      height: size.sizedBox37,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: EdgeInsets.all(size.sized6grid),
                child: Icon(iconMain, color: mainIconColor, size: size.titleLarge,),
              )
          ),
          const BdCustomPad(padEnum: PadEnum.width4),
          BdRichText(
              children: [
                BdRichTextElement(
                    text: title,
                    style: TextStyle(
                    fontSize: size.body,
                    color: blackWrite,
                    fontWeight: FontWeight.w700
                  )
                ),
                BdRichTextElement(
                  text: ' ',
                  style: TextStyle(
                      fontSize: size.sub,
                      color: ultimateGrey,
                      fontWeight: FontWeight.w700
                  ),
                ),
                BdRichTextElement(
                    text: sub,
                    style: TextStyle(
                        fontSize: size.special,
                        color: ultimateGrey,
                        fontWeight: FontWeight.w700
                    ),
                ),
              ]
          )
        ],
      ),
    );
  }
}
