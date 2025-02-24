import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class StoreDetailFloatingActionButton extends StatelessWidget {
  const StoreDetailFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreDetailController>(
        builder: (controller) =>
          controller.currentTap.value == 1 && controller.reViewListAll.isNotEmpty
            ?   switch(controller.reviewLast.value){
            true =>
                SizedBox(
                  width: WidgetSize(context).srcFloatingActionBarSize,
                  height: WidgetSize(context).srcFloatingActionBarSize,
                  child: FloatingActionButton(
                    backgroundColor: Style.yellow
                    ,
                    onPressed: () async{
                      await controller.moveScrollInit();
                    },
                    elevation: 1,
                    child:  Center(
                        child: Icon(Icons.keyboard_arrow_up , size: WidgetSize(context).width007,)),
                  ),
                ),
            false =>
              const  SizedBox(),
          }
          :   const SizedBox()

    );
  }
}
