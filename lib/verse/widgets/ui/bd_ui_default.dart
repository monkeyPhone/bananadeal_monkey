import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdUiDefault extends StatelessWidget {
  final String text;
  final String? text2;
  final GestureTapCallback? onTap;
  const BdUiDefault({super.key,
    required this.text,
    this.text2,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size.widthCommon - size.sized32grid,
              child: BdAssetImageBinder(
                boxFit: BoxFit.contain,
                imageHeight: size.ratio58,
                imageWidth: size.ratio58,
                imageUrl: defaultList,
              ),
            ),
            Positioned.fill(
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BdCustomPad(padEnum: PadEnum.height8),
                  _CounterText(text: text, size: size),
                  const BdCustomPad(padEnum: PadEnum.height8),
                  text2 != null
                      ? _CounterText(text: text2!, size: size)
                      : const SizedBox(),
                  onTap == null
                      ? const SizedBox()
                      :
                  Column(
                    children: [
                      const BdCustomPad(padEnum: PadEnum.height24),
                      BdRefreshButton(onTap: onTap!, text: '새로고침',)
                    ],
                  ) ,

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class _CounterText extends StatelessWidget {
  final String text;
  final CommonSize size;
  const _CounterText({
    required this.text,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: size.titleButton,
          fontWeight: FontWeight.w700,
          color: Colors.black54
      ),
    );
  }
}