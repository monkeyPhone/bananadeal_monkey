import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/home/views/widgets/home_components/home_deal/helpers/home_deal_button_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';


class HomeDeal extends StatelessWidget {
  const HomeDeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Style.greyF4F4F4,
        width: WidgetSize(context).widthCommon,
        child: HomeDealButtonArea()
    );

  }
}

