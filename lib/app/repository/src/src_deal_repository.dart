import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/deal_list_page.dart';
import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_status.dart';
import '../../models/auth_basic_api.dart';
import '../../models/src/deal/user_deal.dart';


class SrcDealRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const SrcDealRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'src',
    this.rp = 'SrcDealRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;


  Future<DealStatus> getDealStatusAll({required int mIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/list';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getDealStatus',
        router505: router505,
        form: {
          "DI_reg_user_idx": "$mIdx",
        }
    );
    final DealStatus status = DealStatus.fromJson(data);
    return status;

  }

  Future<UserDeal> getDealInfo({required int mIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/byidx';
    final Map<String, dynamic> data = await _dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}getDealInfo',
      error: 'Y',
      router505: router505,
      form: {
        "DI_reg_user_idx": "$mIdx",
      }
    );
    final UserDeal dealInfo = UserDeal.fromJson(data);
    return dealInfo;
  }

  Future<UserDeal> getDealInfoNew({required int diIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/byidx/new';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getDealInfo',
        router505: router505,
        form: {
          "DI_idx": "$diIdx",
        }
    );
    final UserDeal dealInfo = UserDeal.fromJson(data);
    return dealInfo;
  }



  Future<int> getIsInvite({required int diIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/store/cnt';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getDealStatus',
        router505: router505,
        form: {
          "DI_idx" : diIdx
        }
    );
    final AuthBagicApi status = AuthBagicApi.fromJson(data);
    return status.result.isNotEmpty
            ? status.result.first
            : 0;

  }



  Future<DealListPage> getDealStatus({required int mIdx, required int page}) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/list/page';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getDealStatus',
        router505: router505,
        form: {
          "DI_reg_user_idx": "$mIdx",
          "limit" : 20,
          "page" : page
        }
    );
    final DealListPage status = DealListPage.fromJson(data);
    return status;

  }

  Future<AuthBagicApi> sendConfirmDeal({required deDidx, required  dDiIdx, required mName ,required smMid, required mIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/accept';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}sendConfirmDeal',
        router505: router505,
        error: 'Y',
        form: {
          "DE_d_idx": "$deDidx",
          "D_di_idx": "$dDiIdx",
          "M_name": "$mName",
          "D_sm_m_id": "$smMid",
          "M_idx" : "$mIdx"
        });

    final AuthBagicApi estimate = AuthBagicApi.fromJson(data);
    return estimate;


  }

  Future<AuthBagicApi> deleteDealEstimate({required String diIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/show/edit';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}deleteDealEstimate',
        router505: router505,
        form: {
          "DI_idx": diIdx,
        });
    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    return api;

  }

}