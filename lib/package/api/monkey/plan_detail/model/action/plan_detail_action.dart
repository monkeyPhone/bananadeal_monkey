import 'dart:convert';

import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_detail_entity.dart';
import 'package:dio/dio.dart';

class PlanDetailAction {
  const PlanDetailAction();

  Future<List<PlanDetailDto>> getRatePlanDetail({
    required String pIdx,
    required String monkeyUrl
  }) async {
    final String apiRoute = '$monkeyUrl.monkeyphone.co.kr/_app/plan/modeDetailData?p_idx=$pIdx';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> data = jsonDecode(response.data);
      final PlanDetailEntity entity = PlanDetailEntity.fromJson(data);
      return entity.list;
    } catch (e) {
      return [];
    } finally{
      dio.close();
    }

  }
}