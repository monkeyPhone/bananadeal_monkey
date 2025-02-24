import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/manager/chat_log_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder3.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatLogListTypeAcceptView extends StatelessWidget {
  final ChatLogDto chatLog;
  const ChatLogListTypeAcceptView({super.key,
    required this.chatLog
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      margin: EdgeInsets.only(bottom: size.width00655),
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
                color: chatLog.cType == 'USER'
                    ? yellow : white
            ),
            padding: EdgeInsets.all(size.sizedBox1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.sizedBox12),
                color: white,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: size.sizedBox8,
                  vertical: size.sizedBox12
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BdSvgBinder3(size: size, asset: iconBanana,),
                      const BdCustomPad(padEnum: PadEnum.width8),
                      Text('딜을 수락했어요',
                        style: TextStyle(
                            fontSize: size.sizedBox14,
                            fontWeight: FontWeight.w700,
                            color: brown
                        ),
                      ),
                      const BdCustomPad(padEnum: PadEnum.width8),
                      BdSvgBinder3(size: size, asset: iconBanana2,),
                    ],
                  ),
                  const BdCustomPad(padEnum: PadEnum.height12),
                  Column(
                    children: [
                      Text('딜을 수락해주셔서 감사합니다!',
                        style: TextStyle(fontSize: size.sizedBox14, fontWeight: FontWeight.w700, color: blackWrite),
                      ),
                      Text('아래에서 매장 위치를 확인해주세요.',
                        style: TextStyle(fontSize: size.sizedBox14, fontWeight: FontWeight.w700, color: blackWrite),
                      ),
                    ],
                  ),
                  const BdCustomPad(padEnum: PadEnum.height12),
                  _ClipBoardText(
                      name: '주소',
                      text: context.read<ChatLogManager>().room.smAddress
                  ),

                  const BdCustomPad(padEnum: PadEnum.height8),
                  _ClipBoardText(
                      name: '전화',
                      text: context.read<ChatLogManager>().room.smTel,
                      trim: true
                  ),
                  const BdCustomPad(padEnum: PadEnum.height16),
                  Container(
                    padding: EdgeInsets.only(top: size.sizedBox6_5),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: size.sizedBox1, color: greyD7D7D7)
                        )
                    ),
                    height: size.etc0156,
                    width: size.widthCommon,
                    child: Row(
                      children: [
                        _FlexibleButton( icon: iconCall, text: '전화하기', isBorder: true, onTap: () async{

                        }),
                        _FlexibleButton(
                            icon: iconMap, text: '지도에서 보기', isBorder: true,
                            onTap: () async{

                            }),
                        _FlexibleButton(icon: iconReview, text: '상담 후기 쓰기', isBorder: false, onTap: () async{

                        },),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class _ClipBoardText extends StatelessWidget {
  final String name;
  final String text;
  final bool? trim;

  const _ClipBoardText({
    required this.name,
    required this.text,
    this.trim,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
        onTap: (){
          context.read<ChatLogManager>().clipBoard();
        },
        width: size.widthCommon,
        padding: EdgeInsets.symmetric(vertical: size.sizedBox2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: size.sizedBox16, left: size.sizedBox12),
              child: Text(name, style: TextStyle(
                  fontSize: size.sizedBox12,
                  fontWeight: FontWeight.w400,
                  color: blackWrite
              ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            Expanded(
              child: Text(text, style: TextStyle(
                  fontSize: size.sizedBox14,
                  fontWeight: FontWeight.w700,
                  color: brown
              ),
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.sizedBox12),
              child: BdSvgBinder(icon: iconCopy, size: size.sizedBox11, color: brown,),
            ),
          ],
        )
    );
  }
}

class _FlexibleButton extends StatelessWidget {
  final String icon;
  final String text;
  final bool isBorder;
  final GestureTapCallback onTap;
  const _FlexibleButton({
    required this.icon,
    required this.text,
    required this.isBorder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  Flexible(
        fit: FlexFit.tight,
        child: BdRippleButtonBasic(
          onTap: onTap,
          border: !isBorder ? null : Border(right: BorderSide(width: size.sizedBox1, color: greyEAEAEA)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BdSvgBinder(icon: icon, size: size.sizedBox18, color: grey999999,),
              Text(text, style: TextStyle(fontSize: size.sizedBox12, color: grey333333),)
            ],
          ),
        )
    );
  }
}

