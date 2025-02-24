import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/cm_bottom_navigation/cm_bottom_navigation_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/helper/change_map_appbar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/helper/change_map_expanded_child.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';
import '../../../../../routes/const_element.dart';
import 'change_map_controller.dart';

class ChangeMapView extends GetView<ChangeMapController> {
  const ChangeMapView({
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
          return GestureDetector(
            onTap: (){
              controller.focus.unfocus();
            },
            child: BasicCanvas(
              canPop: true,
              body: Column(
                children: [
                  ChangeMapAppbar(),
                  Expanded(
                      child:  ChangeMapExpandedChild(mediaContext: context,)

                  )
                ],
              ),

              bottomNavigationBar: SafeArea(
                child: Container(
                    height: AppElement.defaultBottomPadding,
                    color: Style.white,
                    padding: WidgetSize(context).paddingBodyWhole,
                    child: CmBottomNavigationBar()
                ),
              ),
            )
          );

  }



}
