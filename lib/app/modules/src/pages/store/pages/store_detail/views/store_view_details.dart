import 'package:banana_deal_by_monkeycompany/app/components/loading.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_navbar/store_detail_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import 'helpers/store_detail_appbar/store_detail_appbar.dart';
import 'helpers/store_detail_floating_action_bar/store_detail_floating_action_button.dart';

class StoreViewDetails extends StatelessWidget {
  final bool isInvite;
  final String smid;
  final int midx;
  final int? indexs1;
  final int? rong;
  const StoreViewDetails({
    required this.isInvite,
    required this.smid,
    required this.midx,
    required this.indexs1,
    required this.rong,
    super.key});
  @override
  Widget build(BuildContext context) {
   try{
     return BasicCanvas(
       canPop: true,
       body: Column(
         children: [
           StoreDetailAppbar(),
           Expanded(
               child: StoreDetailBody(
                 isInvite: isInvite,
                 smid: smid, midx: midx, rong: rong, indexs1: indexs1 ?? null,)
           )
         ],
       ),
       bottomNavigationBar: isInvite ? SizedBox() : StoreDetailNavBar(),
       floatingActionButton: StoreDetailFloatingActionButton(),
     );
   }
   catch(_){
     return _Default();
   }
  }


}


class _Default extends StatelessWidget {
  const _Default();

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: DefaultView(text1: '만료된 페이지 입니다.', text2: '404',),
        bottomNavigationBar:  NeumorphicButtons(
          text: '돌아가기',
          onPressed: (){
            Get.back();
          },
        )
    );
  }
}
