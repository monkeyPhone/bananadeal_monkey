import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:dio/dio.dart';
import '../../models/auth_basic_api.dart';

//TODO: AuthController 에서 해당 Repository 참조할때 런타임이 안됨 그래서 STATIC으로 참조했음.

class EtcInfoRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String _bananaOpenUrl;
  final String router505;
  final String rp;

  const EtcInfoRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    required String bananaOpenUrl,
    this.router505 = 'main',
    this.rp = 'EtcInfoRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl,
        _bananaOpenUrl = bananaOpenUrl;

  Future<AuthBagicApi> changePw({required String email, required String pw}) async {

    final String apiRoute = '$_bananaOpenUrl/pw/edit';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}changePw',
        router505: router505,
        form: {
          "M_email": email,
          "M_pw": pw,
        }
    );

    final AuthBagicApi emailCheck = AuthBagicApi.fromJson(data);
    return emailCheck;

  }

  Future<AuthBagicApi> sendNick({required String mName}) async{

    final String apiRoute = '$_bananaPrivateUrl/member/edit/name';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}sendNick',
        router505: router505,
        error: 'Y',
        form:   {
          "M_name": mName,
        }
    );

    final AuthBagicApi deal = AuthBagicApi.fromJson(data);
    return deal;
  }


  Future<AuthBagicApi> sendImage({required String mEmail, required String mPathImage, required String mPathImageEdit}) async{
    var file = File(mPathImageEdit);
    MultipartFile multi = MultipartFile.fromFileSync(file.path,);
    final String apiRoute = '$_bananaPrivateUrl/member/edit/img';
    FormData formData = FormData.fromMap(
        {
          "M_email": mEmail,
          "M_path_img": mPathImage,
          "M_path_img_edit": multi,
        }
    );

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}sendImage',
        router505: router505,
        error: 'Y',
        formData: formData
    );

    final AuthBagicApi deal = AuthBagicApi.fromJson(data);
    return deal;
  }

  Future<AuthBagicApi> deleteImage({required String mEmail, required String mPathImage}) async{
    final String apiRoute = '$_bananaPrivateUrl/member/edit/img';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}deleteImage',
        router505: router505,
        form: {
          "M_email": mEmail,
          "M_path_img": mPathImage,
          "M_path_img_edit": '',
        }
    );

    final AuthBagicApi deal = AuthBagicApi.fromJson(data);
    return deal;
  }

  Future<AuthBagicApi> logout(int mIdx, bool how) async{
    final String apiRoute = '$_bananaOpenUrl/member/logout';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}logout',
        router505: router505,
        error: 'Y',
        form: {
          "how" : how,
          "M_idx": mIdx,
        }
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    return api;
  }

  Future<AuthBagicApi> userOut({required int reason, required reasonDetail}) async{
    final String apiRoute = '$_bananaPrivateUrl/member/out';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}userOut',
        router505: router505,
        error: 'Y',
        form:   {
          "MO_reason": reason,
          "MO_reason_content": reasonDetail,
        }
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    return api;
  }

}