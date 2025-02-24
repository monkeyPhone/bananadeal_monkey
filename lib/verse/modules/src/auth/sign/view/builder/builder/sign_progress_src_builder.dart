import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/manager/sign_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/state/bloc/banana_sign/banana_sign_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/sign/view/builder/listener/sign_bloc_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/auth/bd_auth_otp_email_form.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/auth/bd_auth_otp_otp_form.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/auth/bd_auth_otp_progress_ment_ui.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/auth/bd_auth_otp_pw_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignProgressSrcBuilder extends StatelessWidget {
  const SignProgressSrcBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaSignBloc, BananaSignState>(
        builder: (context, state) =>
            Column(
              children: [
                const SignBlocListener(),
                BdAuthOtpProgressMentUi(progressEnum: state.otpProgressEnum),
                switch(state.otpProgressEnum){
                  OtpProgressEnum.email =>
                      BdAuthOtpEmailForm(
                          onPressed: (){
                            context.read<SignManager>().sendEmail(context);
                          },
                          onChanged: context.read<SignManager>().emailOnChanged(context),
                          validate: state.validate,
                          email: state.email,
                          isLoading: state.dataDto.statusEnum == StatusEnum.success || state.dataDto.statusEnum == StatusEnum.loading
                      ),
                  OtpProgressEnum.otp =>
                    BdAuthOtpOtpForm(
                        onPressed: (){
                          context.read<SignManager>().changePw(context);
                        },
                        onChanged: context.read<SignManager>().otpOnChanged(context,),
                        otp: state.otp,
                        isOtp: state.otp == state.originOtp,
                        isLoading: state.dataDto.statusEnum == StatusEnum.success || state.dataDto.statusEnum == StatusEnum.loading,
                        email: state.email,
                        functionInput: (){
                          context.read<SignManager>().initialSendEmail(context);
                        },
                        count: context.read<SignManager>().otpCount(context: context, count: state.count),
                        functionResend: (){
                          context.read<SignManager>().resendEmail(context);
                        },
                    ),
                  _ =>
                    BdAuthOtpPwForm(
                      isLoading:
                        state.otpProgressEnum == OtpProgressEnum.finish,
                      lock1: state.lock1,
                      lock2: state.lock2,
                      validate: state.validate,
                      onChanged1: context.read<SignManager>().pwOnChanged1(context: context, statePw1: state.pw1, statePw2: state.pw2),
                      lock1Function: () {
                        context.read<SignManager>().fetchLock1(context);
                      },
                      onChanged2:  context.read<SignManager>().pwOnChanged2(context: context, statePw1: state.pw1, statePw2: state.pw2),
                      lock2Function: () {
                        context.read<SignManager>().fetchLock2(context);
                      },
                      pwFunction: () {
                        context.read<SignManager>().finishSign(context);
                      },
                    )
                }
              ],
            )
    );
  }
}
