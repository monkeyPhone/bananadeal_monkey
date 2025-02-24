import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/json_bool.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_review_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/components/review_tile/component_review_block.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/components/review_tile/component_review_layout.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/components/review_tile/component_review_tile_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_button_icon_small.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_star_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ComponentReviewTile extends StatelessWidget {
  final String storeName;
  final StoreReviewVO review;
  final bool isCan;
  final bool? isOption;
  final GestureTapCallback onTap;
  const ComponentReviewTile({super.key,
    required this.storeName,
    required this.review,
    required this.isCan,
    this.isOption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return isCan ?
    RepositoryProvider<ComponentReviewTileManager>(
      create: (context) => ComponentReviewTileManager(
        storeName: storeName,
        review: review,
        isOption: isOption,
        onTap: onTap,
      ),
      child: const _Tile(),
    ) : ComponentReviewBlock(
      size: context.read<VerseConfig>().size,
      storeName: storeName,
      review: review,);
  }
}



class _Tile extends StatelessWidget {
  const _Tile();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ComponentReviewLayout(
          size: context.read<VerseConfig>().size,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ReviewStar(),
              _Review(),
              _ImageList(),
              _TimeLine(),
              _Comment()
            ],
          ),
        ),
        const _MoreVert()
      ],
    );
  }
}


class _ReviewStar extends StatelessWidget {
  const _ReviewStar();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.transparent,
              constraints: BoxConstraints(
                  maxWidth: size.sign2w2
              ),
              child: Text(context.read<ComponentReviewTileManager>().review.mName,
                style: TextStyle(
                    fontSize: size.body,
                    fontWeight: FontWeight.w600
                ),

              ),
            ),
            const BdCustomPad(padEnum: PadEnum.width12),
            ...List.generate(context.read<ComponentReviewTileManager>().review.ruPoint,
                    (index) => BdLayoutPadding(
                  padding: PaddingEnum.right1,
                  child: BdUiStarIcon(
                    size: size.sub,
                  ),
                )
            ).toList(),
          ],
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
      ],
    );
  }
}

class _Review extends StatelessWidget {
  const _Review();

  @override
  Widget build(BuildContext context) {
    return context.read<ComponentReviewTileManager>().review.ruContent == ''
        ? const SizedBox()
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.read<ComponentReviewTileManager>().review.ruContent,
          style: TextStyle(
            fontSize: context.read<VerseConfig>().size.callout,
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
      ],
    );
  }
}



class _ImageList extends StatelessWidget {
  const _ImageList();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return context.read<ComponentReviewTileManager>().getImageList().isEmpty
        ?  const SizedBox()
        : Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(context.read<ComponentReviewTileManager>().getImageList().length,
                    (index) =>
                    Row(
                      children: [
                        BdRippleButtonStack(
                            onTap: (){
                              context.read<VerseConfig>().browser.image.openDialog(
                                  routerContext: context,
                                  currentIndex: index,
                                  imageList: context.read<ComponentReviewTileManager>().getImageList(),
                                  isDownload: false,
                                  baseUrl: context.read<VerseConfig>().url.imageBananaUrl);
                            },
                            isDelay: false,
                            child: BdImageBinder(
                                imageWidth: size.sizedBox120,
                                imageHeight: (5/8)*size.sizedBox120,
                                imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}${context.read<ComponentReviewTileManager>().getImageList()[index]}',
                                errUrl: defaultThumb,
                                imageLabel: 'thumb'
                            )
                        ),
                        const BdCustomPad(padEnum: PadEnum.width16)
                      ],
                    )
            ).toList(),
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.height16)
      ],
    );
  }
}


class _TimeLine extends StatelessWidget {
  const _TimeLine();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(context.read<ComponentReviewTileManager>().getTimeLine(),
          style: TextStyle(
              fontSize: context.read<VerseConfig>().size.sub,
              color: greyWrite
          ),
        ),
      ],
    );
  }
}



class _Comment extends StatefulWidget {
  const _Comment();

  @override
  State<_Comment> createState() => _CommentState();
}

class _CommentState extends State<_Comment> {

  bool _viewCan = false;

  void _changeView(){
    setState(() {
      _viewCan =! _viewCan;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return
      context.read<ComponentReviewTileManager>().review.raAnswer == null || context.read<ComponentReviewTileManager>().review.raAnswer == ''
          ? const SizedBox()
          :
      GestureDetector(
        onTap: context.read<ComponentReviewTileManager>().review.ruDeclarationAnswer == JsonBool.Y ? null : _changeView,
        child: SizedBox(
          width: size.widthCommon,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: size.widthCommon,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(size.sized12grid)
                ),
                margin: EdgeInsets.only(
                  top: size.sized16grid,
                ),
                padding: EdgeInsets.all(size.sized12grid),
                child: context.read<ComponentReviewTileManager>().review.ruDeclarationAnswer == JsonBool.Y || _viewCan
                    ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('사장님 답글',
                      style: TextStyle(
                          fontSize: size.sub,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const BdCustomPad(padEnum: PadEnum.height12),
                    Text(context.read<ComponentReviewTileManager>().review.raAnswer!,
                      style: TextStyle(
                        fontSize: size.sub,
                      ),
                    ),
                  ],
                ) : Text( '신고가 접수된 답글입니다.',
                  style: TextStyle(
                      fontSize: size.sub,
                      color: greyWrite
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class _MoreVert extends StatelessWidget {
  const _MoreVert();

  @override
  Widget build(BuildContext context) {
    return
      context.read<ComponentReviewTileManager>().isOption != null
          ? const SizedBox()
          : BdRippleButtonIconSmall(
        size: context.read<VerseConfig>().size,
        onTap: context.read<ComponentReviewTileManager>().onTap,
        icon: Icons.more_vert,
      );
  }
}