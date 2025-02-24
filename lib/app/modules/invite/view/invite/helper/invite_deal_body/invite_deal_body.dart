import 'package:banana_deal_by_monkeycompany/app/components/loading.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/helper/invite_deal_body/invite_deal_body_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InviteDealBody extends StatelessWidget {
  const InviteDealBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteDealController>(
      builder: (controller)=>
      controller.isError.value
          ? Center(
        child: RippleDecorationButton(
            onTap: () async{
              await controller.failError();
            },
            padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox8),
            border: Border.all(
                width: WidgetSize(context).sizedBox1_5,
                color: Colors.grey
            ),
            widget: Text('재연결', style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: WidgetSize(context).sizedBox16
            ),)
        ),
      )
          :
      controller.storeList.isNotEmpty
          ?  InviteDealBodyMain(
                sController: controller.sController,
                itemCount: controller.storeList.length, store: controller.storeList,
                invitedList: controller.invitedList, allClick: controller.allClick.value,
                loading: controller.loading.value,
                deletedList: controller.deleteList,
                watingSocket: controller.watingSocket.value,
              )
          :  DefaultView(text1: '주변에 초대 가능한 매장이 없어요.', text2: ''),
    );
  }
}
