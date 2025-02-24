import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple_appbar_icon/ripple_appbar_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_side.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BdCanvas extends StatelessWidget {
  final CanvasEnum canvasEnum;
  final Widget body;
  final Widget? navbarWidget;
  final Widget? floatingActionButton;
  final Widget? listener;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final (String?, TextStyle?, Widget? leadingWidget,  Widget? actions)? appbar;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final bool? isPage;
  final bool? isCanPop;
  final bool? isForm;
  final bool? navNullAble;
  final Color? backGroundColor;
  final void Function()? customFunction;
  final bool? isFavorite;
  const BdCanvas({super.key,
    required this.canvasEnum,
    required this.body,
    this.appbar,
    this.navbarWidget,
    this.floatingActionButton,
    this.listener,
    this.floatingActionButtonLocation,
    this.onTap,
    this.onDoubleTap,
    this.isPage,
    this.isCanPop,
    this.isForm,
    this.navNullAble,
    this.backGroundColor,
    this.customFunction,
    this.isFavorite
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: context.read<VerseConfig>().method.invokedCase(
          canvasEnum: canvasEnum,
          context: context,
          isCanPop: isCanPop,
          isForm: isForm,
          customFunction: customFunction,
          isFavorite: isFavorite
      ),

      child: GestureDetector(
        onTap: onTap ?? (isForm == null
            ? null
            : (){FocusScope.of(context).unfocus();}),
        onDoubleTap: onDoubleTap,
        onHorizontalDragEnd: context.read<VerseConfig>().method.dragCase(
            canvasEnum: canvasEnum,
            context: context,
            isCanPop: isCanPop,
            isForm: isForm,
            customFunction: customFunction,
            isFavorite: isFavorite
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: isForm,
            backgroundColor: backGroundColor ?? white,
            appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                listener ?? const SizedBox(),
                Expanded(
                    child: switch(appbar){
                      null => body,
                      _ =>  Column(
                        children: [
                          _BdCanvasAppbar(
                            size: context.read<VerseConfig>().size,
                            leading: context.read<VerseConfig>().method.gestureCase(
                                canvasEnum: canvasEnum,
                                context: context,
                                isCanPop: isCanPop,
                                isForm: isForm,
                                customFunction: customFunction,
                                isFavorite: isFavorite
                            ),
                            isPage: isPage,
                            isCanPop: isCanPop,
                            isForm: isForm,
                            text: appbar!.$1,
                            customStyle: appbar!.$2,
                            leadingWidget: appbar!.$3,
                            actions: appbar!.$4,

                          ),
                          Expanded(
                              child: body
                          )
                        ],
                      )
                    }
                ),
                const _Pad()
              ],
            ),
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: navNullAble == true && navbarWidget == null
                ? Container(
                color: white,
                child: const SafeArea(
                    child:  SizedBox()
                )
            )
                : navNullAble == true && navbarWidget != null ?
            SafeArea(child: Container(color: white, child: navbarWidget,))
            : _DealCanvasNavBar(
              navbarWidget: navbarWidget,
              size: context.read<VerseConfig>().size,
              isHeight60px: context.read<VerseConfig>().cache.mainCache.isHeight60,
            )
        ),
      ),
    );
  }
}


class _DealCanvasNavBar extends StatelessWidget {
  final CommonSize size;
  final Widget? navbarWidget;
  final bool isHeight60px;

  const _DealCanvasNavBar({
    required this.size,
    required this.navbarWidget,
    required this.isHeight60px,

  });

  @override
  Widget build(BuildContext context) {
    return switch(navbarWidget){
      null =>
          Container(
            color: white,
            child: SafeArea(
              child: SizedBox(
                height: isHeight60px ? 0 : size.sized16grid,
              ),
            ),
          ),
      _ => _BdNavbar(navbarWidget: navbarWidget!, size: size, isHeight60px: isHeight60px, )

    };
  }
}

class _BdNavbar extends StatelessWidget {
  final CommonSize size;
  final Widget navbarWidget;
  final bool isHeight60px;
  const _BdNavbar({
    required this.size,
    required this.navbarWidget,
    required this.isHeight60px,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: white,
      child: SafeArea(
        child: switch(isHeight60px){
          true => SizedBox(
            width: size.widthCommon,
            height: size.sizedNav,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.sized16grid),
                  child: navbarWidget,
                )
              ],
            ),
          ),
          false => BdLayoutPadding(
            padding: PaddingEnum.horizontal,
            child: SizedBox(
              height:  size.sizedNavWild,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const BdCustomPad(padEnum: PadEnum.height16),
                  navbarWidget,
                  const BdCustomPad(padEnum: PadEnum.height16),
                ],
              ),
            ),
          ),
        }
      ),
    );
  }
}

class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.read<VerseConfig>().size.extendsGap);
  }
}


class _BdCanvasAppbar extends StatelessWidget {
  final CommonSize size;
  final GestureTapCallback leading;
  final bool? isCanPop;
  final bool? isForm;
  final bool? isPage;
  final Widget? leadingWidget;
  final Widget? actions;
  final String? text;
  final TextStyle? customStyle;
  const _BdCanvasAppbar({
    required this.size,
    required this.leading,
    this.isCanPop,
    this.isForm,
    this.actions,
    required this.isPage,
    this.leadingWidget,
    this.text,
    this.customStyle,
  });

  @override
  Widget build(BuildContext context) {
    return BdLayoutSide(
      sidePadding: SidePadding.canvasAppbar,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BasicBackButton(
            size: size,
            isCanPop: isCanPop,
            isForm: isForm,
            onTap: leading,
            leadingWidget: leadingWidget,
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: size.sizedPaddingOnlyAppBar),
                child: text == null ? const SizedBox() : _BasicText(
                  isPage: isPage,
                  size: size,
                  text: text == '' ? ' ' : text, customStyle: customStyle,),
              )),
          actions ?? const RippleIconOnButtonDefault(),
        ],
      ),
    );
  }
}

class _BasicBackButton extends StatelessWidget {
  final CommonSize size;
  final bool? isCanPop;
  final bool? isForm;
  final GestureTapCallback onTap;
  final Widget? leadingWidget;
  const _BasicBackButton({
    required this.size,
    this.isCanPop,
    this.isForm,
    required this.onTap,
    this.leadingWidget,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return leadingWidget ??
        RippleIconOnButton(
            size: size,
            onTap:  onTap,
            icon: Icons.arrow_back_ios
        );

    //     RippleBackButton(
    //     onTap: onTap ?? (){
    //       switch(isCanPop){
    //         case false:
    //           CommonDialog().closeAppDialog(context);
    //         case true:
    //           if(isForm != null){
    //             if(MediaQuery.of(context).viewInsets.bottom > 0){
    //               FocusScope.of(context).unfocus();
    //             } else{
    //               ApiProviderOnlyNoRepository().closePage(context);
    //             }
    //           } else{
    //             ApiProviderOnlyNoRepository().closePage(context);
    //           }
    //         default:
    //           ApiProviderOnlyNoRepository().closePage(context);
    //       }
    //     },
    //
    // );
  }
}


class _BasicText extends StatelessWidget {
  final CommonSize size;
  final String? text;
  final bool? isPage;
  final TextStyle? customStyle;
  const _BasicText({
    required this.isPage,
    required this.size,
    this.text, this.customStyle});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      fit: BoxFit.scaleDown,
      child: Text(text!,
        style: isPage == null ?
        customStyle ?? TextStyle(
          color: bananaBack,
          fontSize: size.titleMain,
          fontWeight: FontWeight.w600,
        ) : TextStyle(
          color: bananaBack,
          fontSize: size.sizedBox24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}



// class _SkeletonBody extends StatefulWidget {
//   final CanvasEnum canvasEnum;
//   final Widget body;
//   final Widget? navbarWidget;
//   final Widget? floatingActionButton;
//   final Widget? listener;
//   final FloatingActionButtonLocation? floatingActionButtonLocation;
//   final (String?, TextStyle?, Widget? leadingWidget,  Widget? actions)? appbar;
//   final GestureTapCallback? onTap;
//   final GestureTapCallback? onDoubleTap;
//   final bool? isPage;
//   final bool? isCanPop;
//   final bool? isForm;
//   final bool? navNullAble;
//   final Color? backGroundColor;
//   final void Function()? customFunction;
//   final bool? isFavorite;
//   const _SkeletonBody({
//     required this.canvasEnum,
//     required this.body,
//     required this.appbar,
//     required this.navbarWidget,
//     required this.floatingActionButton,
//     required this.listener,
//     required this.floatingActionButtonLocation,
//     required this.onTap,
//     required this.onDoubleTap,
//     required this.isPage,
//     required this.isCanPop,
//     required this.isForm,
//     required this.navNullAble,
//     required this.backGroundColor,
//     required this.customFunction,
//     required this.isFavorite
//   });
//
//   @override
//   State<_SkeletonBody> createState() => _SkeletonBodyState();
// }
//
// class _SkeletonBodyState extends State<_SkeletonBody> {
//   bool _enabled = true;
//
//   @override
//   void initState() {
//     super.initState();
//     // 위젯 트리의 첫 번째 프레임 렌더링이 끝난 후 실행
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       print("화면 렌더링 완료!");
//       setState(() {
//         _enabled = false;
//       });
//       // 렌더링 완료 후에 실행할 작업
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       enabled: _enabled,
//       enableSwitchAnimation: true,
//       child: Scaffold(
//           resizeToAvoidBottomInset: widget.isForm,
//           backgroundColor: widget.backGroundColor ?? white,
//           appBar: AppBar(),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               widget.listener ?? const SizedBox(),
//               Expanded(
//                   child: switch(widget.appbar){
//                     null => widget.body,
//                     _ =>  Column(
//                       children: [
//                         _BdCanvasAppbar(
//                           size: context.read<VerseConfig>().size,
//                           leading: context.read<VerseConfig>().method.gestureCase(
//                               canvasEnum: widget.canvasEnum,
//                               context: context,
//                               isCanPop: widget.isCanPop,
//                               isForm: widget.isForm,
//                               customFunction: widget.customFunction,
//                               isFavorite: widget.isFavorite
//                           ),
//                           isPage: widget.isPage,
//                           isCanPop: widget.isCanPop,
//                           isForm: widget.isForm,
//                           text: widget.appbar!.$1,
//                           customStyle: widget.appbar!.$2,
//                           leadingWidget: widget.appbar!.$3,
//                           actions: widget.appbar!.$4,
//
//                         ),
//                         Expanded(
//                             child: widget.body
//                         )
//                       ],
//                     )
//                   }
//               ),
//               const _Pad()
//             ],
//           ),
//           floatingActionButtonLocation: widget.floatingActionButtonLocation,
//           floatingActionButton: widget.floatingActionButton,
//           bottomNavigationBar: widget.navNullAble == true && widget.navbarWidget == null
//               ? Container(
//               color: white,
//               child: const SafeArea(
//                   child:  SizedBox()
//               )
//           )
//               : widget.navNullAble == true && widget.navbarWidget != null ?
//           SafeArea(child: Container(color: white, child: widget.navbarWidget,))
//               : _DealCanvasNavBar(
//             navbarWidget: widget.navbarWidget,
//             size: context.read<VerseConfig>().size,
//             isHeight60px: context.read<VerseConfig>().cache.mainCache.isHeight60,
//           )
//       ),
//     );
//   }
// }