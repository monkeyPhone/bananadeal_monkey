import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/manager/estimate_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate_option/banana_estimate_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EstimateBodyListTileView extends StatelessWidget {
  final EstimateVO estimate;
  const EstimateBodyListTileView({super.key,
    required this.estimate,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      padding: EdgeInsets.only(
        top: size.sized16grid,
        bottom: size.sized24grid
      ),
      width: size.widthCommon,
      height: size.ratio58/2+size.sized32grid+size.sized24grid,
      decoration: BoxDecoration(
          color: estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
              ? white
              : Colors.grey.shade300,
          border: Border(
              bottom: BorderSide(
                  width: size.sizedBox2,
                  color: greyD7D7D7
              )
          )
      ),
      child: Stack(
        children: [
          Padding(
            padding: size.paddingBodyWhole,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TileTop(
                  size: size,
                  estimate: estimate,
                ),
                _TileMiddle(
                  size: size,
                  estimate: estimate,
                ),
                _Suggestion(
                  size: size,
                  estimate: estimate,
                )
              ],
            ),
          ),
          _DetailButton(
            size: size,
            estimate: estimate,
          )
        ],
      ),
    );
  }
}



class _TileTop extends StatelessWidget {
  final EstimateVO estimate;
  final CommonSize size;
  const _TileTop({
    required this.estimate,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              estimate.smStoreName,
              style: TextStyle(
                  fontSize: size.titleLittle,
                  fontWeight: FontWeight.w700,
                  color: estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
                      ? blackWrite : ultimateGrey
              ),
              maxLines: 1,
            ),
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.width16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.sizedBox3),
            color: greyAAAAAA,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: size.sizedBox5,
            vertical: size.sizedBox3_5
          ),
          child: Text(
            estimate.distance < 1.0
                ?
            '${(estimate.distance*1000).roundToDouble().toInt()}m'
                :
            '${(estimate.distance).toStringAsFixed(2)}km',
            style: TextStyle(
                fontSize: size.sub,
                fontWeight: FontWeight.w400,
                color: white
            ),
          ),
        )
      ],
    );
  }
}

class _Suggestion extends StatelessWidget {
  final EstimateVO estimate;
  final CommonSize size;
  const _Suggestion({
    required this.estimate,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.sized8grid),
      height: ((size.ratio58/2)/4),
      width: size.sizedBox100*3,
      color: greyEAEAEA,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Text(
              estimate.deSuggestions,
              style: TextStyle(
                  fontSize: size.foot,
                  fontWeight: FontWeight.w400,
                  color: estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
                      ? blackWrite : grey999999
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}


class _DetailButton extends StatelessWidget {
  final EstimateVO estimate;
  final CommonSize size;
  const _DetailButton({
    required this.estimate,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: size.sized12grid,
      bottom: 0,
      child: BdRippleButtonBasic(
        onTap: (){
          // TODO: 해야 됨
          context.read<EstimateManager>().gotoEstimateDetailView(context: context, estimate: estimate);
        },
        color: yellow,
        borderRadius: BorderRadius.circular(999),
        width: size.sizedBox77,
        height: ((size.ratio58/2)/4)*1.2,
        child: Center(
            child: Text('상세보기',
              style: TextStyle(
                  color: brown,
                  fontWeight: FontWeight.w400, fontSize: size.special
              ),
            )
        ),
      ),
    );
  }
}

class _TileMiddle extends StatelessWidget {
  final EstimateVO estimate;
  final CommonSize size;
  const _TileMiddle({
    required this.estimate,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ((size.ratio58/2)/4)*2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TileMiddleRow1(
            size: size,
            estimate: estimate,
          ),
          _TileMiddleRow2(
            size: size,
            estimate: estimate,
          ),
        ],
      ),
    );
  }
}



class _TileMiddleRow1 extends StatelessWidget {
  final EstimateVO estimate;
  final CommonSize size;
  const _TileMiddleRow1({
    required this.estimate,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _TileMiddleRow1Text(
            size: size,
            title: '참여', content : '${estimate.sendDeal}/${estimate.inviteDeal}건'),
        const BdCustomPad(padEnum: PadEnum.width12),
        _TileMiddleRow1Text(
            size: size,
            title: '수락', content : '${estimate.openDeal}건'),
        const BdCustomPad(padEnum: PadEnum.width12),
        _TileMiddleRow1Icon(
            size: size,
            content: estimate.avgPoint == ''
                ? '0.0' : estimate.avgPoint)
      ],
    );
  }
}

class _TileMiddleRow1Text extends StatelessWidget {
  final CommonSize size;
  final String title;
  final String content;
  const _TileMiddleRow1Text({
    required this.size,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
          style: TextStyle(
              fontSize: size.sub,
              fontWeight: FontWeight.w700,
              color: grey999999
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.width4),
        const BdCustomPad(padEnum: PadEnum.width1),
        Text(content,
          style: TextStyle(
              fontSize: size.sub,
              fontWeight: FontWeight.w400,
              color: blackWrite
          ),
        )
      ],
    );
  }
}

class _TileMiddleRow1Icon extends StatelessWidget {
  final CommonSize size;
  final String content;
  const _TileMiddleRow1Icon({
    required this.size,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: size.sizedBox16, color: yellow,),
        const BdCustomPad(padEnum: PadEnum.width1),
        const BdCustomPad(padEnum: PadEnum.width1),
        Text(content,
          style: TextStyle(
              fontSize: size.sub,
              fontWeight: FontWeight.w400,
              color: blackWrite
          ),
        )
      ],
    );
  }
}


class _TileMiddleRow2 extends StatelessWidget {
  final EstimateVO estimate;
  final CommonSize size;
  const _TileMiddleRow2({
    required this.estimate,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // 바나나 픽스
        Text(estimate.deInstallmentMonth == 0 ? '현금' : '할부원금',
            style: TextStyle(
                fontSize: size.sub,
                fontWeight: FontWeight.w400,
                color: estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
                    ? blackWrite
                    : grey999999
            )
        ),
        const BdCustomPad(padEnum: PadEnum.width1),
        const BdCustomPad(padEnum: PadEnum.width1),
        BlocSelector<BananaEstimateOptionBloc, BananaEstimateOptionState, int>(
            selector: (state) => state.current,
            builder: (context, current) =>
                Text(estimate.deInstallmentMonth == 0
                    ? estimate.deCash <= 0
                    ? '0'
                    : '${NumberFormat('###,###').format(estimate.deCash)}원'
                    : '${NumberFormat('###,###').format(estimate.deInstallmentPrincipal)}원',
                    style: TextStyle(
                        fontSize: size.body,
                        fontWeight: FontWeight.w700,
                        color: estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
                            ? current == 0
                                ? red
                                : blackWrite
                            : grey999999
                    )
                )
        ),
        const BdCustomPad(padEnum: PadEnum.width1),
        const BdCustomPad(padEnum: PadEnum.width1),
        Text('/',
            style: TextStyle(
                fontSize: size.sub,
                fontWeight: FontWeight.w400,
                color: estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
                    ? blackWrite
                    : grey999999
            )
        ),
        const BdCustomPad(padEnum: PadEnum.width1),
        const BdCustomPad(padEnum: PadEnum.width1),
        Text('월',
            style: TextStyle(
                fontSize: size.sub,
                fontWeight: FontWeight.w400,
                color: estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
                    ? blackWrite
                    : grey999999
            )
        ),
        const BdCustomPad(padEnum: PadEnum.width1),
        const BdCustomPad(padEnum: PadEnum.width1),
        BlocSelector<BananaEstimateOptionBloc, BananaEstimateOptionState, int>(
            selector: (state) => state.current,
            builder: (context, current) =>
                Text('${NumberFormat('###,###').format(estimate.deMonthTotalPrice)}원',
                    style: TextStyle(
                        fontSize: size.body,
                        fontWeight: FontWeight.w700,
                        color: estimate.dStatus == 'PARTICIPATE' || estimate.dStatus == 'OPEN' || estimate.dStatus == 'ACCEPT'
                            ? current == 1
                                ? red
                                : blackWrite
                            : grey999999
                    )
                )
        ),
      ],
    );
  }
}