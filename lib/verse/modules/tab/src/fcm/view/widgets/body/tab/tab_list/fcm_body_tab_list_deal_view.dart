import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/fcm_message_deal_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/view/widgets/body/tab/tab_list/components/fcm_body_tap_list_normal_box_components_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder3.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FcmBodyTabListDealView extends StatelessWidget {
  final NotiEntity dto;
  const FcmBodyTabListDealView({super.key,
    required this.dto,
  });

  @override
  Widget build(BuildContext context) {
    return  dto.title.contains('종료') || dto.title.contains('개통되었습니다.')
        ? _DealOpenEnd(dto: dto)
        : _DealBox(dto: dto,);
  }
}

class _DealOpenEnd extends StatelessWidget {
  final NotiEntity dto;
  const _DealOpenEnd({
    required this.dto,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      padding: EdgeInsets.all(
          dto.title.contains('종료')
              ? size.sizedBox7_5
              : size.sizedBox10
      ),
      decoration: BoxDecoration(
        color: dto.isRead ? white : cream,
        borderRadius: BorderRadius.circular(size.sizedBox10),
      ),
      child: dto.title.contains('종료')
          ? _DealEnd(dto: dto)
          :  _DealOpen(
          messageVO: dto.name == ''
              ? FcmMessageDealVO(name: '', deMonthTotalPrice: 0, deMonthPrice: 0, deOptionalSale: 0, deOptionalMonth: '', dePlanBasic: 0, deInstallmentPrincipal: 0, deCash: 0, deSupportPrice: 0, deFactoryPrice: 0, deSupportType: '', deInstallmentMonth: 0, dePlan: '', dePsName: '', deJoinTkIdx: 0, deType: '')
              : fcmMessageDealVOFromJson(dto.name)),
    );

    // Card(
    // margin: EdgeInsets.all(WidgetSize(context).sizedBox16),
    // color: dto.isRead ? Style.white : Style.cream,
    // elevation: WidgetSize(context).sizedBox10,
    //   child: ,
    // );
  }
}

class _DealEnd extends StatelessWidget {
  final NotiEntity dto;
  const _DealEnd({
    required this.dto,
  });

  @override
  Widget build(BuildContext context) {
    try{
      return  _NotificationSvgTextLine(
          startIconAsset: iconSvgSiren,
          endIconAsset: iconSvgSiren,
          hilightColor: Colors.red.shade50,
          richText: dto.name == '' ? 'UNKNOWN' : dto.name,
          richTextColor: blackWrite,
          hilightText: "딜 종료",
          hilightTextColor: cocacolaRed
      );

    } catch(e){
      return _NotificationSvgTextLine(
          startIconAsset: iconSvgSiren,
          endIconAsset: iconSvgSiren,
          hilightColor: Colors.red.shade50,
          richText: '',
          richTextColor: white,
          hilightText: '알림 기간이 지난 종료된 딜입니다.',
          hilightTextColor: blackWrite
      );
    }
  }
}


class _DealOpen extends StatelessWidget {
  final FcmMessageDealVO messageVO;
  const _DealOpen({
    required this.messageVO,
  });

  @override
  Widget build(BuildContext context) {
    try{
      return  Column(
        children: [
          _NotificationSvgTextLine(
              startIconAsset: iconBanana,
              endIconAsset: iconBanana2,
              hilightColor: Colors.yellow.shade200,
              richText: '',
              richTextColor: Colors.white,
              hilightText: "개통을 축하드립니다!",
              hilightTextColor: brown
          ),
          _OpenRow(
            textBefore: '가게명:',
            textAfter: messageVO.name,
          ),
          _OpenRow(
            textBefore: '기기명:',
            textAfter: messageVO.dePsName,
          ),

          _OpenRow(
            textBefore: '월납부액 / 할부원금:',
            textAfter: '${NumberFormat('###,###').format(messageVO.deMonthTotalPrice)}원 / '
                '${NumberFormat('###,###').format(messageVO.deInstallmentPrincipal)}원',
          ),
        ],
      );
    } catch(e) {
      return  _NotificationSvgTextLine(
          startIconAsset: iconBanana,
          endIconAsset: iconBanana2,
          hilightColor: Colors.yellow.shade50,
          richText: '',
          richTextColor: Colors.white,
          hilightText: '알림 기간이 지난 개통된 딜입니다.',
          hilightTextColor: brown
      );
    }
  }
}

class _OpenRow extends StatelessWidget {
  final String textBefore;
  final String textAfter;
  const _OpenRow({
    required this.textBefore,
    required this.textAfter,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: EdgeInsets.all(size.sizedBox8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _OpenText(textBefore),
          const BdCustomPad(padEnum: PadEnum.width8,),
          Expanded(child: _OpenText(textAfter)),
        ],
      ),
    );
  }
}


class _OpenText extends StatelessWidget {
  final String text;
  const _OpenText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: context.read<VerseConfig>().size.sizedBox12,
          fontWeight: FontWeight.w400
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}




class _DealBox extends StatelessWidget {
  final NotiEntity dto;
  const _DealBox({
    required this.dto,
  });

  @override
  Widget build(BuildContext context) {
    return FcmBodyTapListNormalBoxComponentsView(
      isRead: dto.isRead,
      imageUrl:  dto.title.contains('참여')
          ? dealParticipate
          :dto.title.contains('수정')
          ? dealChange
          : dealEnd,
      title:  dto.name == '' ? '원숭이네 폰가게': dto.name,
      content: dto.title == '' ? '내용이 없네요.' : dto.title,
    );

  }
}



class _NotificationSvgTextLine extends StatelessWidget {
  final String startIconAsset;
  final String endIconAsset;
  final String richText;
  final String hilightText;
  final Color hilightColor;
  final Color richTextColor;
  final Color hilightTextColor;
  const _NotificationSvgTextLine({
    required this.startIconAsset,
    required this.endIconAsset,
    required this.richText,
    required this.hilightColor,
    required this.richTextColor,
    required this.hilightText,
    required this.hilightTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BdSvgBinder3(asset: startIconAsset, size: size,),
        const _PadWidth(),
        Container(
          constraints: BoxConstraints(
              maxWidth: size.sizedBox0_6,
              minWidth: 0,
              minHeight: 0,
              maxHeight: size.sizedBox0_1
          ),
          child: _HighLightText(
            size: size,
            highlightColor: hilightColor,
            widget:  richText == '' ?
            Text(
              hilightText,
              style: TextStyle(
                color: hilightTextColor,
                fontSize: size.sizedBox14, fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ) :
            RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: [
                    TextSpan(
                        text: richText ,
                        style: TextStyle(
                          color:richTextColor,
                          fontSize: size.sizedBox14, fontWeight: FontWeight.w600,
                        )
                    ),
                    TextSpan(
                        text: ' ' ,
                        style: TextStyle(
                          color:richTextColor,
                          fontSize: size.sizedBox14, fontWeight: FontWeight.w600,
                        )
                    ),
                    TextSpan(
                        text: hilightText,
                        style: TextStyle(
                          color: hilightTextColor,
                          fontSize: size.sizedBox14, fontWeight: FontWeight.w400,
                        )
                    )
                  ]
              ),
            ),
          ),
        ),
        const _PadWidth(),
        BdSvgBinder3(asset: endIconAsset, size: size,),
      ],
    );
  }
}

class _PadWidth extends StatelessWidget {
  const _PadWidth();

  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: context.read<VerseConfig>().size.sizedBox8,);
  }
}



class _HighLightText extends StatelessWidget {
  final CommonSize size;
  final Color highlightColor;
  final EdgeInsetsGeometry? highlightMargin;
  final EdgeInsetsGeometry? margin;
  final Widget widget;
  const _HighLightText({
    required this.size,
    required this.highlightColor,
    this.highlightMargin,
    this.margin,
    required this.widget
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            bottom: 0,
            child: Container(
              margin: margin,
              decoration: BoxDecoration(
                  color: highlightColor,
                  borderRadius: BorderRadius.circular(size.sizedBox5)
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.sizedBox2,
              horizontal: size.sizedBox5
          ),
          child: widget,
        ),

      ],
    );
  }
}