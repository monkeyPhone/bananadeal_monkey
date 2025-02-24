import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/json_bool.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_review_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/components/review_tile/component_review_layout.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/components/review_tile/component_review_tile.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_button_icon_small.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComponentReviewBlock extends StatefulWidget {
  final CommonSize size;
  final String storeName;
  final StoreReviewVO review;
  const ComponentReviewBlock({super.key,
    required this.size,
    required this.storeName,
    required this.review,
  });

  @override
  State<ComponentReviewBlock> createState() => _ComponentReviewBlockState();
}

class _ComponentReviewBlockState extends State<ComponentReviewBlock> {

  bool _isCan = false;

  void _changeCan(){
    if(widget.review.ruActivate == JsonBool.Y){
      setState(() {
        _isCan =! _isCan;
      });
    }

  }


  String _getTimeLine(){
    DateTime form = widget.review.ruRegdate.toLocal();
    String allTime = DateFormat("yyyy.MM.dd").format(form);
    return allTime;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeCan,
      child: _isCan
          ? ComponentReviewTile(
        storeName: widget.storeName,
        review: widget.review,
        isCan: true,
        isOption: true,
        onTap: (){},
      )
          : _Content(
        size: widget.size,
        storeName: widget.storeName,
        review: widget.review,
        timeLine: _getTimeLine(),
      ),
    );
  }
}


class _Content extends StatelessWidget {
  final CommonSize size;
  final String storeName;
  final StoreReviewVO review;
  final String timeLine;
  const _Content({
    required this.size,
    required this.storeName,
    required this.review,
    required this.timeLine
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ComponentReviewLayout(
            size: size,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( review.ruActivate == JsonBool.N
                    ? '바나나딜 운영정책을 위반한 후기입니다.'
                    : review.ruDeclaration == JsonBool.N
                    ? '신고 처리중인 후기입니다.'
                    :  review.ruBlock == JsonBool.N
                    ? '차단된 유저의 후기입니다.'
                    : 'No Signal',
                  style: TextStyle(
                      fontSize: size.callout,
                      color: Colors.grey
                  ),
                ),
                const BdCustomPad(padEnum: PadEnum.height16),
                Text(timeLine,
                  style: TextStyle(
                      fontSize: size.sub,
                      color: greyWrite
                  ),
                ),
              ],
            )
        ),
        review.ruDeclaration == JsonBool.N
            ? const SizedBox()
            : BdRippleButtonIconSmall(
          size: size,
          onTap: (){},
          icon: Icons.priority_high,
        )
      ],
    );
  }
}