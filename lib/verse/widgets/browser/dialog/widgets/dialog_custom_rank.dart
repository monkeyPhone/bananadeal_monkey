import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_appbar.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DialogCustomRank extends StatelessWidget {
  final CommonSize size;
  final RankVO rank;
  final GestureTapCallback makeDealTap;
  final GestureTapCallback gotoDetailTap;

  const DialogCustomRank({super.key,
    required this.size,
    required this.rank,
    required this.makeDealTap,
    required this.gotoDetailTap
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(size.sized16grid))
        ),
        child: BdLayoutPadding(
          padding: PaddingEnum.dialog,
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _Top(ldcpName: rank.psName, size: size,),
                const BdCustomPad(padEnum: PadEnum.height8),
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
  final CommonSize size;
  const _Top({required this.ldcpName, required this.size});

  @override
  Widget build(BuildContext context) {
    return  BdLayoutAppbar(
        size: size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BdTextWidget(
                text: ldcpName,
                textStyle: titleButtonBold,
                maxLines: 2,
              ),
            ),
            const BdCustomPad(padEnum: PadEnum.width16),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: size.sizedBox30,
              ),
            ),
          ],
        )
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
          const BdCustomPad( padEnum: PadEnum.width16),
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
        child: BdRippleButtonBasic(
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

