import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/manager/rank_all_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_medal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class RankAllBodyGridTileView extends StatelessWidget {
  final RankVO element;
  final int index;
  final bool isAll;
  final CommonSize size;
  const RankAllBodyGridTileView ({super.key,
    required this.element,
    required this.index,
    required this.isAll,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _ElementTile(
            element: element,
            isAll: isAll,
            size: size
        ),
        BdUiMedal(
            size: size,
            index: index)
      ],
    );
  }
}

class _ElementTile extends StatelessWidget {
  final RankVO element;
  final bool isAll;
  final CommonSize size;
  const _ElementTile({
    required this.element,
    required this.isAll,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return BdNeoButtonCustom(
      size: size,
      margin: EdgeInsets.only(
          top: size.sizedBox1_5,
          bottom:  size.sizedBox1_5
      ),
      boxColor: white,
      onPressed: () {
        context.read<RankAllManager>().listElementClick(rank: element,);
        // ContextConfig.rootContext!.read<SrcManager>().rankClickEvent(context: ContextConfig.rootContext!, rank: element, isDeal: isDeal);
      },
      child: BdLayoutPadding(
        padding: PaddingEnum.all8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double imageMaxWidth = constraints.maxWidth;
                    double imageMaxHeight = constraints.maxHeight;
                    return BdImageBinder(
                      imageWidth: imageMaxWidth,
                      imageHeight: imageMaxHeight,
                      imageUrl: '${context.read<VerseConfig>().url.monkeyImageUrl}${element.piPath}',
                      errUrl: defaultPhone,
                      imageLabel: 'carousel',
                      // margin: EdgeInsets.all(WidgetSize(context).sized8grid),
                    );
                  },
                )
            ),
            const BdCustomPad(padEnum: PadEnum.height8),
            BdTextWidget(
              text: element.psName,
              textStyle: body,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const BdCustomPad(padEnum: PadEnum.height8, ),
            BdTextWidget(
              text: isAll ? '(${
                  context.read<RankAllManager>().convertGrade(element.psMobileGrade)
              })' : element.psModel,
              textStyle: bodyGrey,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
