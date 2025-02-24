import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/helper/change_map_current/change_map_page_router.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/helper/change_map_current/change_map_top_text_field.dart';
import 'package:flutter/material.dart';
import '../../address_form_area.dart';
import 'change_map_buitton_area.dart';
import 'change_map_resized_box.dart';

class ChangeMapCurrentView extends StatelessWidget {
  final BuildContext mediaContext;
  const ChangeMapCurrentView({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeMapTopTextField(mediaContext: mediaContext),
        ChangeMapResizedBox(mediaContext: mediaContext),
        AddressFormArea(mediaContext: mediaContext,),
        ChangeMapButtonArea(mediaContext: mediaContext,),
        Expanded(
          child: ChangeMapPageRouter(mediaContext: mediaContext,)
        ),
      ],
    );
  }
}




