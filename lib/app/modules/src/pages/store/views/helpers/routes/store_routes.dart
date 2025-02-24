import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/controllers/store_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_appbar/helper/store_appbar_statement.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_body/store_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store_loading_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';


class StoreRoutes extends GetView<StoreController> {
  const StoreRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.focus.unfocus();
      },
      child: Stack(
        children: [
          Container(
            color: Style.white,
            child: Column(
              children: [
                StoreAppbarStatement(),
                SizedBox(height: WidgetSize(context).sizedBox10,),
                Expanded(
                    child: StoreBody()
                )
              ],
            ),
          ),
          StoreLoadingBar()
        ],
      )

    );
  }
}


