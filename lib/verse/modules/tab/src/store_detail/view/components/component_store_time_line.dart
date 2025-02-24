import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';



class ComponentStoreTimeLine extends StatelessWidget {
  final CommonSize size;
  final (bool isReg, bool isOpen, String dayPas) openInfo;
  final String smTimeStart;
  final String smTimeEnd;
  const ComponentStoreTimeLine({super.key,
    required this.size,
    required this.openInfo,
    required this.smTimeStart,
    required this.smTimeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return switch(openInfo.$1){
      true => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.access_time_outlined, size: size.width004, color: grey666666,),
          const BdCustomPad(padEnum: PadEnum.width8),
          BdTextWidget(text: openInfo.$3, textStyle: sub,),
          const BdCustomPad(padEnum: PadEnum.width8),
          BdTextWidget(text: smTimeStart, textStyle:  sub),
          const BdCustomPad(padEnum: PadEnum.width4),
          const BdTextWidget(text: '~', textStyle: sub),
          const BdCustomPad(padEnum: PadEnum.width4),
          BdTextWidget(text: smTimeEnd, textStyle: sub),
          const BdCustomPad(padEnum: PadEnum.width8),
          openInfo.$2
              ? const BdTextWidget(text: '상담 가능', textStyle: subBrown,)
              : const BdTextWidget(text: '상담 대기', textStyle: subGrey,),
        ],
      ) ,
      false => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time_outlined, size: size.width004, color: grey666666,),
          const BdCustomPad(padEnum: PadEnum.width8),
          const BdTextWidget(text: '상담시간 미등록', textStyle: subGreyBold,),
        ],
      ),
    };
  }
}