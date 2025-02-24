import 'package:flutter/material.dart';

import '../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class NaverMapStaticAppBar extends StatelessWidget {
  final String name;
  const NaverMapStaticAppBar({
    required this.name,
    super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
      title:  name == ''
                ?  Text(
                     '지도에서 위치 확인',
                      style: TextStyle(
                          color: Style.blackWrite,
                          fontSize: WidgetSize(context).sizedBox24,
                          fontWeight: FontWeight.w700
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                   )
                :  Text(
                     name,
                      style: TextStyle(
                          color: Style.blackWrite,
                          fontSize: WidgetSize(context).sizedBox22,
                          fontWeight: FontWeight.w700
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
    );
  }
}
