import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class DataDto {
  final StatusEnum statusEnum;
  final JsonError? error;
  final List<dynamic> data;
  final bool tokenError;
  const DataDto({
    required this.statusEnum,
    required this.data,
    required this.tokenError,
    this.error,
  });
}