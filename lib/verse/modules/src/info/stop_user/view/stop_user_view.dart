import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/state/cubit/banana_fcm/banana_fcm_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_list_tile_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StopUserView extends StatelessWidget {
  const StopUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
        isCanPop: false,
        listener: _FcmListener(),
        canvasEnum: CanvasEnum.basic,
        appbar: ('이용정지 안내', null, null, null),
        body: _Body()
    );
  }
}

class _FcmListener extends StatelessWidget {
  const _FcmListener();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaFcmCubit, BananaFcmState>(
            listener: (context, state){
              if(state.isStop){
                context.read<VerseConfig>().route.appRouting(context);
              }
            },
          )
        ],
        child: const SizedBox()
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:  size.sizedBox16
      ),
      child: SizedBox(
        width: size.widthCommon,
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _PauseContent(),
            _ButtonArea()
          ],
        ),
      ),
    );
  }
}

class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<VerseConfig>().size.sizedBox10,
    );
  }
}

class _Pad2 extends StatelessWidget {
  const _Pad2();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<VerseConfig>().size.sizedBox20,
    );
  }
}

class _Pad3 extends StatelessWidget {
  const _Pad3();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<VerseConfig>().size.height60px,
    );
  }
}



class _PauseContent extends StatelessWidget {
  const _PauseContent();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  BlocBuilder<BananaRouteCubit, BananaRouteState>(
        builder: (context, state) =>
            Column(
              children: [
                const _Pad3(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: switch(state.userVO.mPathImg){
                    '' =>
                        BdAssetImageBinder(
                          imageHeight: size.sizedBox121,
                          imageWidth: size.sizedBox121,
                          imageUrl: defaultThumb,
                          boxFit: BoxFit.cover,
                        ),
                    _ =>
                    !kIsWeb
                        ?
                    BdImageBinder(
                        imageWidth: size.sizedBox121,
                        imageHeight:  size.sizedBox121,
                        imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}${state.userVO.mPathImg}',
                        errUrl: defaultThumb,
                        imageLabel: caseThumb
                    )
                        : Image.network(
                      '${context.read<VerseConfig>().url.imageBananaUrl}${state.userVO.mPathImg}',
                      fit: BoxFit.cover,
                      height: size.sizedBox121,
                      width: size.sizedBox121,)

                  },
                ),
                const _Pad3(),
                _TextListTile(
                  title: '닉네임',
                  content: state.userVO.mName, size: size,
                ),
                const _Pad(),
                _TextListTile(
                  title: '상태',
                  content: state.userVO.mIsUsed, size: size,
                ),
                const _Pad(),
                _TextListTile(
                  title: '사유',
                  content: state.userVO.mPauseReason, size: size,
                ),
                const _Pad(),
                Builder(
                    builder: (BuildContext context){
                      try{
                        return  _TextListTile(
                          title: '기간',
                          content: '${DateFormat("yyyy년 MM월 dd일").format(DateFormat('yyyy-M-d').parse(state.userVO.mPauseDuration))} 까지',
                          size: size,
                        );
                      } catch(_){
                        return _TextListTile(
                          title: '기간',
                          content: '',
                          size: size,
                        );
                      }
                    }
                ),
                const _Pad(),
              ],
            )
    );
  }
}

class _ButtonArea extends StatelessWidget {
  const _ButtonArea();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        const _Pad2(),
        BdRippleListTileButton(
            onTap: () {
              context.read<BananaFcmCubit>().checkPause(context);
            },
            size: size,
            icon: Icons.refresh,
            text: '새로고침'
        ),
        const _Pad2(),
        BdRippleListTileButton(
            onTap: () {
              context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: 'EC 500');
            },
            size: size,
            icon: Icons.send,
            text: '문의하기'
        )
      ],
    );
  }
}


class _TextListTile extends StatelessWidget {
  final CommonSize size;
  final String title;
  final String content;
  const _TextListTile({
    required this.size,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.widthCommon,
      height: size.sizedBox50,
      child: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: size.sizedBox10,
            vertical:size.sizedBox5
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child:  SizedBox()
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child:  BdTextWidget(text: title, textStyle: bodyBold, textAlign: TextAlign.center,)

            ),
            const Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child:  SizedBox()
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 7,
                child: BdTextWidget(text: content,maxLines: 2, textAlign: TextAlign.center,)
            ),
          ],
        ),
      ),
    );
  }
}

