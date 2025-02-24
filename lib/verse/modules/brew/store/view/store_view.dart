import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/model/action/store_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/model/store_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store/src/store_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/manager/store_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store/banana_store_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store_option/banana_store_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/listener/store_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/view/widgets/body/store_body_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_state_text_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<StoreApiImpl>(
              create: (BuildContext context) =>
                  const StoreApiImpl(action: StoreAction())
          ),
          RepositoryProvider<StoreRepositoryImpl>(
              create: (BuildContext context) =>
                  StoreRepositoryImpl(
                      api: context.read<StoreApiImpl>(),
                      dio: context.read<VerseConfig>().dio
                  )
          ),
          RepositoryProvider<StoreManager>(
              create: (BuildContext context) =>
                  const StoreManager()
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaStoreOptionBloc>(
                create: (BuildContext context) =>
                    BananaStoreOptionBloc()..add(const InitOption())
            ),

            BlocProvider<BananaStoreBloc>(
                create: (BuildContext context) =>
                BananaStoreBloc(
                    repository: context.read<StoreRepositoryImpl>()
                )..add(const FirstData())
            )
          ],
          child: const _Canvas(),
        )
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
        isPage: true,
        canvasEnum: CanvasEnum.homeCom,
        appbar: ('동네매장', null, null, _Action()),
        listener:  StoreListener(),
        navNullAble: true,
        body: StoreBodyView()
    );
  }
}


class _Action extends StatelessWidget {
  const _Action();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // RippleIconsButton(
        //   widgetSize: context.read<SizeConfig>().widgetSize,
        //   onTap: (){},
        //   icon: CupertinoIcons.search,
        // ),
        // const CustomPad(padEnum: PadEnum.width8),
        // const LocationButton(isHome: false,),
        // const CustomPad(padEnum: PadEnum.width12),
        BdRippleIconsButton(
          size: context.read<VerseConfig>().size,
          onTap: (){
            context.read<StoreManager>().gotoStoreSearchView(context);
          },
          icon: CupertinoIcons.search,
        ),
        const BdCustomPad(padEnum: PadEnum.width12),
        const BdUiStateTextAppbar(),
        const BdCustomPad(padEnum: PadEnum.specialAddress),
      ],
    );
  }
}
