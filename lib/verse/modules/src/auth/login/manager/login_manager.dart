import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/auth/manager/auth_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/login/state/bloc/banana_login_form/banana_login_form_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/view/reset_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginManager {
  const LoginManager();

  ValueChanged<String> formSubmitEmail({
    required BuildContext context,
    required bool isDebounce,
  }) {
    return isDebounce
          ? context.read<VerseConfig>().function.debounceText((val){
      _validateEmail(context: context, email: val);
    })
          : (val){
      _validateEmail(context: context, email: val);
    };
  }

  ValueChanged<String> formSubmitPw({
    required BuildContext context,
    required bool isDebounce,
  }) {
    return isDebounce
        ? context.read<VerseConfig>().function.debounceText((val){
      _updatePwEvent(context: context, pw: val);
    })
        : (val){
      _updatePwEvent(context: context, pw: val);
    };
  }


  void postEmailLogin({
    required BuildContext context,
    required String email,
    required String pw
  }) => context.read<AuthManager>().postEmailLogin(context: context, email: email, pw: pw);


  void gotoOtp({
    required BuildContext context,
    required TextEditingController email,
    required TextEditingController pw,
  }) {
    email.clear();
    pw.clear();
    context.read<BananaLoginFormBloc>().add(const InitEmail());
    context.read<VerseConfig>().route.createRoute(
        context: context,
        connectCheck: true,
        routerWidget: ResetView(emailC: email, pwC: pw, routerContext: context),
      );
  }


  void successOtp({
    required BuildContext context,
    required TextEditingController emailC,
    required TextEditingController pwC,
    required String email,
    required String pw,
  }){
    emailC.text = email;
    pwC.text = pw;
    context.read<BananaLoginFormBloc>().add(SuccessOtp(email: email, pw: pw));
  }


  void snsLoginButton({
    required BuildContext context,
    required int index,
  }) => context.read<AuthManager>().snsLoginButton(context: context, index: index);


  void _validateEmail({
    required BuildContext context,
    required String email,
  }) => context.read<BananaLoginFormBloc>().add(ValidateEmailEvent(email: email));

  // void updateEmailEvent({
  //   required BuildContext context,
  //   required String email,
  // }) => context.read<BananaLoginFormBloc>().add(UpdateEmail(email: email));

  void _updatePwEvent({
    required BuildContext context,
    required String pw,
  }) =>
      context.read<BananaLoginFormBloc>().add(UpdatePwEvent(pw: pw));

  void updateLockEvent(BuildContext context) =>
      context.read<BananaLoginFormBloc>().add(const UpdateLockEvent());

}