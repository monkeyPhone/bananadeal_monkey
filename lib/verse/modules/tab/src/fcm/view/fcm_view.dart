import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/repository/fcm_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/manager/fcm_alert_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/state/cubit/banana_alert_cubit/banana_alert_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/view/widgets/body/fcm_body_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FcmView extends StatelessWidget {
  final BuildContext routerContext;
  const FcmView({super.key,
    required this.routerContext
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<FcmAlertManager>(
            create: (BuildContext context) => FcmAlertManager(
              routerContext: routerContext,
            ),
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaAlertCubit>(
                  create: (BuildContext context) =>
                      BananaAlertCubit(
                          repository: routerContext.read<FcmRepositoryImpl>()
                      )
              ),
            ],
            child: const _Canvas()
        )
    );
  }
}


class _Canvas extends StatelessWidget {

  const _Canvas();

  @override
  Widget build(BuildContext context) {

    return const BdCanvas(
      canvasEnum: CanvasEnum.notification,
      appbar: ('수신함', null, null, _ActionButton()),
      body: FcmBodyView(),
      navNullAble: true,
    );
  }
}


class _ActionButton extends StatelessWidget {
  const _ActionButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaAlertCubit, BananaAlertState>(
        builder: (context, state) =>
        (state.currentIndex == 0 && state.notiDealDto.isNotEmpty) || (state.currentIndex == 1 && state.notiEtcDto.isNotEmpty)
            ?
            state.isEditMode
                ? BdRippleIconsButton(
                size: context.read<VerseConfig>().size,
                onTap: (){
                  context.read<FcmAlertManager>().changeEditMode(context);
                },
                icon: Icons.close,
                iconColor: bananaBack
            )
                :
        BdRippleIconsButton(
            size: context.read<VerseConfig>().size,
            onTap: (){
              context.read<FcmAlertManager>().showBottomSheeted(
                  context: context,
                  sheetList: [
                    BottomSheetVO(
                      buttonName: '알림 삭제',
                      onTap: (){
                        Navigator.pop(context);
                        context.read<FcmAlertManager>().changeEditMode(context);
                      },

                    )
                  ]
              );
            },
            icon: Icons.settings,
            iconColor: bananaBack
        )
            : const SizedBox()

    );
  }
}
