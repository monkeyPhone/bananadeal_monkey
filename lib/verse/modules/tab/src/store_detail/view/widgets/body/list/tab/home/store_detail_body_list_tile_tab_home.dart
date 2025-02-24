import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/svg/bd_svg_binder2.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_appbar.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_width.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailBodyListTileTabHome extends StatelessWidget {
  const StoreDetailBodyListTileTabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdLayoutWidth(
      child: BdLayoutPadding(
          padding: PaddingEnum.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Introduce(),
              BdCustomPad(padEnum: PadEnum.height32),
              _Event(),
              BdCustomPad(padEnum: PadEnum.height32),
            ],
          )
        // _Phase2()
      ),
    );
  }
}


class _Introduce extends StatelessWidget {
  const _Introduce();

  @override
  Widget build(BuildContext context) {
    return _Sub(
        text: '매장 소개',
        child: Text(context.read<BananaStoreDetailBloc>().state.detailVO.smStoreIntroduce == ''
            ? '등록된 매장 소개글이 없습니다.'
            : context.read<BananaStoreDetailBloc>().state.detailVO.smStoreIntroduce,
          style: TextStyle(
              fontSize: context.read<VerseConfig>().size.body
          ),
          textAlign: TextAlign.start,
        )

      // TextWidget(
      //   text: context.read<BananaStoreDetailInfoBloc>().state.entity.smStoreIntroduce == ''
      //       ? '등록된 매장 소개글이 없습니다.'
      //       : context.read<BananaStoreDetailInfoBloc>().state.entity.smStoreIntroduce,
      //   textAlign: TextAlign.start,
      //   textStyle: body,
      //   maxLines: ,
      // ),
    );
  }
}


class _Sub extends StatelessWidget {
  final String text;
  final Widget child;
  const _Sub({
    required this.text,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      constraints: BoxConstraints(
        minHeight: size.ratio58,
        maxHeight: double.infinity,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BdLayoutAppbar(
            size: size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BdTextWidget(
                  text: text,
                  textAlign: TextAlign.start,
                  textStyle: titleLittleBold,
                ),
              ],
            ),
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          child
        ],
      ),
    );
  }
}


class _Event extends StatelessWidget {
  const _Event();

  @override
  Widget build(BuildContext context) {
    return _Sub(
        text: '매장 이벤트',
        child: Column(
          children: [
            if( context.read<BananaStoreDetailBloc>().state.eventList.isEmpty)
              const BdTextWidget(
                text:  '진행중인 이벤트가 없습니다.',
                textAlign: TextAlign.start,
              )
            else
              ...context.read<BananaStoreDetailBloc>().state.eventList.map(
                      (event) =>
                      _EventBox(
                        icon: event.$1,
                        text: event.$2,
                      )
              ).toList(),
          ],
        )
    );
  }
}

class _EventBox extends StatelessWidget {
  final String? icon;
  final String text;
  const _EventBox({
    this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      margin: EdgeInsets.only(bottom: size.sized32grid),
      padding: EdgeInsets.symmetric(
          horizontal: size.sizedBox4,
          vertical: size.sized8grid
      ),
      decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(1,1),
            )
          ]
      ),
      constraints: BoxConstraints(
          minHeight: size.sizedAppbar,
          maxHeight: double.infinity
      ),
      child: Row(
        children: [
          icon != null
              ?
          BdSvgBinder2(
            padding: EdgeInsets.all(size.sizedBox8),
            imageUrl: 'assets/images/icons/store/$icon.svg',
            width: size.sizedAppbar,
            height: size.sizedAppbar,
          ) : const BdCustomPad(padEnum: PadEnum.width4,),
          const BdCustomPad(padEnum: PadEnum.width1,),
          Expanded(
            child: BdLayoutPadding(
                padding: PaddingEnum.all4,
                child: Text(
                  text,
                  style: TextStyle(
                    color: bananaBack,
                    fontSize: size.body,
                  ),
                  maxLines: 5,
                )
            ),
          )
        ],
      ),
    );
  }
}