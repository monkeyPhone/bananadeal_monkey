import 'dart:convert';
import 'package:dio/dio.dart';
import '../../models/deal/get_guyhap.dart';
import '../../models/deal/model_name.dart';
import '../../models/deal/phone_rate_plan.dart';
import '../../models/deal/phone_rate_plan_detail.dart';
import '../../models/deal/rate_plan_name_list.dart';
import '../../models/deal/walfare_list.dart';
import '../../routes/api_url.dart';
import '../app_repository.dart';


class RatePlanRepository {

  final AppReopsitory _appRepository;
  final String _monkeyUrl;
  final ApiConsole _apiConsole;

  const RatePlanRepository({
    required AppReopsitory appRepository,
    required String monkeyUrl,
    required ApiConsole apiConsole,

  }) :  _appRepository = appRepository,
        _monkeyUrl = monkeyUrl,
        _apiConsole = apiConsole;

  Future<RatePlanNameList> getRatePlanName(var tkIdx) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/plan/modeListYogumGroup?tk_idx=$tkIdx';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      var _response =
      await dio.get(apiRoute);
      Map<String, dynamic> _nameList = jsonDecode(_response.data);
      RatePlanNameList _modelNameList = RatePlanNameList.fromJson(_nameList);
      List<String> banList = ["신규가입불가", "2G, 3G 전용", "T포켓파이", "3G 전용", "에그", "라우터", "USIM", "3G전용"];
      _modelNameList.list.removeWhere((element) => banList.contains(element.pgName));
      return _modelNameList;

    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'RatePlanRepository_getRatePlanName', lerEerror: '몽키api')
      );
      return RatePlanNameList(list: [
        NameList(pgIdx: '', tkIdx: '', pgOrder: '', pgName: '', pgRegiDate: '', pgEditDate: '')
      ]);
    } finally{
      dio.close();
    }

  }


  Future<PhoneRatePlan> getRatePlan(var tkIdx) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/plan/modeListPlanYogum?tk_idx=$tkIdx';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> rateList = jsonDecode(response.data);
      PhoneRatePlan modelListRate = PhoneRatePlan.fromJson(rateList);
      if(modelListRate.rateList != null){
        for(var i = 0; i<modelListRate.rateList!.length; i++){
          final int price = int.parse(modelListRate.rateList![i].pPlanPrice!);
          final double vat = int.parse(modelListRate.rateList![i].pPlanPrice!)*0.1;
          final int v = vat.floor();
          final int priceVat = price+v;
          final double priceV = priceVat*0.1;
          final int priceF = priceV.floor();
          final int priceR = priceF*10;
          modelListRate.rateList![i].pPlanPrice = priceR.toString();
        }
        modelListRate.rateList!.removeWhere((element) => element.pType == "USIM");
      }
        return modelListRate;

    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'RatePlanRepository_getRatePlan', lerEerror: '몽키api')
      );
      return PhoneRatePlan(rateList: [
        RateList(pIdx: '', pgIdx: '', pOrder: '', pType: '', pPlanName: '', pPlanPrice: '', pLte: '', pTel: '', pSms: '', pgName: '')
      ]);
    } finally {
      dio.close();
    }

  }

  Future<PhoneRatePlanDetail> getRatePlanDetail(var pIdx) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/plan/modeDetailData?p_idx=$pIdx';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);

    try {

      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> rateList = jsonDecode(response.data);
      PhoneRatePlanDetail modelListRateDetail = PhoneRatePlanDetail.fromJson(rateList);
      return modelListRateDetail;


    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'RatePlanRepository_getRatePlanDetail', lerEerror: '몽키api')
      );
      return PhoneRatePlanDetail(list: []);
    } finally {
      dio.close();
    }

  }

  Future<PhoneRatePlan> getRatePlanMobile({required var tkIdx, required var mdModel}) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/plan/modeListPlanYogum_mobile?tk_idx=$tkIdx&md_model=$mdModel';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {

      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> rateList = jsonDecode(response.data);
      PhoneRatePlan modelListRate = PhoneRatePlan.fromJson(rateList);
      if(modelListRate.rateList != null){
        for(var i = 0; i<modelListRate.rateList!.length; i++){
          final int price = int.parse(modelListRate.rateList![i].pPlanPrice!);
          final double vat = int.parse(modelListRate.rateList![i].pPlanPrice!)*0.1;
          final int v = vat.floor();
          final int priceVat = price+v;
          final double priceV = priceVat*0.1;
          final int priceF = priceV.floor();
          final int priceR = priceF*10;
          modelListRate.rateList![i].pPlanPrice = priceR.toString();
        }
      }
      return modelListRate;

    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'RatePlanRepository_getRatePlanMobile', lerEerror: '몽키api')
      );
      return PhoneRatePlan(rateList: []);
    } finally {
      dio.close();
    }

  }

  Future<PhoneRatePlanDetail> getRatePlanMobileDetail({var tkIdx, var mdModel, var pIdx}) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr//_app/plan/modeDetailData_mobile?tk_idx=$tkIdx&md_model=$mdModel&p_idx=$pIdx';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);

    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> rateList = jsonDecode(response.data);
      PhoneRatePlanDetail modelListRateDetail = PhoneRatePlanDetail.fromJson(rateList);


      return modelListRateDetail;


    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'RatePlanRepository_getRatePlanMobileDetail', lerEerror: '몽키api')
      );
      return PhoneRatePlanDetail(list: []);
    } finally{
      dio.close();
    }

  }



  Future<WalfareList> getWalfareList() async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/PopupWelfare/modeListData';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);

    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> modelList = jsonDecode(response.data);
      WalfareList walfare = WalfareList.fromJson(modelList);

      return walfare;
    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'RatePlanRepository_getWalfareList', lerEerror: '몽키api')
      );
      return WalfareList(list: [], result: '');
    } finally {
      dio.close();
    }
  }

  Future getGuyhapList(tkIdx) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/gyeolhab/modeListGyeolhap?tk_idx_mobile=$tkIdx';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> modelList = jsonDecode(response.data);
      if(modelList["result"] == 'Y'){
        GuyhapData guyhap = GuyhapData.fromJson(modelList);
        return guyhap;
      }
      else{
        return GuyhapData(result: modelList["result"], list: []);
      }


    } catch(e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'RatePlanRepository_getGuyhapList', lerEerror: '몽키api')
      );
      return GuyhapData(result: '101', list: [], );
    } finally {
      dio.close();
    }
  }

  Future getPhoneModelName({tkIdx, ps_idx}) async {
    final String apiRoute = '$_monkeyUrl.monkeyphone.co.kr/_app/mobile/modeGetModelBySpecIdx?tk_idx=$tkIdx&ps_idx=$ps_idx';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);

    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> modelList = jsonDecode(response.data);
      ModelName model = ModelName.fromJson(modelList);
      return model;
    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 101, lerContent: e.toString(), lerRoute: apiRoute, lerMroute: 'RatePlanRepository_getPhoneModelName', lerEerror: '몽키api')
      );
      return ModelName(list: []);
    } finally {
      dio.close();
    }
  }



}