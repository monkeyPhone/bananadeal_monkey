class InfoString {
  static final InfoString instance = InfoString._internal();
  factory InfoString() => instance;
  InfoString._internal();

  static const String dealStatusIng = '진행중';
  static const String dealStatusEnd = '종료';
  static const String dealStatusAcp = '수락';
  static const String dealStatusOpen = '개통';

  static const String notiConfirm = 'notiConfirm';

  static const String reservationMe = '개통자 본인';
  static const String reservationOther = '대리인';

  static const String saveReservation = 'saveReservation';

  static const String reservationMent = '선택한 날은 예약할 수 없습니다.';

  static const String permissionNoti = '알림 메시지 수신 및 데이터 최신화';
  static const String permissionLocation = '설정 위치 주변의 매장 찾기 기능';
  static const String permissionPhoto = '앱 서비스 사진 업로드';
  static const String permissionCamera = '프로필 사진 업로드';


}