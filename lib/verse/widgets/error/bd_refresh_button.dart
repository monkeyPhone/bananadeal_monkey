import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BdRefreshButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String? text;
  const BdRefreshButton({super.key,
    required this.onTap,
    this.text
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Center(
      child: BdRippleButtonBasic(
          onTap: onTap,
          padding: EdgeInsets.symmetric(horizontal: size.sized16grid, vertical: size.sized8grid),
          border: Border.all(
              width: size.sizedBox1_5,
              color: bananaBack
          ),
          child: BdTextWidget(text: text ?? '재연결',)
      ),
    );
  }
}
