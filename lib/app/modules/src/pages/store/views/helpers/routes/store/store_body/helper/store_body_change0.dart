import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_body/helper/store_body_change_bottom_down/store_body_change_bottom_down.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_body/helper/store_body_change_bottom_up/store_body_change_bottom_up.dart';
import 'package:flutter/material.dart';


class StoreBodyChange0 extends StatelessWidget {

  const StoreBodyChange0({
    super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0
              ?  StoreBodyChangeBottomUp()
              :  StoreBodyChangeBottomDown();
  }
}
