import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/manager/login_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/state/bloc/banana_reset_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetManager {
  final TextEditingController emailC;
  final TextEditingController pwC;
  final BuildContext routerContext;
  const ResetManager({
    required this.emailC,
    required this.pwC,
    required this.routerContext
  });

  void backSpace(BuildContext context){
    if (MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0) {
      FocusScope.of(context).unfocus();
    } else {
      context.read<VerseConfig>().browser.dialog.customDialog(
          routerContext: context,
          barrierDismissible: true,
          captionText: '',
          mainText: '비밀번호 재발급을 종료하시겠습니까?',
          cancelText: '취소',
          confirmText: '종료',
          cancelOnTap: (){
            context.read<VerseConfig>().route.closeDialog(context);
          },
          conFirmOnTap: () {
            context.read<VerseConfig>().route.closeDialog(context);
            context.read<VerseConfig>().route.closePage(context);
          }
      );
    }
  }

  void listenerCaseError({
    required BuildContext context,
    required String text,
  }){
    context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: text);
  }

  void sendEmail(BuildContext context) =>
      context.read<BananaResetBloc>().add(const SendEmail());

  ValueChanged<String> emailOnChanged(BuildContext context) => (val){
    _fetchValidate(context: context, val: val);
  };


  void _fetchValidate({
    required BuildContext context,
    required String val,
  }) => context.read<BananaResetBloc>().add(
      FetchEmailValidate(
          email: val,
          validate: context.read<VerseConfig>().function.validationEmail(val)
      )
  );

  String otpCount({
    required BuildContext context,
    required int count,
  }) => context.read<VerseConfig>().function.formatOtpTime(count);

  ValueChanged<String> otpOnChanged (BuildContext context) => (val){
    _fetchOtp(context: context, otp: val);
  };


  void _fetchOtp({
    required BuildContext context,
    required String otp,
  }) => context.read<BananaResetBloc>().add(FetchOtp(otp: otp));


  void initialSendEmail(BuildContext context) =>
      context.read<BananaResetBloc>().add(const InitialSendEmail());

  void resendEmail(BuildContext context) =>
      context.read<BananaResetBloc>().add(const ResendEmail());

  void changePw(BuildContext context) =>
      context.read<BananaResetBloc>().add(const ChangePw());

  ValueChanged<String> pwOnChanged1 ({
    required BuildContext context,
    required String statePw1,
    required String statePw2,
  }) => (val){
    _fetchPw1(context: context, pw: val, validate: context.read<VerseConfig>().function.validatePw(val, statePw2));
  };


  void _fetchPw1({
    required BuildContext context,
    required String pw,
    required String validate,
  }) => context.read<BananaResetBloc>().add(FetchPw1(pw1: pw, validate: validate));


  ValueChanged<String> pwOnChanged2 ({
    required BuildContext context,
    required String statePw1,
    required String statePw2,
  }) => (val){
    _fetchPw2(context: context, pw: val, validate: context.read<VerseConfig>().function.validatePw(statePw1, val));
  };


  void _fetchPw2({
    required BuildContext context,
    required String pw,
    required String validate,
  }) => context.read<BananaResetBloc>().add(FetchPw2(pw2: pw, validate: validate));


  void fetchLock1(BuildContext context) =>
      context.read<BananaResetBloc>().add(const FetchLock1());

  void fetchLock2(BuildContext context) =>
      context.read<BananaResetBloc>().add(const FetchLock2());

  void finishReset(BuildContext context) =>
      context.read<BananaResetBloc>().add(const FinishReset());


  void listenerFinish({
    required BuildContext context,
    required String email,
    required String pw,
  }) {
    routerContext.read<LoginManager>().successOtp(
        context: routerContext,
        emailC: emailC, pwC: pwC,
        email: email,
        pw: pw
    );
    context.read<VerseConfig>().route.closePage(context);
  }

}