// import 'package:banana_deal_by_monkeycompany/verse/const/const_label.dart';
// import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/manager/info_setting_manager.dart';
// import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/state/bloc/banana_info_thumbnail/banana_info_thumbnail_bloc.dart';
// import 'package:banana_deal_by_monkeycompany/verse/service/config/verse_config.dart';
// import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
// import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class EtcTabInfoSettingActionsView extends StatelessWidget {
//   const EtcTabInfoSettingActionsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
//
//
// class _Button extends StatelessWidget {
//   final GestureTapCallback onTap;
//   final String textStyle;
//   final String text;
//
//
//   const _Button({
//     required this.onTap,
//     required this.textStyle,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BdRippleButtonBasic(
//         padding: EdgeInsets.all(context
//             .read<VerseConfig>()
//             .widgetSize.sized12grid),
//         margin: EdgeInsets.only(
//             right: context
//                 .read<VerseConfig>()
//                 .widgetSize.sized8grid
//         ),
//         onTap: onTap,
//         child: BdTextWidget(text: text, textStyle: textStyle,)
//     );
//   }
// }
//
