import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_medal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRankTileView extends StatelessWidget {
  final RankVO rank;
  final CommonSize size;
  final int index;
  const HomeRankTileView({
    super.key,
    required this.rank,
    required this.size,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _ListTile(rank: rank, size: size),
        BdUiMedal(index: index, size: size, )
      ],
    );
  }
}


class _ListTile extends StatelessWidget {
  final RankVO rank;
  final CommonSize size;
  const _ListTile({
    required this.rank,
    required this.size});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          double maxHeight = constraints.maxHeight;
          return BdNeoButtonCustom(
            size: size,
            margin: EdgeInsets.only(
                right: size.sized16grid, bottom: size.sizedBox1, top: size.sizedBox1
            ),
            boxColor: white,
            onPressed: (){
              context.read<BroadManager>().rankTileClickEvent(
                context: context,
                rank: rank,);
            },
            child: SizedBox(
              width: (maxHeight*5)/8,
              height: maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      flex: 6,
                      child: LayoutBuilder(
                        builder: (context, constraints){
                          double imageMaxWidth = constraints.maxWidth;
                          double imageMaxHeight = constraints.maxHeight;
                          return BdImageBinder(
                            imageWidth: imageMaxWidth,
                            imageHeight: imageMaxHeight,
                            imageUrl: '${context.read<VerseConfig>().url.monkeyImageUrl}${rank.piPath}',
                            errUrl: defaultPhone,
                            imageLabel: 'carousel',
                            // margin: EdgeInsets.all(WidgetSize(context).sized8grid),
                          );
                        },
                      )
                  ),
                  const BdCustomPad(padEnum: PadEnum.height8),
                  Flexible(
                      flex: 2,
                      child: BdTextWidget(
                        text: rank.psName,
                        textStyle: callout,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      )
                  ),
                ],
              ),
            ),
          );

        }
    );
  }
}

