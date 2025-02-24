import 'dart:async';
import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth_basic_api.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_modal.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/dialog/sign_email_check_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/dialog/sign_otp_check_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_etc_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../components/future_loading_overlay.dart';
import '../../../../../css/style.dart';
import '../../../../../managers/device_manager.dart';
import '../../../../../models/auth/jwt_login.dart';
import '../../../../../models/sign/check_email.dart';
import '../../../../../models/sign/make_token.dart';
import '../../../../../repository/sign/sign_5_repository.dart';
import '../../../../../routes/const_element.dart';
import '../../../../../routes/error_handling.dart';
import '../../../../main/auth/auth_controller.dart';
import '../../../views/pages/sign2/sign_view_2_change_auth.dart';



class SignView2Controller extends GetxController {
  static SignView2Controller get to => Get.find();

  final EtcEtcRepository _etcEtcRepository;
  final Repo5 _repo5;
  final CommonWidgets _commonWidgets;

  SignView2Controller({
    required EtcEtcRepository etcEtcRepository,
    required Repo5 repo5,
    required CommonWidgets commonWidgets,
  }) :  _etcEtcRepository = etcEtcRepository,
        _repo5 = repo5,
        _commonWidgets = commonWidgets;

  late final TextEditingController emailTextField;
  late final TextEditingController domainTextField;
  late final TextEditingController passwordTextField;
  late final TextEditingController passwordTextField1;
  late final TextEditingController passwordTextField2;
  late final TextEditingController submitTextField;

  RxInt currentTap = 0.obs;
  List tap = ['로그인', '회원가입'];
  RxInt waitLoginStatus = 0.obs;

  RxString newbie = ''.obs;

  RxInt currentButton = 0.obs;
  List buttonIcon = [AppElement.kakao, AppElement.apple];
  List symbolColor = [Style.kakaoSymbol, Style.white];
  List labelColor = [Style.kakaoLable, Style.white];
  List buttonName = ['Kakao로 계속하기', 'Apple로 계속하기'];
  List buttonColor = [Style.kakaoYellow, Colors.black];

  RxString loginStatus = ''.obs;

  RxBool checkd = true.obs;

  RxBool seadEmail = false.obs;


  Rx<JwtLogin> jwt = JwtLogin(status: 0, msg: '', result: []).obs;


  void srcBackFunc(BuildContext context) {
    if(AuthController.to.newbie != ''){
      _srcBackFuncSign1Off(context);
    } else{
      _srcBackFuncSign1On(context);
    }
  }

  String errorCode(int status, String msg){
    switch(status){
      case 200:
        return '$status: 성공';
      case 400:
        return '$status: $msg';
      case 401:
        return '$status: $msg';
      case 404:
        return currentTap.value == 0 ? '입력하신 이메일을 찾을 수 없습니다' :'이미 가입된 이메일입니다';
      case 500:
        return '$status: 서버에러';
      default:
        return '${503}: 서버에러';
    }
  }

  Future<bool> checkServerStatus() async{
    final String apiRoute = '${ApiConsole.bananaOpenUrl}/server/check';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try{
      await dio.post(apiRoute,);
      return true;
    } catch(_){
      _commonWidgets.customSnackbar('현재 서버 연결이 원활하지 않습니다.');
      return false;
    } finally {
      dio.close();
    }
  }

  // TODO: 회원가입 메일 otp 함수

  Timer? timer;

  RxInt countDown = 300.obs;

  void resetOtp() {
    status.value = '';
    seadEmail.value = false;
    checkMail.value = CheckEmail(status: 0, msg: '', result: <Item>[]);
    update();
  }

  Future<void> resendOtp() async{
    countDown.value = 300;
    update();
    timer?.cancel();
    await authMail();

  }

  void cancelOtp(bool isCancel){
    resetOtp();
    countDown.value = 300;
    update();
    timer?.cancel();
    if(isCancel){
      Get.back();
    }
  }

  void resetOtpAfter3Minutes() {
    timer =  Timer.periodic(Duration(seconds: 1), (timer) {
      countDown.value--;
      update();
      if (countDown.value == 0) {
        resetOtp();
        countDown.value = 300;
        update();// 다시 3분(180초)로 설정
        timer.cancel();
        Get.back();
      }
    });
  }


  void otherChangeValue(){
    currentTap.value = 0;
    update();
  }


  String formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    final formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$minutes:$formattedSeconds ';
  }


  void updateModalE(int index){
    loginStatus.value = '';
    domain.value = domainList[index];
    inputDomainFiled();
    update();
    if(index == domainList.length-1)
    {
      domainSelected.value = true;
      update();
    }
  }

  void confirmEmail(){
    if(checkMail.value.result[0].authNumber == submit.value)
      {
        status.value = '';
        confirm.value = true;
        update();
        cancelOtp(true);
      }
    else{
      _commonWidgets.customSnackbar('인증번호가 일치하지 않습니다. 다시 확인해주세요.');
    }
  }

  Rx<CheckEmail> checkMail = CheckEmail(status: 0, msg: '', result: <Item>[]).obs;
  RxString email = ''.obs;

  Future<void> checkEmail(BuildContext context) async{
    AuthBagicApi check = await showFutureLoadingOverlay<dynamic>(
      context: Get.context!,
      future: _repo5.checkMail(eamil.value, domain.value),
      expanded: true,
    );
    if(check.status == 200){
      if(context.mounted){
        emailCheckDialog(context);
      }
    }
    else if(check.status == 404){
      status.value = errorCode(check.status, check.msg);
      update();
      _commonWidgets.customSnackbar(check.result.first == 0 ? '가입유형: 이메일 로그인' :  '가입유형: SNS 로그인');
    }
    else{
      if(check.status >= 500){
        _commonWidgets.customSnackbar('잠시 후, 다시 시도해주세요.');
      }
    }
  }


  void emailCheckDialog(BuildContext route){

    Future.delayed(Duration.zero, (){
      if(route.mounted){
        showDialog<String>(
            barrierDismissible: true,
            context: route,
            builder: (BuildContext context) =>
                SignEmailCheckDialog(
                  isSign: true,
                  onTap: () async{
                    await authMail();
                  Get.back();
                  emailAuthDialog(route);
                },)
        );
      }
    });
  }

  Future<void> clickDomain() async{
    // ['naver.com', 'gmail.com', 'daum.net', 'hanmail.net', 'icloud.com', 'nate.com', '직접 입력하기']
    String eet = switch(domain.value){
      'naver.com' => 'https://www.naver.com/',
      'gmail.com' => 'https://www.google.com/?hl=ko',
      'daum.net' || 'hanmail.net' => 'https://www.daum.net/',
      'nate.com' => 'https://www.nate.com/',
     _ => ''
    };
    if(eet == ''){
      await launchUrl(
        Uri.parse('about:blank  // 이메일 사이트를 검색해주세요.'),
        mode: LaunchMode.externalApplication,
      );
    } else{
      await _openBrowser(eet);
    }


  }

  Future<void> _openBrowser(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      _commonWidgets.customSnackbar('잠시 후, 다시 시도해주세요.');
    }
  }

  void emailAuthDialog(BuildContext context){
    Future.delayed(Duration.zero, (){
      if(context.mounted){
        showDialog<String>(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) =>
                SignOtpCheckDialog(
                  domain: () async{
                    await clickDomain();
                  },
                  isSign: true,
                  email: '${eamil.value}@${domain.value}'.replaceAll(' ', ''),
                  onTap: (){
                    confirmEmail();
                  },
                  cancel: (){
                    cancelOtp(true);
                  },
                  dispose: (){
                    cancelOtp(false);
                  },
                )
        );
      }
    });
  }



  Future<CheckEmail> authMail() async{
    CheckEmail opt = await showFutureLoadingOverlay<dynamic>(
      context: Get.context!,
      future: _repo5.sendMail(eamil.value, domain.value),
      expanded: true,
    );
    checkMail.value = opt;
    update();
    if(opt.status == 200)
      {
        resetOtpAfter3Minutes();
        email.value = '${eamil.value}@${domain.value}';
        status.value = '이메일을 받지 못하셨다면, 메일 주소를 다시 한번 확인해주세요.';
        seadEmail.value = true;
        update();
      }
    else{
      if(opt.result.isNotEmpty){
        seadEmail.value = false;
        status.value = errorCode(opt.status, opt.msg);
        update();
        _commonWidgets.customSnackbar(opt.result.first.joinType == 'MAIL' ? '가입유형: 이메일 로그인' :  '가입유형: SNS 로그인');
      } else{
        if(opt.status == 500){
          ErrorManager.errorCodeReturn(status: opt.status, funcRoute: 'Repo5-sendMail', msg: opt.msg, apiRoute: '${ApiConsole.bananaOpenUrl}/check/email');
        }
      }
    }
    return opt;
  }

  Rx<MakeTokken> token = MakeTokken(status: 0, result: [], msg: '').obs;

  RxBool delaySign = false.obs;

  Future<void> tokenMaker(context) async {
    delaySign.value = true;
    update();
    MakeTokken make = await _repo5.sendIdpw(email.value, password2.value);
    token.value = make;
    update();
    if(make.status == 200)
      {
        currentTap.value = 0;
        update();
        await getLogin(context: context, email: eamil.value,  domain: domain.value, password: password2.value,);
      }
    if(make.status == 500){
      ErrorManager.errorCodeReturn(status: make.status, funcRoute: 'Repo5-sendIdpw', msg: make.msg, apiRoute: '${ApiConsole.bananaOpenUrl}/join');
    }
    delaySign.value = false;
    update();
  }



  // TODO: 로그인 이메일 입력 폼

  RxString eamil = ''.obs;
  RxString status = ''.obs;

  void inputEmail(val) {
    eamil.value = val;
    checkMail.value = CheckEmail(status: 0, msg: '', result: <Item>[]);
    loginStatus.value = '';
    update();

    if( RegExp(r'[ㄱ-ㅎㅏ-ㅣ가-힣]').hasMatch(val)
    // if( RegExp(r'^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$').hasMatch(val)
    )  {
      status.value = '이메일에 한글은 사용할 수 없습니다.';
      update();

    }
    if(!RegExp(r'[ㄱ-ㅎㅏ-ㅣ가-힣]').hasMatch(val)
    )  {
      status.value = '';
      update();
    }
   if(eamil.value.length == 0)
     {
       status.value = '';
       update();
     }
  }

  // TODO: 로그인 도메인 입력 폼

  RxString domain = ''.obs;

  final TextEditingController domainField = TextEditingController(
    text: Style.domain
  );


  void inputDomainFiled(){
    domainField.text = domain.value;
    update();
  }

  void inputDomain(val) {
    domain.value = val;
    loginStatus.value = '';
    checkMail.value = CheckEmail(status: 0, msg: '', result: <Item>[]);
    update();

    if(domain.value.contains('.'))
    {
      status.value = '';
      update();
    }
    if(!domain.value.contains('.'))
    {
      status.value = '올바른 이메일 형식이 아닙니다.';
      update();
    }
    if(domain.value.length == 0){
      status.value = '';
      update();
    }
  }

  // TODO: 로그인 비밀번호 입력 폼

  RxString password = ''.obs;
  RxBool lock = true.obs;

  void inputPassword(val) {
    password.value = val;
    loginStatus.value = '';
    update();
  }



  // TODO: OTP 입력 폼

  RxString submit = ''.obs;
  RxBool confirm = false.obs;
  RxBool finish = false.obs;

  void inputSubmit(val) {
    submit.value = val;
    update();
  }


  void whatTheButton(){
    domainSelected.value = false;
    domain.value = '';
    update();
  }


  void gotoReset() async{
    final bool next = await checkServerStatus();
    if(next == true){
      changeTap1();
      await DeviceManager.overLayClients();
      Get.to(() =>
          SignView2ChangeAuth(
            email: '',
            domain: '',  ),
          binding: BindingsBuilder((){
            Get.put(SignView2ChangeAuthController(
                repo5: _repo5,
                commonWidgets: _commonWidgets
            ));
          }
          )
      );
    }
  }

  void loginLockButton(){
    lock.value =! lock.value;
    update();
  }
  // TODO: 회원가입 비밀번호 입력 폼


  RxString password1 = ''.obs;
  RxString error = ''.obs;
  RxBool lock1 = true.obs;

  void changeLock1(){
    lock1.value =! lock1.value;
    update();
  }

  void inputPassword1(String val) {
    password1.value = val;
    update();
    if(val.length >= 20){
      error.value = '비밀번호의 길이가 너무 깁니다.';
      update();
    }
    if(!AppOutsFunction().pwRegExp(val))
    {
      error.value = '비밀번호의 조건이 충족되지 않습니다.';
      update();
    }
    if(password1.value.length == 0)
    {
      error.value = '';
      update();
    }
    if(AppOutsFunction().pwRegExp(val) && password1.value != password2.value && val.length <= 20)
    {
      error.value = '비밀번호가 일치하지 않습니다.';
      update();
    }
    if(password1.value == password2.value && val.length <= 20 && AppOutsFunction().pwRegExp(val))
    {
      error.value = '';
      update();
    }

  }


  RxString password2 = ''.obs;
  RxBool lock2 = true.obs;

  void changeLock2(){
    lock2.value =! lock2.value;
    update();
  }

  bool validate(){
    bool result1 = AppOutsFunction().pwRegExp(password1.value);
    bool result2 = AppOutsFunction().pwRegExp(password2.value);
    return result1 && result2;
  }

  void inputPassword2(String val) {
    password2.value = val;
    update();
    if(val.length >= 20){
      error.value = '비밀번호의 길이가 너무 깁니다.';
      update();
    }
    if(!AppOutsFunction().pwRegExp(password1.value))
    {
      error.value = '비밀번호의 조건이 충족되지 않습니다.';
      update();
    }
    if(password1.value == password2.value  && val.length <= 20 && AppOutsFunction().pwRegExp(password1.value))
    {
      error.value = '';
      update();
    }
    if(AppOutsFunction().pwRegExp(password1.value) && password1.value != password2.value  && val.length <= 20)
    {
      error.value = '비밀번호가 일치하지 않습니다.';
      update();
    }
    if(password2.value.length == 0)
    {
      error.value = '';
      update();
    }

  }


  // TODO: 도메인 모달 버튼


  RxBool domainSelected = false.obs;
  RxList domainList = ['naver.com', 'gmail.com', 'daum.net', 'hanmail.net', 'icloud.com', 'nate.com', '직접 입력하기'].obs;



  Future<void> showModal(BuildContext context) async{
    status.value = '';
    checkMail.value = CheckEmail(status: 0, msg: '', result: <Item>[]);
    update();
    await modalOnTap(context);

  }

 Future<void> modalOnTap(BuildContext context) async{
    await SignModal().modalOnTapSign(context);
 }

  // TODO: 로그인 함수
  // TODO: 메일
  Future<void> getLogin({required context, required email, required domain, required password}) async{
    waitLoginStatus.value = 10;
    update();
    JwtLogin data = await _repo5.emailLogin('${email}@${domain}', password);
    jwt.value = data;
    update();
    if(data.status != 200)
    {

      if(data.status == 500)
      {
        ErrorManager.errorCodeReturn(status: data.status, funcRoute: 'Repo5-emailLogin', msg: data.msg, apiRoute: '${ApiConsole.bananaOpenUrl}/login/email');
        _commonWidgets.customSnackbarFailLogin(status: 500, text: '이메일');
      }
      loginStatus.value = data.msg;
      update();
    } else {
      if(data.result.isNotEmpty)
      {
        loginStatus.value = '';
        update();
        AuthController.to.changeJWT(data.result.first);
      }
    }
    waitLoginStatus.value = 20;
    update();
  }

          // TODO: 카카오
  Rx<JwtLogin> kakaoInfo = JwtLogin(status: 0, msg: '', result: []).obs;



  Future<void> fn_loginWithKakaoAccount(BuildContext context) async{
    changeTap1();
    final bool next = await checkServerStatus();
    if(next == true){
      waitLoginStatus.value = 10;
      update();
      try {
        OAuthToken tokens = await UserApi.instance.loginWithKakaoAccount();
        if(context.mounted){
          JwtLogin info = await showFutureLoadingOverlay<dynamic>(
              future: _repo5.sendKakao(
                  access: tokens.accessToken,
                  refresh:  tokens.refreshToken
              ), expanded: true, context: context);
          kakaoInfo.value = info;
          update();
          if(info.status == 200)
          {
            AuthController.to.changeKAKAO(info.result.first);
          }
          else{
            if(info.status == 500){
              ErrorManager.errorCodeReturn(status: info.status, funcRoute: 'Repo5-sendKakao', msg: info.msg, apiRoute: '${ApiConsole.bananaKakaoLogin}/login');
              _commonWidgets.customSnackbarFailLogin(status: info.status, text: '카카오');
              AuthController.to.deleteKAKAO();
            }
            else{
              _commonWidgets.customSnackbarFailLogin(status: info.status, text: '카카오');
              AuthController.to.deleteKAKAO();
            }
          }
        }
        waitLoginStatus.value = 20;
        update();
      } catch (e) {
        if(context.mounted){
          if(!e.toString().contains("PlatformException(CANCELED,")) {
            _commonWidgets.customDialogButton1(
                routerContext: context, onTap: () {
              Get.back();
            }, mainText: '카카오 로그인 취소', buttonText: '확인');
          }
        }
        waitLoginStatus.value = 20;
        update();
      }
    }
  }

          // TODO: 애플
  Future signInWithApple(context) async {
    changeTap1();
    final bool next = await checkServerStatus();
    if(next == true){
      changeTap1();
      waitLoginStatus.value = 10;
      update();
      try{
        final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );

        final oauthCredential = OAuthProvider("apple.com").credential(
          idToken: appleCredential.identityToken,
          accessToken: appleCredential.authorizationCode,
        );

        var apple = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
        final String? email = apple.user!.email;
        final String uid = apple.user!.uid;
        JwtLogin login = await showFutureLoadingOverlay<dynamic>(context: context, future: _repo5.sendApple(uid: uid, email: email ?? 'null'),expanded:  true);
        if(login.status == 200)
        {
          AuthController.to.deleteAJWT();
          AuthController.to.deleteKAKAO();
          AuthController.to.changeAPPLE(login.result.first);
          waitLoginStatus.value = 20;
          update();
          return token;
        }
        else{
          if(login.status == 500){
            ErrorManager.errorCodeReturn(status: login.status, funcRoute: 'Repo5-sendApple', msg: login.msg, apiRoute: '${ApiConsole.bananaAppleLogin}/login');
            AuthController.to.deleteAPPLE();
            waitLoginStatus.value = 20;
            update();
            return token;
          }else{
            _commonWidgets.customSnackbar('애플 로그인을 다시 시도해주세요.');
            AuthController.to.deleteAPPLE();
            waitLoginStatus.value = 20;
            update();
            return token;
          }
        }

      }catch(_){
        waitLoginStatus.value = 20;
        update();
        return null;
      }
    } else{
      return null;
    }
  }


  RxBool serviceTerm = false.obs;
  RxBool privacyTerm  = false.obs;


  // TODO: Etc Widget Function
  void changeTap1(){
    cancelOtp(false);
    initialValue();
  }


  void initialValue() {
    domainSelected.value = false;
    loginStatus.value = '';
    email.value = '';
    token.value = MakeTokken(status: 0, result: [], msg: '');
    checkMail.value = CheckEmail(status: 0, msg: '', result: <Item>[]);
    status.value = '';
    jwt.value = JwtLogin(status: 0, msg: '', result: []);
    emailTextField.clear();
    domainTextField.clear();
    passwordTextField.clear();
    passwordTextField1.clear();
    passwordTextField2.clear();
    submitTextField.clear();
    eamil.value = '';
    domain.value = '';
    password.value = '';
    password1.value = '';
    password2.value = '';
    submit.value = '';
    seadEmail.value = false;
    confirm.value = false;
    finish.value = false;
    serviceTerm.value = false;
    privacyTerm.value = false;
    update();
  }

  void clickBackButton(){
    currentTap.value = 0;
    update();
    changeTap1();
    Get.back();
  }


  void _srcBackFuncSign1Off(BuildContext context) {
    if(currentTap.value == 1){
      _commonWidgets.customDialog(
          routerContext: context,
          barrierDismissible: true,
          mainText: '회원가입을 종료하시겠어요?',
          cancleText: '취소',
          confirmText: '종료',
          conFirmOnTap: () {
            Get.back();
            currentTap.value = 0;
            update();
            changeTap1();
          }
      );

    } else{
      _commonWidgets.customDialog(barrierDismissible: true,
          routerContext: context,
          mainText: '앱을 종료하시겠어요?', cancleText: '취소', confirmText: '종료',
          conFirmOnTap: () async{
            GetPlatform.isAndroid ? await SystemNavigator.pop()
                : GetPlatform.isIOS
                ?  exit(0)
                : null;
          }
      );
    }
  }


  void tapClick(int index) async{
    if(currentTap.value != index){
      final bool next = await checkServerStatus();
      if(next == true){
        currentTap.value = index;
        update();
        changeTap1();
        if(currentTap.value == 1){
          await DeviceManager.overLayClients();
          Get.to(
                  () => Sign2Term(),
              binding: BindingsBuilder(() {
                Get.put(Sign2TermController(
                    etcEtcRepository: _etcEtcRepository,
                    commonWidgets: _commonWidgets
                ));
              })
          );
        }
      }
    }
  }


  void _srcBackFuncSign1On(BuildContext context) {
    if(currentTap.value == 1){
      _commonWidgets.customDialog(
          barrierDismissible: true,
          routerContext: context,
          mainText: '회원가입을 종료하시겠어요?',
          cancleText: '취소',
          confirmText: '종료',
          conFirmOnTap: (){
            Get.back();
            currentTap.value = 0;
            update();
            changeTap1();
          }
      );

    } else{
      clickBackButton();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailTextField = TextEditingController();
    domainTextField = TextEditingController();
    passwordTextField = TextEditingController();
    passwordTextField1 = TextEditingController();
    passwordTextField2 = TextEditingController();
    submitTextField = TextEditingController();
    newbie.value = AuthController.to.newbie;
    update();
  }

  // TODO: GetX Worker

  @override
  void onReady() {
    super.onReady();
    debounce(waitLoginStatus, (_){
      if(waitLoginStatus.value == 20) {
        waitLoginStatus.value = 0;
        update();
      }
    });
  }

  void _controllerClose(){
    emailTextField.dispose();
    domainTextField.dispose();
    passwordTextField.dispose();
    passwordTextField1.dispose();
    passwordTextField2.dispose();
    submitTextField.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}

