import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_estimate.dart';
import 'package:banana_deal_by_monkeycompany/app/models/src/deal/estimate_status.dart';

class SrcEstimateRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;
  const SrcEstimateRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'src',
    this.rp = 'SrcDealRepository-'
  }) : _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;

  Future<DealEstimate> getDealEstimateByIdx({
    required String smMid
  }) async{
    final String apiRoute = '$_bananaPrivateUrl/deal/estimate/list/byidx';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getDealEstimate',
        router505: router505,
        form: {
          "SM_m_id" : smMid,
        }
    );
    final DealEstimate estimate = DealEstimate.fromJson(data);
    return estimate;
  }

  Future<EstimateStatus> getDealEstimateByIdxStatus(int diIdx) async{
    final String apiRoute = '$_bananaPrivateUrl/deal/estimate/list/byidx/status/new';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getDealEstimate',
        router505: router505,
        form: {
          "DI_idx" : "$diIdx",
        }
    );
    final EstimateStatus estimate = EstimateStatus.fromJson(data);
    return estimate;
  }

  Future<DealEstimate> getDealEstimate({
    required int diIdx,
    required int start,
    required int order,
    required int length
  }) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/estimate/list';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getDealEstimate',
        router505: router505,
        form: {
          "DI_idx" : "$diIdx",
          "start" : start,
          "M_order": order,
          'length' : length
        }
    );
    final DealEstimate estimate = DealEstimate.fromJson(data);
    return estimate;

  }
}