import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import '../../models/auth/auth_info.dart';
import '../../models/auth_basic_api.dart';


class SrcInfoRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const SrcInfoRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'src',
    this.rp = 'SrcInfoRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;


  Future<AuthInfo> getUserInfo() async{
    final String apiRoute = '$_bananaPrivateUrl/member/me';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getUserInfo',
        error: 'Y',
        router505: router505,
    );
    final AuthInfo authInfo = AuthInfo.fromJson(data);
    return authInfo;
  }

  Future<AuthBagicApi> memberUUID({required String uuid}) async {
    final String apiRoute = '$_bananaPrivateUrl/member/uuid';

    final Map<String, dynamic> data = await _dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}memberUUID',
      router505: router505,
      checkPass: true,
      form: {
        "M_uuid": uuid,
      }
    );

    final AuthBagicApi check = AuthBagicApi.fromJson(data);
    return check;
  }

  Future<AuthBagicApi> memberModel({required String model}) async{
    final String apiRoute = '$_bananaPrivateUrl/member/edit/model';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}memberModel',
        router505: router505,
        checkPass: true,
        form: {
          "M_model": model,
        }
    );

    final AuthBagicApi check = AuthBagicApi.fromJson(data);
    return check;

  }

  Future<AuthBagicApi> checkPause() async {
    final String apiRoute = '$_bananaPrivateUrl/member/pause/check';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}memberModel',
        router505: router505,
    );

    final AuthBagicApi check = AuthBagicApi.fromJson(data);
    return check;


  }

}