import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdLayoutWidth extends StatelessWidget {
  final Widget child;
  const BdLayoutWidth({super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.read<VerseConfig>().size.widthCommon,
      child: child,
    );
  }
}
