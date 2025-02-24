import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';


class BdTextAddressTile extends StatelessWidget {
  final CommonSize size;
  final String addInfo;
  const BdTextAddressTile({super.key,
    required this.size,
    required this.addInfo
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.sizedBox8, vertical: size.sizedBox5),
          decoration: BoxDecoration(
              border: Border.all(color: yellow, width: size.width00025),
              borderRadius: BorderRadius.circular(size.sizedBox50)
          ),
          child: Text('주소',
            style: TextStyle(fontSize: size.sub, color: brown, fontWeight:  FontWeight.w400
            ),
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.width12),
        Expanded(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            strutStyle: StrutStyle(fontSize: size.body),
            text: TextSpan(
                text:
                addInfo,
                style: TextStyle(
                  color: bananaBack,
                  fontSize: size.body,
                )),
          ),
        ),
      ],
    );
  }
}