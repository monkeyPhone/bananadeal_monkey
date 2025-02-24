import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import '../../models/auth_basic_api.dart';

class MakeDealRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const MakeDealRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'main',
    this.rp = 'MakeDealRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;


  Future<AuthBagicApi> postNewDeal({userIdx, joinType, currentAgency , requestAgency,
      joinerPhone, joinerPhoneModel, joinerPhoneIdx, joinerRatePlan, joinerRatePlanIdx,
      ageType, maxInstallment, guyHap, welfare, sup, etc}) async {

    final String apiRoute = '$_bananaPrivateUrl/deal/create';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}postNewDeal',
        router505: router505,
        error: 'Y',
        form: {
          "DI_reg_user_idx": "$userIdx",
          "DI_join_type": "$joinType",
          "DI_before_tk_idx": "$currentAgency",
          "DI_after_tk_idx": "$requestAgency",
          "DI_hope_phone": "$joinerPhone",
          "DI_hope_phone_model": "$joinerPhoneModel",
          "DI_hope_phone_idx": "$joinerPhoneIdx",
          "DI_hope_plan": "$joinerRatePlan",
          "DI_hope_plan_idx": "$joinerRatePlanIdx",
          "DI_age_type": "$ageType",
          "DI_max_installment_month": "$maxInstallment",
          "DI_combination": "$guyHap",
          "DI_welfare": "$welfare",
          "DI_requests": "$etc",
          "DI_support_type": "$sup",
        }
    );

    final AuthBagicApi bagic = AuthBagicApi.fromJson(data);
    return bagic;

  }

  Future<InviteStore> postStoreList({required int diIdx, required String smMid, required mName}) async {

    final String apiRoute = '$_bananaPrivateUrl/deal/invite';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}postStoreList',
        router505: router505,
        error: 'Y',
        form: {
          "D_di_idx": diIdx,
          "D_sm_m_id": smMid,
          "M_name": "$mName"
        }
    );

    final InviteStore bagic = InviteStore.fromJson(data);
    return bagic;

  }

  Future<InviteStore> postStoreListNew({required int diIdx, required String smMid, required mName}) async {

    final String apiRoute = '$_bananaPrivateUrl/deal/invite/new';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}postStoreList',
        router505: router505,
        error: 'Y',
        form: {
          "D_di_idx": diIdx,
          "D_sm_m_id": smMid,
          "M_name": "$mName"
        }
    );

    final InviteStore bagic = InviteStore.fromJson(data);
    return bagic;

  }

  Future<InviteStore> postStoreListAllNew({required int diIdx, required String mName, required String del_sm_m_id
  }) async {

    final String apiRoute = '$_bananaPrivateUrl/deal/invite/all/new';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}postStoreListAll',
        router505: router505,
        error: 'Y',
        form: {
          "D_di_idx": diIdx,
          "M_name": "$mName",
          "del_sm_m_id": del_sm_m_id
        }
    );

    final InviteStore bagic = InviteStore.fromJson(data);
    return bagic;

  }

  Future<InviteStore> postStoreListAll({required int diIdx, required String mName, required String del_sm_m_id
  }) async {

    final String apiRoute = '$_bananaPrivateUrl/deal/invite/all';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}postStoreListAll',
        router505: router505,
        error: 'Y',
        form: {
          "D_di_idx": diIdx,
          "M_name": "$mName",
          "del_sm_m_id": del_sm_m_id
        }
    );

    final InviteStore bagic = InviteStore.fromJson(data);
    return bagic;

  }


}