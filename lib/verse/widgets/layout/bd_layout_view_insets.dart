import 'package:flutter/material.dart';

class BdLayoutViewInsets extends StatelessWidget {
  final Widget child;
  const BdLayoutViewInsets({super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0
        ? const SizedBox()
        : child;
  }
}

