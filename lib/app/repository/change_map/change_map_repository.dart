import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/app/repository/app_repository.dart';
import 'package:dio/dio.dart';
import '../../models/auth_basic_api.dart';
import '../../models/sign/address_model.dart';
import '../../routes/api_url.dart';


class ChangeMapRepository {
  final ApiConsole _apiConsole;
  final AppReopsitory _appRepository;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const ChangeMapRepository({
    required ApiConsole apiConsole,
    required AppReopsitory appRepository,
    required String bananaPrivateUrl,
    this.router505 = 'main',
    this.rp = 'ChangeMapRepository-'
  }) :  _apiConsole = apiConsole,
        _appRepository = appRepository,
        _bananaPrivateUrl = bananaPrivateUrl;

  Future<AddressModel> addressSearch({required String search, required int currentPage}) async {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      String confmKey = 'U01TX0FVVEgyMDIyMTEwMTE2MTI0NzExMzE2OTA=';
      var response =
      await dio.get("https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do?confmKey=$confmKey&resultType=json&currentPage=$currentPage&countPerPage=20&keyword=$search&firstSort=none"
      );
      String address = response.data.toString().replaceAll('(','').replaceAll(')', '');
      Map<String, dynamic> addressMap = jsonDecode(address);
      AddressModel addressModel = AddressModel.fromJson(addressMap);

      return addressModel;

    } catch (e) {
      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 102, lerContent: '내부 공공데이터 주소 api 오류', lerRoute: '', lerMroute: 'ChangeMapRepository_addressSearch', lerEerror: e.toString())
        );
      return AddressModel(
          results: Results(
              common: Common(
                  errorMessage: '서버 에러', countPerPage: '', totalCount: '', errorCode: '', currentPage: ''
              ),
              juso: <Juso>[]
          )
      );
    } finally{
      dio.close();
    }
  }

  Future<AuthBagicApi> updateAdress({required String add, required String dong, required String latitude, required String longitude}) async{
    final String apiRoute = '$_bananaPrivateUrl/member/add/edit';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}updateAdress',
        error: 'Y',
        router505: router505,
        form: {
          "M_add": add,
          "M_add_dong": dong,
          "M_latitude": latitude,
          "M_longitude": longitude,
        }
    );

    final AuthBagicApi messages = AuthBagicApi.fromJson(data);

    return messages;


  }

  Future<AuthBagicApi> updateSearchRange({required int range}) async{
    final String apiRoute = '$_bananaPrivateUrl/member/edit/searchrange';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}updateSearchRange',
        router505: router505,
        error: 'Y',
        form: {
          "M_search_range": range,
        }
    );

    final AuthBagicApi messages = AuthBagicApi.fromJson(data);

    return messages;
  }

  Future<AuthBagicApi> getRange() async{
    final String apiRoute = '$_bananaPrivateUrl/member/give/searchrange';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}updateSearchRange',
        router505: router505,
        error: 'Y',
    );

    final AuthBagicApi messages = AuthBagicApi.fromJson(data);

    return messages;
  }
}