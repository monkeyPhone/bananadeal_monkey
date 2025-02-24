import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/manager/rank_all_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankAllBodyListTileView extends StatelessWidget {
  final RankVO rank;
  final bool isAll;
  final CommonSize size;
  const RankAllBodyListTileView({super.key,
    required this.rank,
    required this.isAll,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonBasic(
        onTap: (){
          context.read<RankAllManager>().listElementClick(rank: rank,);
        },
        padding: EdgeInsets.symmetric(
          horizontal: size.sized8grid,
        ),
        border: Border(
            bottom: BorderSide(
                width: size.sizedBox1,
                color: greyD7D7D7
            )
        ),
        width: size.widthCommon,
        height: size.sizedBox88,
        child:  Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            BdImageBinder(
              imageWidth: size.height60px,
              imageHeight: size.height60px,
              imageUrl: '${context.read<VerseConfig>().url.monkeyImageUrl}${rank.piPath}',
              errUrl: defaultPhone,
              imageLabel: caseHeight,
            ),
            SizedBox(
              width: size.sized32grid,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    overflow:
                    TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: rank.psName,
                      style: TextStyle(
                        fontWeight:
                        FontWeight.w700,
                        color: blackWrite,
                        fontSize:
                        size.sub,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.sized8grid,
                  ),
                  Text(
                    isAll ?
                    '(${
                        context.read<RankAllManager>().convertGrade(rank.psMobileGrade)
                    })' : rank.psModel,
                    style: TextStyle(
                        fontSize:
                        size.foot,
                        fontWeight:
                        FontWeight.w400),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            SizedBox(
              width: size.sized16grid,
            ),
          ],
        )
    );
  }
}
