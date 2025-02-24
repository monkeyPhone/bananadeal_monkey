import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/image_provider/asset_image_box.dart';
import '../../../css/size.dart';
import '../../../css/style.dart';
import '../../../routes/const_element.dart';

class FcmDialog {

  SnackbarController customSnackbarPush({
    required String alert,
    required int duration,
    GestureTapCallback? onTap,
    required String title, required String text, String? url}){
    return Get.snackbar('', '',
        backgroundColor: Style.white,
        titleText: Text(alert, style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox16, fontWeight: FontWeight.w700), textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis, maxLines: 1,),
        messageText: GestureDetector(
          onTap: onTap ?? (){
            Get.back();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:  CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(WidgetSize(Get.context!).sizedBox12),
                    border: Border.all(
                        width: WidgetSize(Get.context!).sizedBox1,
                        color: Style.cream
                    )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(WidgetSize(Get.context!).sizedBox12),
                  child: AssetImageBox(
                          imageHeight: WidgetSize(Get.context!).height60px,
                          imageWidth: WidgetSize(Get.context!).height60px,
                          imageUrl: url ?? AppElement.bananaLaunch
                        )

                ),
              ),
              SizedBox(width: WidgetSize(Get.context!).sizedBox10,),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: WidgetSize(Get.context!).sizedBox5,),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(title, style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w700,), textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis, maxLines: 1,),
                      ),
                      SizedBox(height: WidgetSize(Get.context!).sizedBox3,),
                      FittedBox(fit: BoxFit.scaleDown,
                      child: Text(text, style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400,),textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis, maxLines: 12,
                      ),
                      )
                    ]
                ),
              ),
            ],
          ),
        ),
        borderRadius: WidgetSize(Get.context!).sizedBox20,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: duration)
    );
  }

}