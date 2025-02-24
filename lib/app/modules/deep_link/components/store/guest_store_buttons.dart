import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../../controllers/deep_link_store_controller.dart';



class GuestStoreButtonBar extends GetView<DeepLinkStoreController> {
  final int idx;
  const GuestStoreButtonBar({
    super.key,
    required this.idx,
    }) ;

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
              _flexibleButton(icon: Icons.phone, text: '전화하기', border: true, context: context, onTap: () async{
                await controller.makePhoneCall(controller.storeDetail.value.smTel);
              }),
              _flexibleButton(
                  icon: Icons.map_outlined, text: '지도에서 보기', border: true, context: context,
                  onTap: () async{
                    await controller.gotoMap(
                        name: controller.storeDetail.value.smStoreName,
                        road: controller.storeDetail.value.smAddress, latitude: double.parse(controller.storeDetail.value.smLatitude),
                        longtitude: double.parse(controller.storeDetail.value.smLongitude));
                  }),
              _flexibleButton(icon: Icons.share_outlined, text: '공유하기', border: true, onTap: () async{
                await controller.shareStore(idx);
                //await controller.sharedKaKao();
              }, context: context
              ),

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

  Widget _flexibleButton({required var icon, required String text, required bool border, required GestureTapCallback onTap, required BuildContext context}) {
    return  Flexible(
        fit: FlexFit.tight,
        child: Container(
          decoration: BoxDecoration(
              border: !border ? null : Border(right: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyEAEAEA))
          ),
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon, size: WidgetSize(context).sizedBox24,),
                Text(text, style: TextStyle(fontSize: WidgetSize(context).sizedBox15),)
              ],
            ),
          ),
        )
    );
  }

}
