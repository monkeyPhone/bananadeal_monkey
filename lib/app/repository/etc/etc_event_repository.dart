import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import '../../models/auth_basic_api.dart';
import '../../models/etc/etc_event.dart';
import '../../models/etc/etc_event_detail.dart';

class EtcEventRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const EtcEventRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'main',
    this.rp = 'EtcEventRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;

  Future<EtcEvent> getUserEtcEvent({required int mIdx}) async{
    final String apiRoute = '$_bananaPrivateUrl/event/list';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getUserEtcEvent',
        router505: router505,
        error: 'Y',
        form: {
          "MI_m_idx": mIdx,
        }
    );

    final EtcEvent api = EtcEvent.fromJson(data);
    return api;

  }

  Future<EtcEventDetail> getUserEtcEventDetail({required int eventIdx, required String email}) async{
    final String apiRoute = '$_bananaPrivateUrl/event/detail';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getUserEtcEventDetail',
        router505: router505,
        error: 'Y',
        form:  {
          "BE_idx": eventIdx,
          "BEP_email" : email,
        }
    );

    final EtcEventDetail api = EtcEventDetail.fromJson(data);
    return api;

  }

  Future<AuthBagicApi> postEventJoin({required int beIdx, required String name, required String email, required int mIdx}) async{
    final String apiRoute = '$_bananaPrivateUrl/event/create';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}postEventJoin',
        router505: router505,
        error: 'Y',
        form:  {
          "BEP_be_idx": beIdx,
          "BEP_name": name,
          "BEP_email": email,
          "BEP_m_idx": mIdx
        }
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    return api;

  }


}