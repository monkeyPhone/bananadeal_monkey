import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComponentsInfoSettingPage extends StatelessWidget {
  final Widget child;
  const ComponentsInfoSettingPage({super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<VerseConfig>().size.ratio58_4,
      child: child,
    );
  }
}
