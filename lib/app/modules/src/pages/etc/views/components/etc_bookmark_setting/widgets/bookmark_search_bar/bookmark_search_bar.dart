// import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
// import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
// import 'package:banana_deal_by_monkeycompany/app/models/store/store_list_info.dart';
// import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/widgets/sign_text_form.dart';
// import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_bookmark_setting_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../../../../../../components/widget_components/ripple_button/ripple_search_icon_button.dart';
//
// class BookMarkSearchBar extends GetView<EtcBookmarkSettingController> {
//   final List<Sinfo> store;
//   const BookMarkSearchBar({
//     required this.store,
//     super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       store.length >= 10
//       ?
//       Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: WidgetSize(context).sizedBox16,
//           vertical: WidgetSize(context).sizedBox8
//       ),
//       child: SignTextForm(
//           hintText: '검색어를 입력해주세요.',
//           controller: controller.bookmarkSearch,
//           keyboardType: TextInputType.text,
//           enabled: true,
//           textInputAction: TextInputAction.search,
//           suffixIcon: RippleSearchIconButton(
//             onTap: (){
//               FocusManager.instance.primaryFocus?.unfocus();
//             },
//           ),
//           onChanged: controller.searchButton,
//           onFieldSubmitted: controller.searchButton,
//           inputTextStyle: TextStyle(
//               fontSize: WidgetSize(context).sizedBox14,
//               color: Style.blackWrite,
//               fontWeight: FontWeight.w400
//           )
//       ),
//     ) : SizedBox(height: WidgetSize(context).extendsGap,)
//     ;
//   }
// }
