import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/state/bloc/banana_sign/banana_sign_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignManager {
  const SignManager();

  void listenerCaseError({
    required BuildContext context,
    required String text,
  }){
    context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: text);
  }

  void sendEmail(BuildContext context) =>
    context.read<BananaSignBloc>().add(const SendEmail());

  ValueChanged<String> emailOnChanged(BuildContext context) => (val){
    _fetchValidate(context: context, val: val);
  };


  void _fetchValidate({
    required BuildContext context,
    required String val,
  }) => context.read<BananaSignBloc>().add(
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
  }) => context.read<BananaSignBloc>().add(FetchOtp(otp: otp));


  void initialSendEmail(BuildContext context) =>
      context.read<BananaSignBloc>().add(const InitialSendEmail());

  void resendEmail(BuildContext context) =>
      context.read<BananaSignBloc>().add(const ResendEmail());

  void changePw(BuildContext context) =>
      context.read<BananaSignBloc>().add(const ChangePw());

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
  }) => context.read<BananaSignBloc>().add(FetchPw1(pw1: pw, validate: validate));


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
  }) => context.read<BananaSignBloc>().add(FetchPw2(pw2: pw, validate: validate));


  void fetchLock1(BuildContext context) =>
      context.read<BananaSignBloc>().add(const FetchLock1());

  void fetchLock2(BuildContext context) =>
      context.read<BananaSignBloc>().add(const FetchLock2());

  void finishSign(BuildContext context) =>
      context.read<BananaSignBloc>().add(const FinishSign());

}