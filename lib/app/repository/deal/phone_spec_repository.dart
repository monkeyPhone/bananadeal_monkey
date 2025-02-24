import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/mks_list.dart';
import 'package:dio/dio.dart';
import '../../models/deal/mk_list.dart';
import '../../models/deal/model_detail_data.dart';
import '../../models/deal/model_list_mobile.dart';
import '../../models/deal/model_list_mobile_maker.dart';
import '../../models/deal/model_list_phone_spec.dart';
import '../../routes/api_url.dart';
import '../app_repository.dart';


class PhoneSpecRepository {

  final AppReopsitory _appRepository;
  final String _monkeyUrl;
  final ApiConsole _apiConsole;

  PhoneSpecRepository({
    required AppReopsitory appRepository,
    required String monkeyUrl,
    required ApiConsole apiConsole,

  }) :  _appRepository = appRepository,
        _monkeyUrl = monkeyUrl,
        _apiConsole = apiConsole;

  // static final PhoneSpecRepository instance = PhoneSpecRepository._internal();
  // factory PhoneSpecRepository() => instance;
  // PhoneSpecRepository._internal();
  //
  // final String _monkeyUrl = ApiConsole.monkeyUrl;
  // final Dio _dio = Dio();
  // final AppReopsitory _appRepository = const RegisterManager().getAppRepository();

  final BaseOptions _baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
  );

  Future<ModeListMobileMaker> getMakerList() async{
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeListPhoneMaker?showAllMaker=N';

    final Dio dio = Dio(_baseOptions);
    try{
      var response = await dio.get(apiRoute);
      Map<String, dynamic> makerList = jsonDecode(response.data);
      ModeListMobileMaker makerListData = ModeListMobileMaker.fromJson(makerList);
      makerListData.list.removeWhere((element) => element.mkName == '엘지' || element.mkName == "단말기 미구매" || element.mkName == "디바이스 단독");
      return makerListData;
    }catch(e){
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'PhoneSpecRepository_getMakerList', lerEerror: '몽키api')
      );
      return ModeListMobileMaker(list: []);
    } finally{
      dio.close();
    }

  }


  Future<ModelListPhoneSpec> getModelListPhoneSpec(mkIdx) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeListPhoneSpecBanana?mk_idx=$mkIdx&SORT_BY=PS_order&SORT=DESC';

    final Dio dio = Dio(_baseOptions);
    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> modelList = jsonDecode(response.data);
      ModelListPhoneSpec modelListSpec = ModelListPhoneSpec.fromJson(modelList);
      modelListSpec.list.removeWhere((element) => element.psName.contains('(중고)'));
      return modelListSpec;
    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'PhoneSpecRepository_getModelListPhoneSpec', lerEerror: '몽키api')
      );
      return ModelListPhoneSpec(list: []);
    } finally {
      dio.close();
    }
  }

  Future<ModelListMobile> getModelListMobile(var tkIdx) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/mobile/modeListMobileBanana?tk_idx=$tkIdx';
    final Dio dio = Dio(_baseOptions);
    try {

      var _response =
      await dio.get(apiRoute);
      Map<String, dynamic> _modelList = jsonDecode(_response.data);
      ModelListMobile _modelListMobile = ModelListMobile.fromJson(_modelList);

        return _modelListMobile;


    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'PhoneSpecRepository_getModelListMobile', lerEerror: '몽키api')
      );
      return ModelListMobile(list: []);
    } finally{
      dio.close();
    }

  }

  Future<ModelDetailData> getModelDetailData(var psIdx) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeDetailData?ps_idx=$psIdx';
    final Dio dio = Dio(_baseOptions);
    try {

      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> _modelList = jsonDecode(response.data);
      ModelDetailData _modelListMobile = ModelDetailData.fromJson(_modelList);

        return _modelListMobile;


    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'PhoneSpecRepository_getModelDetailData', lerEerror: '몽키api')
      );
      return ModelDetailData(
        result: '',
        phoneSpecDetail: PhoneSpecDetail(
            psIdx: '', mkIdx: '', mksIdx: '',
            psOrder: '', psName: '', psModel: '', psOs: '', psCpu: '', psDisplay: '', psDisplaySize: '',
            psCameraFront: '', psCameraBack: '', psWeight: '', psHeight: '', psWidth: '', psThickness: '', psInMemory: '',
            psExMemory: '', psRam: '', psBattery: '', psInfo1: '', psInfo2: '', psExplainImgPath: '', psMobileGrade: '',
            psTypeAnalytics: '', psReleaseDate:  DateTime(0), psRegiDate:  DateTime(0), psEditDate:  DateTime(0),
            psDualNumber: '', psAllImgPath: '', psIsAllImg: '', psSpecNfc: '', psSpecType: '', psSpecFilm: '', psSpecUsim: '',
            psSpecComponent: '', psSpecDesign: '', psSpecSpecial: '', psSpecCamera: '', psSpecAsinfo: '', psSpecAod: '', psSpecPay: '', psSpecIp: ''),

        phoneImg: [], phoneOptionNum: [], );
    } finally {
      dio.close();
    }

  }

  Future<MkElement> getModelDetailMkData() async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/modeListPhoneMaker?showAllMaker=N';
    final Dio dio = Dio(_baseOptions);

    try {

      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> _modelList = jsonDecode(response.data);
      MkElement _modelListMobile = MkElement.fromJson(_modelList);

      return _modelListMobile;


    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'PhoneSpecRepository_getModelDetailMksData', lerEerror: '몽키api')
      );
      return MkElement(
          list: []
      );
    } finally {
      dio.close();
    }

  }

  Future<MksElement> getModelDetailMksData(var mksIdx) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/phoneSpec/makerSecondDetailData?mks_idx=$mksIdx';
    final Dio dio = Dio(_baseOptions);

    try {

      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> _modelList = jsonDecode(response.data);
      MksElement _modelListMobile = MksElement.fromJson(_modelList);

      return _modelListMobile;


    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'PhoneSpecRepository_getModelDetailMksData', lerEerror: '몽키api')
      );
      return MksElement(
        result: '',
        list: MksList(mksIdx: '', mksName: '', mksOrder: '', mksImgPath: '')
      );
    } finally {
      dio.close();
    }

  }


}