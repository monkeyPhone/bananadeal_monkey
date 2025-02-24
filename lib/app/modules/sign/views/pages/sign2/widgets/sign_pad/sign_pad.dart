import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';

class SignPad28 extends StatelessWidget {
  const SignPad28({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox28,
    );
  }
}

class SignPad18 extends StatelessWidget {
  const SignPad18({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox18,
    );
  }
}

class SignPad12 extends StatelessWidget {
  const SignPad12({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox12,
    );
  }
}

class SignPad8 extends StatelessWidget {
  const SignPad8({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox8,
    );
  }
}


class SignWidthPad extends StatelessWidget {
  const SignWidthPad({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: WidgetSize(context).sizedBox11,);
  }
}

