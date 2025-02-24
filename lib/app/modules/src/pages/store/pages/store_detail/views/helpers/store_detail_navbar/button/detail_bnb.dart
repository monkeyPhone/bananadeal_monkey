import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_navbar/button/detail_invite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../controllers/store_detail_controller.dart';


class DetailBnb extends GetView<StoreDetailController> {
  const DetailBnb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: SizedBox(
          width: WidgetSize(context).widthCommon,
          height: controller.deviceHeight.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: WidgetSize(context).widthCommon,
                height: WidgetSize(context).height60px,
                child: Row(
                  children: [
                    Expanded(
                        child: DetailInviteButton()
                    ),
                    Expanded(
                        child:
                        GestureDetector(
                          onTap: AppOutsFunction().debounce(callback: (){
                            controller.clickChatCunsulting(context);
                          }),
                          child: Container(
                            color: Style.yellow,
                            child: Center(
                                child: Text('채팅으로 상담하기'
                                  ,style: TextStyle(fontSize: WidgetSize(context).sizedBox18, color: Style.brown),
                                )
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
