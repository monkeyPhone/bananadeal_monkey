import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/state/cubit/banana_alert_cubit/banana_alert_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/view/widgets/body/edit_mode/fcm_body_edit_mode_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/view/widgets/body/tab/fcm_body_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FcmBodyView extends StatelessWidget {
  const FcmBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaAlertCubit, BananaAlertState>(
        builder: (context, state) =>
        state.isEditMode
            ?
        FcmBodyEditModeView(
          notiDto: state.currentIndex == 0 ? state.notiDealDto : state.notiEtcDto,
        )
            :
        FcmBodyTabView(
          initialIndex: state.currentIndex,
        )
    );
  }
}
