import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import '../../models/auth_basic_api.dart';

class DealRepository{

  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const DealRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'main',
    this.rp = 'DealRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;



  // static final DealRepository instance = DealRepository._internal();
  // factory DealRepository() => instance;
  // DealRepository._internal();
  //
  //
  // final String _bananaPrivateUrl = ApiConsole.bananaPrivateUrl;
  // final Dio _dio = Dio();
  // final String _contentType = ApiConsole.contentType;


  Future<AuthBagicApi> postEndDeal({required String diHopePhone, required String uuid, required int diIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/deal/end';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}postEndDeal',
        router505: router505,
        error: 'Y',
        form: {
          "DI_hope_phone": diHopePhone,
          "DI_idx": "$diIdx",
          "M_uuid": uuid
        }
    );

    final AuthBagicApi bagic = AuthBagicApi.fromJson(data);
    return bagic;

  }

}