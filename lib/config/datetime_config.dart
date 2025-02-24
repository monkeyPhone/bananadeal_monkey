import 'package:timezone/standalone.dart' as tz;

class DateTimeConfig {
  // 기본 타임존을 Asia/Seoul로 지정
  static tz.Location seoul = tz.getLocation('Asia/Seoul');
  DateTime now = tz.TZDateTime.now(seoul);
}