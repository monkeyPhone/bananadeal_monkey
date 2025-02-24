import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_button_bar/help/detail_flexible_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../models/store/store_detail_info.dart';
import '../../../../../../../controllers/store_detail_controller.dart';
import 'help/detail_declaration_button.dart';



class StoreDetailButtonBar extends GetView<StoreDetailController> {
  final bool isInvite;
  final StoreDetail storeDetail;
  const StoreDetailButtonBar({Key? key,
    required this.storeDetail,
    required this.isInvite
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyD7D7D7)
              )
          ),
          height: WidgetSize(context).etc0156,
          width: WidgetSize(context).widthCommon,
          child: Row(

            children: [
              DetailFlexibleButton(icon: Icons.phone, text: '전화하기', border: true, onTap: () async{
                await controller.makePhoneCall(storeDetail.smTel);
              }),
              DetailFlexibleButton(
                  icon: Icons.map_outlined, text: '지도에서 보기', border: true,
                  onTap: () async{
                    await controller.launchNaverMap(
                        name: controller.storeDetail.value.smStoreName,
                        road: controller.storeDetail.value.smAddress,
                        latitude:  double.parse(controller.storeDetail.value.smLatitude),
                        longtitude:  double.parse(controller.storeDetail.value.smLongitude)
                    );

                    // controller.launchNaverMap(
                    //     name: controller.storeDetail.value.smStoreName,
                    //     road: controller.storeDetail.value.smAddress, latitude: double.parse(controller.storeDetail.value.smLatitude),
                    //     longtitude: double.parse(controller.storeDetail.value.smLongitude)
                    // );
                  }),
              DetailFlexibleButton(icon: Icons.share_outlined, text: '공유하기', border: true, onTap: () async{
                await controller.shareStore();
                //await controller.sharedKaKao();
              }),
              DetailDeclarationButton(isInvite:isInvite),
            ],
          ),
        ),
        Container(
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).sizedBox10,
          color: Style.greyF4F4F4,
        )
      ],
    );
  }
}
