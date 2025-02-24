import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class StoreDetailAppbar extends StatelessWidget {
  const StoreDetailAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BasicAppbar(
      leading: (){
        Get.back();
      },
      title: Text('매장 상세보기',
        style: TextStyle(
            color: Style.blackWrite,
            fontWeight: FontWeight.w700,
            fontSize: WidgetSize(context).sizedBox24
        ),
      ),
    );
  }
}
