import 'package:permission_handler/permission_handler.dart';

const String permissionIos = 'permissionIos';
const String ios = 'ios';
const String android34 = 'android34';
const String androidNew = 'androidNew';
const String androidOld = 'androidOld';
const String etc = 'etc';


const String permissionNoti = '알림 메시지 수신 및 데이터 최신화';
const String permissionLocation = '설정 위치 주변의 매장 찾기 기능';
const String permissionPhoto = '앱 서비스 사진 업로드';
const String permissionCamera = '프로필 사진 업로드';

const List<Permission> androidNewList = [
  Permission.photos,
  Permission.location,
  Permission.camera,
  Permission.notification,
];

const List<Permission> androidOldList = [
  Permission.storage,
  Permission.location,
  Permission.camera,
  Permission.notification,
];