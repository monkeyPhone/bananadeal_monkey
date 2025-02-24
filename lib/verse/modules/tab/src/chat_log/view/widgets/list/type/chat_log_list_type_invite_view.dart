import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder3.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatLogListTypeInviteView extends StatelessWidget {
  const ChatLogListTypeInviteView({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      margin: EdgeInsets.only(bottom: size.sizedBox28),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: size.sizedBox34,
                maxHeight: double.infinity,
                minWidth: size.widthCommon,
                maxWidth: size.widthCommon

            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.sizedBox12),
                color: yellow
            ),
            padding: EdgeInsets.all(size.sizedBox1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.sizedBox12),
                color: white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BdSvgBinder3(size: size, asset: iconBanana,),
                  const BdCustomPad(padEnum: PadEnum.width8),
                  Text(
                    '초대장을 보냈어요!'
                    ,
                    style: TextStyle(fontSize: size.sizedBox14, fontWeight: FontWeight.w400, color: brown),
                  ),
                  const BdCustomPad(padEnum: PadEnum.width8),
                  BdSvgBinder3(size: size, asset: iconBanana2,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
