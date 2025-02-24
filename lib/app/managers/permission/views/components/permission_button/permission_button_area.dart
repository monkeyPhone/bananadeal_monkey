import 'package:banana_deal_by_monkeycompany/app/managers/permission/controllers/permission_page_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const/const_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../css/style.dart';
import 'helper/permission_column.dart';



class PermissionButtonArea extends StatelessWidget {
  final int androidSdkVersion;
  const PermissionButtonArea({
    required this.androidSdkVersion,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PermissionPageController>(
      builder: (PermissionPageController controller) {
        // controller.refreshed(androidSdk: androidSdkVersion);
        return Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              PermissionColumn(
                title: '알림',  sub: androidSdkVersion == 0 ? '(선택)' : '', explain: InfoString.permissionNoti,
                explainMini: '알림 메시지는 앱 설정에서 수신 거부 가능해요',
                iconMain: Icons.notifications,
                stateIcon:
                controller.noti.value == PermissionStatus.granted,
                mainIconColor: Style.yellow,
              ),
              PermissionColumn(title: '위치', sub: androidSdkVersion == 0 ? '(선택)' : '', explain: InfoString.permissionLocation,
                explainMini: null,
                iconMain: Icons.location_on,
                stateIcon:
                controller.locations.value == PermissionStatus.granted,
                mainIconColor: Style.cocacolaRed,
              ),

              androidSdkVersion >= 33 || androidSdkVersion == 0
              ?
              PermissionColumn(title: '사진', sub: androidSdkVersion == 0 ? '(선택)' : '', explain: InfoString.permissionPhoto,
                explainMini: null,
                iconMain: Icons.photo,
                stateIcon:
                controller.photos.value == PermissionStatus.granted || controller.photos.value == PermissionStatus.limited,
                mainIconColor: Style.smaragdineGreen,
              ) :
              PermissionColumn(title: '저장소', sub: androidSdkVersion == 0 ? '(선택)' : '', explain: InfoString.permissionPhoto,
                explainMini: null,
                iconMain: Icons.storage,
                stateIcon:
                controller.storage.value == PermissionStatus.granted,
                mainIconColor: Style.smaragdineGreen,
              ),
              PermissionColumn(title: '카메라', sub: androidSdkVersion == 0 ? '(선택)' : '', explain: InfoString.permissionCamera,
                explainMini: null,
                iconMain: Icons.camera_alt,
                stateIcon:
                controller.camera.value == PermissionStatus.granted,
                mainIconColor: Style.ironGrey,
              ),
            ],
          );
      },
    );
  }
}
