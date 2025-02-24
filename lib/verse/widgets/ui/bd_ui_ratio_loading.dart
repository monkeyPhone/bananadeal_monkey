import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdUiRatioLoading extends StatelessWidget {
  const BdUiRatioLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      width: size.widthCommon,
      height: size.ratio58,
      child: const BdLoadingSpin(),
    );
  }
}
