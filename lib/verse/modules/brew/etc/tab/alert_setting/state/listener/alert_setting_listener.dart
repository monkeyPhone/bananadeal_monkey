import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/alert_setting/state/bloc/banana_alert_setting/banana_alert_setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertSettingListener extends StatelessWidget {
  const AlertSettingListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BananaAlertSettingBloc, BananaAlertSettingState>(
        listener: (context, state) {
          if(state.statusEnum != StatusEnum.initial){
            if(state.statusEnum == StatusEnum.success){
              context.read<VerseConfig>().route.updateInfo(context);
              context.read<BananaAlertSettingBloc>().add(const InitSetting());
            }
            else{
              context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '잠시 후, 다시 시도해주세요.');
            }
          }
        },
        child: const SizedBox(),
    );
  }
}
