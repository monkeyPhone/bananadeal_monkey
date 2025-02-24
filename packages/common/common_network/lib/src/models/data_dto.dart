import 'package:utils/utils.dart';

class DataDto {
  final EnumStatus status;
  final List<dynamic> data;

  const DataDto({
    required this.status,
    required this.data,
  });
}