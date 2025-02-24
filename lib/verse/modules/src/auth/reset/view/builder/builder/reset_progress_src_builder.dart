import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/manager/reset_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/reset/state/bloc/banana_reset_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/auth/bd_auth_otp_email_form.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/auth/bd_auth_otp_otp_form.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/auth/bd_auth_otp_progress_ment_ui.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/auth/bd_auth_otp_pw_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetProgressSrcBuilder extends StatelessWidget {
  const ResetProgressSrcBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaResetBloc, BananaResetState>(
        builder: (context, state) =>
            Column(
              children: [
                BdAuthOtpProgressMentUi(progressEnum: state.otpProgressEnum),
                switch(state.otpProgressEnum){
                  OtpProgressEnum.email =>
                      BdAuthOtpEmailForm(
                          onPressed: (){
                            context.read<ResetManager>().sendEmail(context);
                          },
                          onChanged: context.read<ResetManager>().emailOnChanged(context),
                          validate: state.validate,
                          email: state.email,
                          isLoading: state.dataDto.statusEnum == StatusEnum.success || state.dataDto.statusEnum == StatusEnum.loading
                      ),
                  OtpProgressEnum.otp =>
                      BdAuthOtpOtpForm(
                        onPressed: (){
                          context.read<ResetManager>().changePw(context);
                        },
                        onChanged: context.read<ResetManager>().otpOnChanged(context,),
                        otp: state.otp,
                        isOtp: state.otp == state.originOtp,
                        isLoading: state.dataDto.statusEnum == StatusEnum.success || state.dataDto.statusEnum == StatusEnum.loading,
                        email: state.email,
                        functionInput: (){
                          context.read<ResetManager>().initialSendEmail(context);
                        },
                        count: context.read<ResetManager>().otpCount(context: context, count: state.count),
                        functionResend: (){
                          context.read<ResetManager>().resendEmail(context);
                        },
                      ),
                  _ =>
                      BdAuthOtpPwForm(
                        isLoading:
                        state.otpProgressEnum == OtpProgressEnum.finish,
                        lock1: state.lock1,
                        lock2: state.lock2,
                        validate: state.validate,
                        onChanged1: context.read<ResetManager>().pwOnChanged1(context: context, statePw1: state.pw1, statePw2: state.pw2),
                        lock1Function: () {
                          context.read<ResetManager>().fetchLock1(context);
                        },
                        onChanged2:  context.read<ResetManager>().pwOnChanged2(context: context, statePw1: state.pw1, statePw2: state.pw2),
                        lock2Function: () {
                          context.read<ResetManager>().fetchLock2(context);
                        },
                        pwFunction: () {
                          context.read<ResetManager>().finishReset(context);
                        },
                      )
                }
              ],)
    );
  }
}
