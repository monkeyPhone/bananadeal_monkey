import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/address_result/bd_text_address_tile.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';



class BdTextAddressResult extends StatelessWidget {
  final CommonSize size;
  final String dong;
  final String road;
  final EdgeInsetsGeometry? padding;
  const BdTextAddressResult({super.key,
    required this.size,
    required this.dong,
    required this.road,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BdTextWidget(
            text: dong,
            textStyle: titleMainBold,
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          BdTextAddressTile(size: size, addInfo: road),
        ],
      ),
    );
  }
}




