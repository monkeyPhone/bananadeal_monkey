import 'package:flutter/material.dart';

import '../../../../../components/addr_text_area.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';

class NaverMapStaticBottom extends StatelessWidget {
  final String road;
  const NaverMapStaticBottom({
    required this.road,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
            color: Style.white,
            child: AddrTextArea(address: road)
        ));
  }
}
