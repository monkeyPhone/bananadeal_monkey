import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_body/helper/store_body_change_bottom_up/store_body_change_bottom_up_main.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_body/helper/store_body_change_bottom_up/store_body_change_resize_box.dart';
import 'package:flutter/material.dart';



class StoreBodyChangeBottomUp extends StatelessWidget {

  const StoreBodyChangeBottomUp({

    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Expanded(
              child: StoreBodyChangeBottomUpMain()
          ),
          StroeBodyChangeResizeBox()
        ]
    );
  }
}
