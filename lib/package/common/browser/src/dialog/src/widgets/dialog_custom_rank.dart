import 'package:banana_deal_by_monkeycompany/package/common/bd_common.dart';
import 'package:banana_deal_by_monkeycompany/package/common/size/common_size.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/widgets/box/bd_appbar_box.dart';
import 'package:banana_deal_by_monkeycompany/package/widgets/button/ripple/basic/bd_button_ripple_basic.dart';
import 'package:banana_deal_by_monkeycompany/package/widgets/pad/bd_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DialogCustomRank extends StatelessWidget {
  final RankVO rank;
  final GestureTapCallback makeDealTap;
  final GestureTapCallback gotoDetailTap;

  const DialogCustomRank({super.key,
    required this.rank,
    required this.makeDealTap,
    required this.gotoDetailTap
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<BdCommon>().size;
    return Dialog(
        child: Padding(
          padding: size.edge.pad1616,
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Top(ldcpName: rank.psName,),
                const BdPad(padEnum: PadEnum.height8),
                _Content(rank: rank, size: size, makeDealTap: makeDealTap, gotoDetailTap: gotoDetailTap,)
              ],
            ),
          ),
        )
    );
  }
}

class _Top extends StatelessWidget {
  final String ldcpName;
  const _Top({required this.ldcpName,});

  @override
  Widget build(BuildContext context) {
    return  BdAppbarBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              ldcpName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
              ),
              maxLines: 2,
            ),
          ),
          const BdPad(padEnum: PadEnum.width16),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: context.read<BdCommon>().size.sizedBox30,
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final RankVO rank;
  final CommonSize size;
  final GestureTapCallback makeDealTap;
  final GestureTapCallback gotoDetailTap;
  const _Content({
    required this.rank,
    required this.size,
    required this.makeDealTap,
    required this.gotoDetailTap
  });

  @override
  Widget build(BuildContext context) {
    return _LayoutBoxDialogButton(
      child: Row(
        children: [
          _ContentButton(
            size: size,
            isMake: true,
            piPath: rank.piPath,
            onTap: makeDealTap,
          ),
          const BdPad( padEnum: PadEnum.width16),
          _ContentButton(
            size: size,
            isMake: false,
            piPath: rank.piPath,
            onTap: gotoDetailTap,
          ),
        ],
      ),
    );
  }
}

class _ContentButton extends StatelessWidget {
  final String piPath;
  final GestureTapCallback onTap;
  final bool isMake;
  final CommonSize size;
  const _ContentButton({
    required this.onTap,
    required this.piPath,
    required this.isMake,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.tight,
        child: BdButtonRippleBasic(
          borderRadius: BorderRadius.circular(size.sized16grid),
          onTap: onTap,
          child: Column(
            children: [
              Expanded(
                  child: BdLayoutPadding(
                    padding: PaddingEnum.all8,
                    child: LayoutBuilder(
                      builder: (context, constraints){
                        double imageMaxWidth = constraints.maxWidth;
                        double imageMaxHeight = constraints.maxHeight;
                        return BdImageBinder(
                          imageWidth: imageMaxWidth,
                          imageHeight: imageMaxHeight,
                          imageUrl: '${context.read<VerseConfig>().url.monkeyImageUrl}$piPath',
                          errUrl: defaultPhone,
                          imageLabel: 'carousel',
                          // margin: EdgeInsets.all(WidgetSize(context).sized8grid),
                        );
                      },
                    ),
                  )
              ),
              BdLayoutPadding(
                padding: PaddingEnum.all8,
                child: Text(
                  isMake ? '딜 만들기' : '상세보기',
                  style: TextStyle(
                      fontSize: size.titleButton,
                      fontWeight: FontWeight.w500,
                      color: bananaBack
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}


class _LayoutBoxDialogButton extends StatelessWidget {
  final Widget child;
  const _LayoutBoxDialogButton({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          double maxWidth = constraints.maxWidth;
          return SizedBox(
            width: maxWidth,
            height: (9/16)*maxWidth,
            child: child,
          );
        }
    );
  }
}

