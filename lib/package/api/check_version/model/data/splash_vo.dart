import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/version_check_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class SplashVO {
  const SplashVO({
    required this.statusEnum,
    required this.currentVersion,
    this.contents,
    this.error
  });

  final StatusEnum statusEnum;
  final VersionCheckDto? contents;
  final String currentVersion;
  final JsonError? error;

}



