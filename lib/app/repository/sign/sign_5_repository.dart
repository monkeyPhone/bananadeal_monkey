import 'dart:io';
import 'package:dio/dio.dart';
import '../../models/auth/jwt_login.dart';
import '../../models/auth_basic_api.dart';
import '../../models/sign/address_model.dart';
import '../../models/sign/check_email.dart';
import '../../models/sign/intro_image.dart';
import '../../models/sign/make_token.dart';
import '../../routes/api_url.dart';
import '../app_repository.dart';

class Repo5 {
  final ApiConsole _apiConsole;
  final String _bananaOpenUrl;
  final String _kakao;
  final String _apple;
  final AppReopsitory _appRepository;
  final String rp;
  final String router505;
  Repo5({
    required ApiConsole apiConsole,
    required String bananaOpenUrl,
    required String kakao,
    required String apple,
    required AppReopsitory appRepository,
    this.rp = 'Repo5-',
    this.router505 = 'sign'
  }) :  _apiConsole = apiConsole,
        _bananaOpenUrl = bananaOpenUrl,
        _kakao = kakao,
        _apple = apple,
        _appRepository = appRepository;



  // final Dio _dio = Dio();
  // final String _bananaOpenUrl = ApiConsole.bananaOpenUrl;
  // final String _kakao = ApiConsole.bananaKakaoLogin;
  // final String _apple = ApiConsole.bananaAppleLogin;

  // final AppReopsitory _appRepository = AppReopsitory(
  //     dsm: _dioServiceManager, bananaOpenUrl: ApiConsole.bananaOpenUrl);

  Future<AuthBagicApi> checkName(String mName) async {
    final String apiRoute = '$_bananaOpenUrl/check/name';


    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}checkName',
        router505: router505,
        form: {
          "M_name": mName,
        }
    );
    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    return api;
  }

  Future<IntroImageSet> getIntroImage() async {
    final String apiRoute = '$_bananaOpenUrl/appinfo/img';
    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getIntroImage',
        router505: router505,
    );
    final IntroImageSet image = IntroImageSet.fromJson(data);
    return image;
  }


  Future<JwtLogin> sendKakao({required String access, required String? refresh}) async {
    final String apiRoute = '$_kakao/login';
    final Map<String, dynamic> data = await _appRepository.dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}sendKakao',
      router505: router505,
      form:  {
        "access_token": access,
        "refresh_token": refresh,
      },
      checkPass: true
    );

    final JwtLogin kakaolog = JwtLogin.fromJson(data);
    return kakaolog;

  }

  Future<JwtLogin> sendApple({required String uid, required String email}) async {
    final String apiRoute = '$_apple/login';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}sendApple',
        router505: router505,
        form: {
          "apple_token": uid,
          "apple_email": email,
        },
        checkPass: true
    );

    final JwtLogin kakaolog = JwtLogin.fromJson(data);

    return kakaolog;

  }

  Future<CheckEmail> sendMail(email, domain) async {
    final String apiRoute = '$_bananaOpenUrl/check/email';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}sendMail',
        router505: router505,
        form: {
          "M_email": "$email@$domain"
        },
        checkPass: true
    );

    final CheckEmail emailCheck = CheckEmail.fromJson(data);
    return emailCheck;
  }

  Future<AuthBagicApi> checkMail(email, domain) async {
    final String apiRoute = '$_bananaOpenUrl/check/email/new';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}sendMail',
        router505: router505,
        form: {
          "M_email": "$email@$domain"
        },
        checkPass: true
    );

    final AuthBagicApi emailCheck = AuthBagicApi.fromJson(data);
    return emailCheck;
  }

  Future<CheckEmail> findMail(email, domain) async {
    final String apiRoute = '$_bananaOpenUrl/check/email/findpw';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}findMail',
        router505: router505,
        form: {
          "M_email": "$email@$domain"
        },
        checkPass: true
    );

    final CheckEmail emailCheck = CheckEmail.fromJson(data);
    return emailCheck;

  }

  Future<AuthBagicApi> updateMailpw(email, domain, pw) async {
    final String apiRoute = '$_bananaOpenUrl/pw/edit';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}updateMailpw',
        router505: router505,
        form: {
          "M_email": "$email@$domain",
          "M_pw": "$pw",
        },
        checkPass: true
    );

    AuthBagicApi emailCheck = AuthBagicApi.fromJson(data);
    return emailCheck;

  }

  Future<JwtLogin> emailLogin(id, pw) async{
    final String apiRoute = '$_bananaOpenUrl/login/email';

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}emailLogin',
        router505: router505,
        form: {
          "M_email": "$id",
          "M_pw": "$pw"
        },
        checkPass: true
    );

    JwtLogin jwtLogin = JwtLogin.fromJson(data);
    return jwtLogin;

  }

  Future<MakeTokken> sendIdpw(id, pw) async {

    final String apiRoute = '$_bananaOpenUrl/join';
    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}sendIdpw',
        router505: router505,
        form: {
          "M_email": "$id",
          "M_pw": "$pw"
        },
        checkPass: true
    );

    MakeTokken makeTokken = MakeTokken.fromJson(data);
    return makeTokken;

  }


  Future<AuthBagicApi> uploadImage({
   required String image, required String mIdx,  required String nick, required String add, required String dong, required String latitude, required String longitude
  }) async {
    final String apiRoute = '$_bananaOpenUrl/info/edit';

    var multi1 = image != '' ? MultipartFile.fromFileSync(File(image).path) : '';
    FormData formData = FormData.fromMap({
      "M_idx": mIdx,
      "M_name": nick,
      "M_add": add,
      "M_add_dong": dong,
      "M_latitude": latitude,
      "M_longitude": longitude,
      "M_path_img": multi1
    });

    final Map<String, dynamic> data = await _appRepository.dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}uploadImage',
        router505: router505,
        formData: formData,
        checkPass: true
    );

    AuthBagicApi messages = AuthBagicApi.fromJson(data);
    return messages;

  }

  Future<AddressModel> addressSearch(String search, int currentPage) async {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      String confmKey = 'U01TX0FVVEgyMDIyMTEwMTE2MTI0NzExMzE2OTA=';
      var response =
      await dio.get("https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do?confmKey=$confmKey&resultType=json&currentPage=$currentPage&countPerPage=20&keyword=$search"
      );
      String address = response.data.toString().replaceAll('(','').replaceAll(')', '');
      // Map<String, dynamic> addressMap = jsonDecode(address);
      // AddressModel addressModel = AddressModel.fromJson(addressMap);
      AddressModel addressModel = addressModelFromJson(address);

      return addressModel;

    } catch (e) {

      await _apiConsole.falseConnect(
          _appRepository.sendErrorReport(lerStatus: 102, lerContent: '내부 공공데이터 주소 api 오류', lerRoute: '', lerMroute: 'Repo5_addressSearch', lerEerror: e.toString())
      );
      return AddressModel(
          results: Results(
              common: Common(
                  errorMessage: '서버 에러', countPerPage: '', totalCount: '', errorCode: '', currentPage: ''
              ),
              juso: <Juso>[]
          )
      );
    } finally {
      dio.close();
    }

  }

}
