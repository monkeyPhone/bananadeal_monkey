import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_shadow_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/change_map_icon_current_place.dart';
import 'package:flutter/material.dart';
import '../../../../../css/size.dart';
import '../../../../../css/style.dart';
import '../../../src_components/controllers/src_route_controller.dart';
import '../../store/controllers/store_controller.dart';

class ChangeMapAppbarIconButton extends StatelessWidget {
  const ChangeMapAppbarIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RippleShadowIconButton(
          onTap: (){
            SrcRouteController.to.gotoMap();
            StoreController.to.storeSearch.clear();
            StoreController.to.storeInput.value = '';
            StoreController.to.storeText.clear();
          },
          child: const Icon(Icons.location_on, color: Style.bananaGreen,),
        ),
        SizedBox(width: WidgetSize(context).sizedBox16,),
        Container(
          constraints: BoxConstraints(
              minWidth: WidgetSize(context).width01,
              maxWidth: WidgetSize(context).width03
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('현재위치', style: TextStyle(color: Style.bananaGreen, fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox12),textAlign: TextAlign.right,),
              ChangeMapIconCurrentPlace()
            ],
          ),
        ),
      ],
    );
  }
}
