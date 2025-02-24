import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/json_bool.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_review_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/store_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/components/review_tile/component_review_tile.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_ratio58_pad32.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class StoreDetailBodyListTileTabReview extends StatelessWidget {
  const StoreDetailBodyListTileTabReview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaStoreDetailBloc, BananaStoreDetailState, List<StoreReviewVO>>(
        selector: (state) => state.detailVO.reviewList,
        builder: (context, reviewList) =>
            reviewList.isEmpty
            ? const BdLayoutRati58Pad32(
            isHalf: true,
            child: Center(
              child: BdTextWidget(
                  text: '등록된 후기가 없습니다'

              ),
            )
        )
            : _List(reviewList)
    );

  }
}


class _List extends StatelessWidget {
  final  List<StoreReviewVO> reviewList;
  const _List(this.reviewList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _GoButton(),
        Column(
          children: reviewList.map(
                  (review) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.read<VerseConfig>().size.sized16grid
                ),
                child: ComponentReviewTile(
                  review: review,
                  storeName: context.read<BananaStoreDetailBloc>().state.detailVO.smStoreName,
                  isCan: review.ruActivate == JsonBool.Y && review.ruBlock == JsonBool.Y && review.ruDeclaration == JsonBool.Y,
                  onTap: (){
                    context.read<StoreDetailManager>().route.clickMoreVert(context: context, review: review);
                  },
                ),
              )
          ).toList(),
        ),

        //
        // ...context.read<BananaStoreDetailInfoBloc>().state.entity.reviewList.map(
        //     (review) => Padding(
        //       padding: EdgeInsets.symmetric(
        //         horizontal: context.read<SizeConfig>().widgetSize.sized16grid
        //       ),
        //       child: BdReviewTile(
        //         review: review,
        //         storeName: context.read<BananaStoreDetailInfoBloc>().state.entity.smStoreName,
        //         widgetSize: context.read<SizeConfig>().widgetSize,
        //         isCan: review.ruActivate == JsonBool.Y && review.ruBlock == JsonBool.Y && review.ruDeclaration == JsonBool.Y,
        //         onTap: (){
        //           context.read<StoreDetailManager>().clickMoreVert(context: context, review: review);
        //         },
        //       ),
        //     )
        // ).toList(),
        const _UpButton()
      ],
    );
  }
}

class _GoButton extends StatelessWidget {
  const _GoButton();

  @override
  Widget build(BuildContext context) {
    return context.read<BananaStoreDetailBloc>().state.detailVO.reviewCnt > 5
        ?  Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(right: context.read<VerseConfig>().size.sized16grid),
      width: context.read<VerseConfig>().size.widthCommon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BdRippleButtonBasic(
              onTap: (){
                context.read<StoreDetailManager>().route.gotoReviewPage(context);
              },
              padding: EdgeInsets.all(context.read<VerseConfig>().size.sized8grid),
              child: BdTextWidget(
                text: '리뷰 ${context.read<BananaStoreDetailBloc>().state.detailVO.reviewCnt}개 보기',
                textStyle: bodyGrey,
              )
          ),
          const BdCustomPad(padEnum: PadEnum.height12)
        ],
      ),
    )
        : const SizedBox();
  }
}

class _UpButton extends StatelessWidget {
  const _UpButton();

  @override
  Widget build(BuildContext context) {
    final CommonSize size =  context.read<VerseConfig>().size;
    return context.read<BananaStoreDetailBloc>().state.detailVO.reviewCnt > 5
        ?  Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(right: size.sized16grid),
      width: size.widthCommon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BdRippleButtonBasic(
              width: size.sized32grid,
              height: size.sized32grid,
              onTap: (){
                context.read<StoreDetailManager>().jumpToMiddle(context: context, size: size);
              },
              padding: EdgeInsets.all(size.sizedBox1_5),
              child: const FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                    Icons.keyboard_arrow_up
                ),
              )
          ),
          const BdCustomPad(padEnum: PadEnum.height12)
        ],
      ),
    )
        : const SizedBox();
  }
}
