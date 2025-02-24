import 'package:banana_deal_by_monkeycompany/package/data/common/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class DataDto {
  final StatusEnum statusEnum;
  final JsonError? error;
  final List<dynamic> data;
  const DataDto({
    required this.statusEnum,
    required this.data,
    this.error,
  });
}