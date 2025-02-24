import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/sheet/browser_bottom_sheet_option.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowserBottomSheet {
  final BrowserBottomSheetOption option;
  const BrowserBottomSheet({
    required this.option
  });

  void showSheet({
    required BuildContext routerContext,
    required List<BottomSheetVO> sheetList,
    List<String>? caption
  }){
    showModalBottomSheet<void>(
        useSafeArea: true,
        context: routerContext,
        builder: (BuildContext context) =>
            _BottomSheet(
              size: context.read<VerseConfig>().size,
              sheetList: sheetList,
              caption: caption,
            )

    );
  }

}

class _BottomSheet extends StatelessWidget {
  final CommonSize size;
  final List<BottomSheetVO> sheetList;
  final List<String>? caption;
  const _BottomSheet({
    required this.size,
    required this.sheetList,
    this.caption
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
             fit: FlexFit.loose,
             child: Scrollbar(
               thumbVisibility: true,
               child: SingleChildScrollView(
                 physics: const ClampingScrollPhysics(),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: List.generate(
                       sheetList.length,
                           (index) =>
                           BdRippleButtonBasic(
                               inerMargin: EdgeInsets.symmetric(horizontal: size.sizedBox8),
                               padding: EdgeInsets.symmetric(
                                   horizontal: size.sized16grid
                               ),
                               onTap: sheetList[index].onTap,
                               width: size.widthCommon,
                               height: size.sizedSheet,
                               child: Center(
                                   child: FittedBox(
                                     fit: BoxFit.scaleDown,
                                     child: BdTextWidget(
                                       text:  caption == null
                                           ? sheetList[index].buttonName
                                           : caption![index] == '' ? sheetList[index].buttonName
                                           : '${sheetList[index].buttonName} (${caption![index]})',
                                       textStyle: callout,
                                     ),
                                   )
                               )
                           )
                   ).toList(),
                 ),
               ),
             ),
           ),
            BdRippleButtonBasic(
                padding: EdgeInsets.only(
                    top: size.sized16grid,
                    bottom: size.sized16grid,
                ),
                onTap: (){
                  context.read<VerseConfig>().route.closePage(context);
                },
                width: size.widthCommon,
                child: const Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: BdTextWidget(
                        text:  '닫기',
                        textStyle: subRed,
                      ),
                    )
                )
            )
          ],
        ),
      ),
    );
  }


}
