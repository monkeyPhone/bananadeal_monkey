import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../../../../../css/size.dart';

class SvgPic extends StatelessWidget {
  final String asset;
  const SvgPic({
    required this.asset,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(asset, width: WidgetSize(context).sizedBox14, height: WidgetSize(context).sizedBox13,);
  }
}


