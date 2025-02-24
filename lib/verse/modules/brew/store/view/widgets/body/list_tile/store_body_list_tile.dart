// import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/manager/store_manager.dart';
// import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/model/data/store_vo.dart';
// import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
// import 'package:banana_deal_by_monkeycompany/verse/service/config/size/widget_sized.dart';
// import 'package:banana_deal_by_monkeycompany/verse/service/config/verse_config.dart';
// import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
// import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
// import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
// import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../../../const/const_color.dart';
// import '../../../../../../../const/const_image.dart';
// import '../../../../../../../const/const_label.dart';
// import '../../../../../../../const/const_string.dart';
//
// class StoreBodyListTile extends StatelessWidget {
//   final StoreVO storeVO;
//   final WidgetSized widgetSize;
//   const StoreBodyListTile({super.key,
//     required this.storeVO,
//     required this.widgetSize,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return  _StoreTile(
//       onTapF: context.read<VerseConfig>().func.helper.commonFunction.debounce(
//           callback: (){
//             context.read<StoreManager>().updateFavorite(
//               context: context,
//               smId: storeVO.smMId,
//               mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
//               isFavorite: storeVO.favoriteStore == 0,
//             );
//           }
//       ),
//       onTap: (){
//         context.read<StoreManager>().storeTileClick(context: context, storeVO: storeVO);
//       },
//       widgetSize: widgetSize,
//       storeVO: storeVO,
//     );
//   }
// }
//
//
//
// class _StoreTile extends StatelessWidget {
//   final GestureTapCallback onTap;
//   final GestureTapCallback onTapF;
//   final WidgetSized widgetSize;
//   final StoreVO storeVO;
//   const _StoreTile({
//     required this.onTap,
//     required this.onTapF,
//     required this.widgetSize,
//     required this.storeVO
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BdRippleButtonBasic(
//         padding: EdgeInsets.only(
//           left: widgetSize.sized8grid,
//         ),
//         border: Border(
//             bottom: BorderSide(width: widgetSize.sizedBox1, color: greyDDDDDD)
//         ),
//         key: key,
//         onTap: onTap,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const BdCustomPad(padEnum: PadEnum.height16),
//             _ProfileBox(
//               onTap: onTapF,
//               widgetSize: widgetSize,
//               storeVO: storeVO,
//             ),
//             const BdCustomPad(padEnum: PadEnum.height16),
//             _IntroduceBox(
//               widgetSize: widgetSize,
//               introduce: storeVO.smStoreIntroduce,
//             ),
//             const BdCustomPad(padEnum: PadEnum.height20),
//           ],
//         )
//     );
//   }
// }
//
// class _ProfileBox extends StatelessWidget {
//   final WidgetSized widgetSize;
//   final StoreVO storeVO;
//   final GestureTapCallback onTap;
//   const _ProfileBox({
//     required this.widgetSize,
//     required this.storeVO,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         _ImageArea(
//           widgetSize: widgetSize,
//           imageUrl: storeVO.smPathImg0,
//           openInfo: context.read<VerseConfig>().func.helper.commonFunction.calculateTime(
//               smTimeStart: storeVO.smTimeStart,
//               smTimeEnd: storeVO.smTimeEnd,
//               smConsultationTime: storeVO.smConsultationTime
//           ),
//         ),
//         const BdCustomPad(padEnum: PadEnum.width12),
//         _InfoArea(
//           widgetSize: widgetSize,
//           storeVO: storeVO,
//           onTap: onTap,
//         ),
//
//
//
//       ],
//     );
//   }
// }
//
// class _InfoArea extends StatelessWidget {
//   final WidgetSized widgetSize;
//   final StoreVO storeVO;
//   final GestureTapCallback onTap;
//   const _InfoArea({
//     required this.widgetSize,
//     required this.storeVO,
//     required this.onTap,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _InfoString(
//             widgetSize: widgetSize,
//             storeVO: storeVO,
//           ),
//           const BdCustomPad(padEnum: PadEnum.width8),
//           _BookMarkButton(
//             widgetSize: widgetSize,
//             isBookMark: storeVO.favoriteStore != 0,
//             onTap: onTap,
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class _InfoString extends StatelessWidget {
//   final WidgetSized widgetSize;
//   final StoreVO storeVO;
//   const _InfoString({
//     required this.widgetSize,
//     required this.storeVO
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const BdCustomPad(padEnum: PadEnum.height8),
//           LayoutBuilder(
//               builder: (context, constraints){
//                 return  SizedBox(
//                   width: constraints.maxWidth,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Flexible(
//                         child: BdTextWidget(
//                           text: storeVO.smStoreName,
//                           maxLines: 3,
//                           textStyle: titleLittleBold,
//                         ),
//                       ),
//                       const BdCustomPad(padEnum: PadEnum.width12),
//                       _Distance(widgetSize: widgetSize, smRange: storeVO.smRange,),
//                       const BdCustomPad(padEnum: PadEnum.width8),
//                     ],
//                   ),
//                 );
//               }
//
//           ),
//           const BdCustomPad(padEnum: PadEnum.height8),
//           _RowArea(
//             title: '참여',
//             content: '${storeVO.sendDeal}건/${storeVO.inviteDeal}건',
//           ),
//           const BdCustomPad(padEnum: PadEnum.height1),
//           _RowArea(
//             title: '수락',
//             content: '${storeVO.openDeal} 건',
//           ),
//           const BdCustomPad(padEnum: PadEnum.height1),
//           _RowArea(
//             title: '후기',
//             content: '${storeVO.reviewCnt} 건',
//           ),
//           const BdCustomPad(padEnum: PadEnum.height1),
//           _RowArea(
//             title: '평점',
//             icon: Icon(Icons.star,color: yellow, size: widgetSize.sized16grid,),
//             content: storeVO.avgPoint == '' ? '0.0' : storeVO.avgPoint,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _RowArea extends StatelessWidget {
//   final String title;
//   final String content;
//   final Widget? icon;
//   const _RowArea({
//     required this.title,
//     required this.content,
//     this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         BdTextWidget(
//           text: title,
//           textStyle: subGrey,
//         ),
//         const BdCustomPad(padEnum: PadEnum.width8),
//         icon ?? const SizedBox(),
//         BdTextWidget(
//           text: content,
//           textStyle: sub,
//         ),
//       ],
//     );
//   }
// }
//
//
// class _Distance extends StatelessWidget {
//   final WidgetSized widgetSize;
//   final double smRange;
//   const _Distance({
//     required this.widgetSize,
//     required this.smRange,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: widgetSize.sizedBox3,
//             vertical: widgetSize.sizedBox1
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(widgetSize.sizedBox6_5),
//           color: ultimateGrey,
//         ),
//         child: Text(
//           smRange < 1.0
//               ?
//           '${(smRange*1000).roundToDouble().toInt()}m'
//               :
//           '${(smRange).toStringAsFixed(1)}km',
//           style: TextStyle(
//             fontSize: widgetSize.sub,
//             fontWeight: FontWeight.w400,
//             color: white,
//           ),
//         )
//
//
//     );
//   }
// }
//
//
//
// class _BookMarkButton extends StatelessWidget {
//   final WidgetSized widgetSize;
//   final bool isBookMark;
//   final GestureTapCallback onTap;
//
//   const _BookMarkButton({
//     required this.widgetSize,
//     required this.isBookMark,
//     required this.onTap
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       //   RippleIconsButton(
//       //   onTap: onTap,
//       //   backColor: Colors.transparent,
//       //   iconColor:  !isBookMark
//       //       ? yellow : bananaBack,
//       //   widgetSize: widgetSize,
//       //   icon:  !isBookMark
//       //       ? Icons.bookmark
//       //       : Icons.bookmark_border,
//       // );
//       SizedBox(
//           width: widgetSize.sizedBox32,
//           height: widgetSize.sizedBox32,
//           child: FittedBox(
//               child:
//
//               isBookMark
//                   ? const Icon(Icons.bookmark, color: yellow)
//                   : const SizedBox()
//           )
//       );
//   }
// }
//
//
// class _ImageArea extends StatelessWidget {
//   final WidgetSized widgetSize;
//   final String imageUrl;
//   final (bool isReg, bool isOpen, String dayPas) openInfo;
//   const _ImageArea({
//     required this.widgetSize,
//     required this.imageUrl,
//     required this.openInfo,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final BorderRadiusGeometry borderRadius = BorderRadius.circular(widgetSize.sizedBox15);
//     return Card(
//       shape: RoundedRectangleBorder(
//           borderRadius: borderRadius
//       ),
//       elevation: widgetSize.sizedBox2,
//       child: ClipRRect(
//         borderRadius: borderRadius,
//         child: Stack(
//           children: [
//             BdImageBinder(
//                 imageRadius: borderRadius,
//                 imageWidth: widgetSize.sizedBox110,
//                 imageHeight: widgetSize.sizedBox110,
//                 imageUrl: '${context.read<VerseConfig>().dio.dioAction.dioFunc.restUrl.imageBananaUrl}$imageUrl',
//                 errUrl: defaultStore,
//                 imageLabel: caseThumb
//             ),
//             !openInfo.$1 || !openInfo.$2
//                 ? Positioned.fill(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius:borderRadius,
//                     color: Colors.black45,
//                   ),
//                   child: const Center(
//                     child: BdTextWidget(
//                       text: '상담 대기',
//                       textStyle: calloutWhiteBold,
//                       maxLines: 4,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 )
//             )
//                 : const SizedBox()
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// class _IntroduceBox extends StatelessWidget {
//   final WidgetSized widgetSize;
//   final String introduce;
//   const _IntroduceBox({
//     required this.widgetSize,
//     required this.introduce
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widgetSize.widthCommon,
//       decoration: BoxDecoration(
//           border: Border.all(color: yellow, width: widgetSize.sizedBox1),
//           borderRadius: BorderRadius.circular(999)
//       ),
//       padding: EdgeInsets.all(widgetSize.sized8grid),
//       child: RichText(
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         textAlign: TextAlign.start,
//         text: TextSpan(
//             text: introduce == '' ? '등록된 매장 소개글이 없습니다.' : introduce,
//             style: TextStyle(
//                 color:introduce == '' ? greyWrite : blackWrite,
//                 fontWeight: FontWeight.w400, fontSize: widgetSize.sizedBox12)
//         ),
//       ),
//     );
//   }
// }
//
