import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/app_push_status.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth_basic_api.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deeplink/guest_event_detail.dart';
import 'package:banana_deal_by_monkeycompany/app/models/version_check_new.dart';
import 'package:dio/dio.dart';
import '../models/deeplink/guest_store_detail.dart';

class AppReopsitory{
  final DioServiceManager dsm;
  final String bananaOpenUrl;
  final String router505;
  final String rp;
  const AppReopsitory({
    required this.dsm,
    required this.bananaOpenUrl,
    this.router505 = 'splash',
    this.rp = 'AppReopsitory-'
});

  // final String _bananaOpenUrl = ApiConsole.bananaOpenUrl;


  Future<AuthBagicApi> sendErrorReport({required int lerStatus, required String lerContent, required String lerRoute, required String lerMroute, required lerEerror}) async {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      FormData formData = FormData.fromMap(
          {
            "LER_status": lerStatus,
            "LER_content": lerContent,
            "LER_route": lerRoute,
            "LER_mrouter": lerMroute,
            "LER_eError" : lerEerror
          }
      );
      var response =
      await dio.post(
        '$bananaOpenUrl/log/error',
        data: formData
      );
      var data = response.data;
      final AuthBagicApi api = AuthBagicApi.fromJson(data);
      return api;
    } catch(e){
      return AuthBagicApi(status: 503, msg: '', result: []);
    } finally{
      dio.close();
    }

  }

  Future<int> serverCheck() async {
    final String apiRoute = '$bananaOpenUrl/server/check';
    final Map<String, dynamic> data = await dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getAppVersion', router505: router505);
    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    final int result = api.status;
    return result;
  }

  Future<VersionCheckNew> getAppVersion(String type) async {
    final String apiRoute = '$bananaOpenUrl/appinfo/version/new';
    final Map<String, dynamic> data = await dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getAppVersion', router505: router505,
      form: {
          "osType" : type
      }
    );
    final VersionCheckNew api = VersionCheckNew.fromJson(data);
    return api;
  }

  Future<AppPushStatus> getPush(int mIdx) async {
    final String apiRoute = '$bananaOpenUrl/push/list';
    final Map<String, dynamic> data = await dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getPush',
        router505: router505,
        form:   {
          "M_idx": mIdx,
        }
    );
    final AppPushStatus api = AppPushStatus.fromJson(data);
    return api;
  }

  Future<GuestStoreDetail> getStoreDetail(int smIdx) async {
    final String apiRoute = '$bananaOpenUrl/store/detail';
    final Map<String, dynamic> data = await dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getStoreDetail',
        router505: 'deeplink',
        form:  {
          "SM_idx": smIdx,
        }
    );
    final GuestStoreDetail api = GuestStoreDetail.fromJson(data);
    return api;
  }

  Future<GuestEventDetail> getEventDetail(int beIdx) async {
    final String apiRoute = '$bananaOpenUrl/event/detail';

    final Map<String, dynamic> data = await dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getStoreDetail',
        router505: 'deeplink',
        form: {
          "BE_idx": beIdx,
        }
    );
    final GuestEventDetail api = GuestEventDetail.fromJson(data);
    return api;
  }

}