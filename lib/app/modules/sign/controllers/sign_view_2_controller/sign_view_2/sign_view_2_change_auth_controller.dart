import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_modal.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/dialog/sign_email_check_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/dialog/sign_otp_check_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../components/common_widgets.dart';
import '../../../../../components/future_loading_overlay.dart';
import '../../../../../models/auth_basic_api.dart';
import '../../../../../models/sign/check_email.dart';
import '../../../../../repository/sign/sign_5_repository.dart';
import '../../../../../routes/error_handling.dart';
import 'sign_view_2_controller.dart';

class SignView2ChangeAuthController extends GetxController {

  final Repo5 _repo5;
  final CommonWidgets _commonWidgets;

  SignView2ChangeAuthController({
    required Repo5 repo5,
    required CommonWidgets commonWidgets,
  }) : _repo5 = repo5,
        _commonWidgets = commonWidgets;

  RxInt currentStep = 0.obs;

  RxInt countDown = 300.obs;
  Timer? timer;

  void resetOtp() {
    currentStep.value = 0;
    status.value = '';
    checkMail.value = CheckEmail(status: 0, msg: '', result: <Item>[]);
    update();
  }

  Future<void> resendOtp(BuildContext context) async{
    countDown.value = 300;
    update();
    timer?.cancel();
    await authMail();
  }

  void cancelOtp(bool isCancel){
    try{
      resetOtp();
      countDown.value = 300;
      update();
      timer?.cancel();
      if(isCancel){
        Get.back();
      }
    } catch(_){
      if(isCancel){
        Get.back();
      }
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

  String formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    final formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$minutes:$formattedSeconds ';
  }


  void getEmailDomain(String str, String str2){
    try{
      str == '' ? null : eamil.value = str;
      str == '' ? null : domain.value = str2;
      update();
    }catch(e){
      Get.back();
      _commonWidgets.customSnackbar('요청 실패');
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
        return '입력하신 이메일을 찾을 수 없습니다';
      case 405:
        return '회원가입 되지않은 이메일입니다.';
      case 500:
        return '$status: 서버에러';
      default:
        return '${503}: 서버에러';
    }
  }

  void changeTap1(){
    domainSelected.value = false;
    email.value = '';
    checkMail.value = CheckEmail(status: 0, msg: '', result: <Item>[]);
    status.value = '';
    emailTextField.clear();
    domainTextField.clear();
    passwordTextField1.clear();
    passwordTextField2.clear();
    submitTextField.clear();
    eamil.value = '';
    domain.value = '';
    password1.value = '';
    password2.value = '';
    submit.value = '';
    currentStep.value = 0;
    update();
  }


  void confirmEmail(){
    if(checkMail.value.result[0].authNumber == submit.value)
    {
      cancelOtp(true);
      status.value = '';
      currentStep.value = 2;
      update();
    }
    else{
      Get.snackbar('알림', '인증번호가 일치하지 않습니다. 다시 확인해주세요.');
    }
  }

  Rx<CheckEmail> checkMail = CheckEmail(status: 0, msg: '', result: <Item>[]).obs;
  RxString email = ''.obs;


  Rx<AuthBagicApi> checkMessage = AuthBagicApi(status: 0, msg: '', result: []).obs;

  Future<AuthBagicApi> changePw() async{
    final AuthBagicApi make = await showFutureLoadingOverlay<dynamic>(
      context: Get.context!,
      future: _repo5.updateMailpw(eamil.value, domain.value, password2.value),
      expanded: true,
    );
    checkMessage.value = make;
    update();
    if(checkMessage.value.status == 200)
    {
      Timer(const Duration(milliseconds: 300),
              () {
                SignView2Controller.to.otherChangeValue();
                Get.back();
                _commonWidgets.customSnackbar('비밀번호 변경 성공');
          }
      );
    }
    else
    {
      if(make.status == 500){
        ErrorManager.errorCodeReturn(status: make.status, funcRoute: 'Repo5-updateMailpw', msg: make.msg, apiRoute: '${ApiConsole.bananaOpenUrl}/join');
        _commonWidgets.customSnackbar(errorCode(checkMessage.value.status, checkMessage.value.msg));
      }else{

      }
    }
    return make;
  }

  // 이메일 입력 폼 ___ 시작
  late final TextEditingController emailTextField;
  RxString eamil = ''.obs;
  RxString status = ''.obs;

  void inputEmail(val) {
    eamil.value = val;
    checkMail.value = CheckEmail(status: 0, msg: '', result: <Item>[]);
    update();

    if(RegExp(r'^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$').hasMatch(val)
    )  {
      status.value = '이메일에 한글은 사용할 수 없습니다.';
      update();

    }
    if(!RegExp(r'^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$').hasMatch(val)
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

  // 도메인 입력 폼 ___ 시작
  late final TextEditingController domainTextField;
  RxString domain = ''.obs;

  void inputDomain(val) {
    domain.value = val;
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



  // 비밀번호 입력 폼 ___ 시작
  late final TextEditingController submitTextField;
  RxString submit = ''.obs;


  void inputSubmit(val) {
    submit.value = val;
    update();
  }

  late final TextEditingController passwordTextField1;
  RxString password1 = ''.obs;
  RxString error = ''.obs;
  RxBool lock1 = true.obs;

  void changeLock(){
    lock1.value =! lock1.value;
    update();
  }

  void inputPassword1(val) {
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

  late final TextEditingController passwordTextField2;
  RxString password2 = ''.obs;
  RxBool lock2 = true.obs;

  void changeLock2(){
    lock2.value =! lock2.value;
    update();
  }

  void inputPassword2(val) {
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


  RxBool domainSelected = false.obs;
  RxList domainList = ['naver.com', 'gmail.com', 'daum.net', 'hanmail.net', 'icolud.com', 'nate.com', '직접 입력하기'].obs;


  void whatTheButton(){
    domainSelected.value = false;
    domain.value = '';
    update();
  }

  bool validate(){
    bool result1 = AppOutsFunction().pwRegExp(password1.value);
    bool result2 = AppOutsFunction().pwRegExp(password2.value);
    return result1 && result2;
  }

  void updateModal(int index){
    domain.value = domainList[index];
    update();
    if(index == domainList.length-1)
    {
      domainSelected.value = true;
      update();
    }
  }

  Future<void> showModal(BuildContext context) async{
      await modalOnTap(context);
  }

  Future<void> modalOnTap(BuildContext context) async{
    await SignModal().modalOnTapSignAuth(context);
  }


  Future<void> checkEmail(BuildContext context) async{
    AuthBagicApi check = await showFutureLoadingOverlay<dynamic>(
      context: Get.context!,
      future: _repo5.checkMail(eamil.value, domain.value),
      expanded: true,
    );
    if(check.status == 200){
      status.value = errorCode(405, check.msg);
      update();
    }
    else if(check.status == 404){
      if(context.mounted){
        status.value = '';
        update();
        emailCheckDialog(context);
      }
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
                  isSign: false,
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
                  isSign: false,
                  email: '${eamil.value}@${domain.value}'.replaceAll(' ', ''),
                  onTap: (){
                    confirmEmail();
                  },
                  dispose: (){
                    cancelOtp(false);
                  },
                  cancel: (){
                    cancelOtp(true);
                  },
                )
        );
      }
    });
  }



  Future<CheckEmail> authMail() async{
    print('it is send email');
    CheckEmail opt = await showFutureLoadingOverlay<dynamic>(
      context: Get.context!,
      future: _repo5.findMail(eamil.value, domain.value),
      expanded: true,
    );
    checkMail.value = opt;
    update();
    if(opt.status == 200)
    {

      resetOtpAfter3Minutes();
      currentStep.value = 1;
      status.value = '';
      email.value = '${eamil.value}@${domain.value}';
      update();
    }
    else{
      if(opt.result.isNotEmpty){
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



  void controllerDispose(){
    try{
      emailTextField.dispose();
      domainTextField.dispose();
      submitTextField.dispose();
      passwordTextField1.dispose();
      passwordTextField2.dispose();
    } catch(_){

    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailTextField = TextEditingController();
    domainTextField = TextEditingController();
    submitTextField = TextEditingController();
    passwordTextField1 = TextEditingController();
    passwordTextField2 = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerDispose();
    super.dispose();
  }

}

