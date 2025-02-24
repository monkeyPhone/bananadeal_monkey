import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ComponentRateListListTileView extends StatelessWidget {
  final CommonSize size;
  final bool first;
  final String? modelName;
  final String? tel;
  final String? sms;
  final String? lte;
  final String? price;
  final GestureTapCallback onTap;
  final GestureTapCallback onTapDetail;
  const ComponentRateListListTileView({super.key,
    required this.size,
    required this.first,
    required this.modelName,
    required this.tel,
    required this.sms,
    required this.lte,
    required this.price,
    required this.onTap,
    required this.onTapDetail
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonBasic(
        onTap: onTap,
        margin: EdgeInsets.symmetric(horizontal:  size.sizedPaddingHalf),
        padding: EdgeInsets.only(
            left: size.sized16grid,
            right:  size.sizedPaddingHalf
        ),
        border: first ?
        Border(
            top: BorderSide(
                width: size.sizedBox1,
                color: greyD7D7D7),
            bottom: BorderSide(
                width: size.sizedBox1,
                color: greyD7D7D7)
        )
            :
        Border(
            bottom: BorderSide(
                width: size.sizedBox1,
                color: greyD7D7D7)
        ),
        width: size.widthCommon,
        height: size.sizedBox80,
        child:  Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child:  RichText(
                  overflow:
                  TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: modelName ?? '없음',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w700,
                      color: blackWrite,
                      fontSize:
                      size.sub,
                    ),
                  ),
                )
            ),
            const BdCustomPad(padEnum: PadEnum.width16,),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child:  Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.sizedPaddingHalfDouble
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _RateListIconText(
                      size: size,
                      icon: Icons.phone_outlined,
                      text: tel ?? '없음',
                    ),
                    SizedBox(
                      height: size.sizedBox3,),
                    _RateListIconText(
                      size: size,
                      icon: Icons.mail_outline,
                      text: sms ?? '없음',
                    ),
                    SizedBox(
                      height: size.sizedBox3,),
                    _RateListIconText(
                      size: size,
                      icon: Icons.signal_cellular_alt,
                      text: lte ?? '없음',
                    ),
                  ],
                ),
              ),
            ),
            const BdCustomPad(padEnum: PadEnum.specialAddress),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child:  FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.scaleDown,
                child: Text(
                  context.read<VerseConfig>().function.formatMoneyString(price),
                  style: TextStyle(
                      fontSize:
                      size.sub,
                      fontWeight:
                      FontWeight.w400),
                ),
              ),
            ),
            const BdCustomPad(padEnum: PadEnum.specialAddress),
            Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child:  BdRippleButtonBasic(
                    onTap: onTapDetail,
                    color: yellow,
                    borderRadius:  BorderRadius.circular(999),
                    padding:  EdgeInsets.symmetric(
                        horizontal: size.sizedPaddingW,
                        vertical: size.sizedPaddingHalf
                    ),
                    child:  FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '상세',
                        style: TextStyle(
                            fontWeight:
                            FontWeight.w400,
                            fontSize:
                            size.foot,
                            color: brown),
                      ),
                    )
                )
            )
          ],
        )
    );
  }
}


class _RateListIconText extends StatelessWidget {
  final CommonSize size;
  final IconData icon;
  final String text;
  const _RateListIconText({
    required this.size,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Icon(
                        icon, size: size.sub))
            ),
            SizedBox(width: size.sizedBox5,),
            Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    text == '' ? ' ' : text,
                    style: TextStyle(fontSize:  size.caption, fontWeight: FontWeight.w400),
                  ),
                )
            )
          ],
        )
    );
  }
}

