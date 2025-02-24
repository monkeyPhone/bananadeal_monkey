import 'package:banana_deal_by_monkeycompany/package/api/deal_edit/deal_edit_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal_edit/model/action/deal_edit_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class DealEditApiImpl implements DealEditApi {
  final DealEditAction action;
  const DealEditApiImpl({
    required this.action,
  });

  @override
  Future<StatusEnum> sendDeleteList({
    required String diIdxBundle,
    required DioRepository dio,
  }) => action.sendDeleteList(diIdxBundle: diIdxBundle, dio: dio);

}