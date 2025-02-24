import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';

class ReviewPadTop extends StatelessWidget {
  const ReviewPadTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: WidgetSize(context).sizedBox10,);
  }
}

class ReviewPadWidth1 extends StatelessWidget {
  const ReviewPadWidth1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: WidgetSize(context).sizedBox5,);
  }
}

class ReviewPadWidth2 extends StatelessWidget {
  const ReviewPadWidth2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: WidgetSize(context).sizedBox2_5,);
  }
}

class ReviewPadWidth3 extends StatelessWidget {
  const ReviewPadWidth3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: WidgetSize(context).sizedBox8,);
  }
}