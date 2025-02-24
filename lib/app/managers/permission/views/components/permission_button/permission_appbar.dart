import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/image_provider/asset_image_box.dart';
import '../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../css/app_basic_component/basic_app_bar_text.dart';
import '../../../../../css/size.dart';
import '../../../../../routes/const_element.dart';
import '../../../controllers/permission_page_controller.dart';
import '../permission_background_observer.dart';

class PermissionAppBar extends StatelessWidget {
  final int androidSdkversion;
  const PermissionAppBar({
    required this.androidSdkversion,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox10),
      child: BasicAppbar(
        leading: (){
          Get.back();
          PermissionPageController.to.backPage.value = 30;
        },
        leadingWidget:  ClipRRect(
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox10),
          child: AssetImageBox(imageWidth: WidgetSize(context).height60px, imageHeight: WidgetSize(context).height60px,
              imageUrl: AppElement.bananaLaunch),
        ),
        actions: PermissionBackgroundObserver(androidSdkVersion: androidSdkversion,),
        title: BasicAppBarText(text: '접근 권한 안내',),
      ),
    );
  }
}
