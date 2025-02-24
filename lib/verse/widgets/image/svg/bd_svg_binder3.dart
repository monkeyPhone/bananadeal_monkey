import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BdSvgBinder3 extends StatelessWidget {
  final CommonSize size;
  final String asset;
  const BdSvgBinder3({super.key,
    required this.size,
    required this.asset
  });

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(asset, width: size.sizedBox14, height: size.sizedBox13,);
  }
}