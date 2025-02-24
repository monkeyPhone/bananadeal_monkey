import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdLayoutRatioBox extends StatelessWidget {
  final Widget child;
  const BdLayoutRatioBox({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      width: size.widthCommon,
      height: size.ratio58,
      child: child,
    );
  }
}
