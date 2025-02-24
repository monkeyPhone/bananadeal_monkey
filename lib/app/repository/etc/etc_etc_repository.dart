import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:dio/dio.dart';
import '../../models/auth_basic_api.dart';
import '../../models/etc/etc_notice.dart';
import '../../models/etc/in_question.dart';
import '../../models/etc/some_question.dart';
import '../../models/etc/terms.dart';

class EtcEtcRepository {

  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String _bananaGuest;
  final String router505;
  final String rp;

  const EtcEtcRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    required String bananaGuest,
    this.router505 = 'main',
    this.rp = 'EtcEtcRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl,
        _bananaGuest = bananaGuest;

  Future<Terms> getTerms() async{
    final String apiRoute = '$_bananaGuest/terms';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getTerms',
        router505: router505,
        error: 'Y'
    );

    final Terms api = Terms.fromJson(data);
    return api;

  }

  Future<AuthBagicApi> userInqCreate({
    required int miMidx, required String miName,
    required String miTitle, required String miContent,
    required String miQpathImg1,  required String miQpathImg2,  required String miQpathImg3
  }) async{
    var multi1 = miQpathImg1 != '' ?  MultipartFile.fromFileSync(File(miQpathImg1).path,) : '';
    var multi2 = miQpathImg2 != '' ?  MultipartFile.fromFileSync(File(miQpathImg2).path,) : '';
    var multi3 = miQpathImg3 != '' ?  MultipartFile.fromFileSync(File(miQpathImg3).path,) : '';

    final String apiRoute = '$_bananaPrivateUrl/inq/create';
    FormData formData = FormData.fromMap(
        {
          "MI_m_idx": miMidx,
          "MI_name": miName,
          "MI_title": miTitle,
          "MI_content": miContent,
          "MI_q_path_img1": multi1,
          "MI_q_path_img2": multi2,
          "MI_q_path_img3": multi3,
        }
    );

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}userInqCreate',
        router505: router505,
        error: 'Y',
        formData:  formData
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    return api;
  }


  Future<InQuestion> getUserInqList({required int mIdx}) async{
    final String apiRoute = '$_bananaPrivateUrl/inq/list';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getUserInqList',
        router505: router505,
        error: 'Y',
        form:  {
          "MI_m_idx": mIdx,
        }
    );

    final InQuestion api = InQuestion.fromJson(data);
    return api;

  }

  Future<SomeQuestion> getUserSomeInqList() async{

    final String apiRoute = '$_bananaPrivateUrl/favoriteq';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getUserSomeInqList',
        router505: router505,
        error: 'Y',
    );

    final SomeQuestion api = SomeQuestion.fromJson(data);
    return api;

  }

  Future<EtcNotice> getUserNoticeList() async{
    final String apiRoute = '$_bananaPrivateUrl/notice';

    final Map<String, dynamic> data = await _dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}getUserNoticeList',
      router505: router505,
      error: 'Y',
    );

    final EtcNotice api = EtcNotice.fromJson(data);
    return api;

  }


  //바나나 fix 여기 추가됨 M_mp_push, M_sp_push

  Future<AuthBagicApi> getPushStatus({
    required String appPush,
    required String gwanggoPush,
    required String chatPush,
    required String mpPush,
    required String mPeditDate,
  }) async{
    final String apiRoute = '$_bananaPrivateUrl/push/edit';

    final Map<String, dynamic> data = await _dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}getPushStatus',
      router505: router505,
      error: 'Y',
      form:  {
        "M_app_push": appPush,
        "M_gwanggo_push": gwanggoPush,
        "M_chat_push": chatPush,
        "M_mp_push" : mpPush,
        "M_editdate_mp" :mPeditDate,
      }
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);

    return api;

  }

}