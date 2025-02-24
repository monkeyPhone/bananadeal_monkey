import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio_convert/model/func/dio_convert_api_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

abstract class DioConvertProvider {
  final DioConvertApiFunc func;
  const DioConvertProvider({
    required this.func
  });

}

class DioConvertProviderImpl implements DioConvertProvider {
  @override
  final DioConvertApiFunc func;
  const DioConvertProviderImpl({
    required this.func,
  });

}