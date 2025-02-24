import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/model/chat_connect_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/action/chat_room_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/chat_room_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal/model/action/deal_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal/model/deal_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/socket/socket_api/model/socket_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/socket/socket_rest_api/model/socket_rest_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/model/action/store_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/model/store_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_detail/model/action/store_detail_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_detail/model/store_detail_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/socket_invite/src/socket_invite_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail/src/helper/store_detail_caculate.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail/src/store_detail_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/helper/store_detail_manager_helper_logic.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/helper/store_detail_manager_helper_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/store_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_deal/banana_store_detail_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_option/banana_store_detail_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_socket/banana_store_detail_socket_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/listener/store_detail_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/widgets/store_detail_body_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/floating/bd_floating_action_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailView extends StatelessWidget {
  final BuildContext routerContext;
  final String smId;
  final String storeName;
  final int mIdx;
  final bool isBookmark;
  final bool isStore;
  final bool isSearch;
  const StoreDetailView({super.key,
    required this.routerContext,
    required this.smId,
    required this.storeName,
    required this.mIdx,
    required this.isBookmark,
    required this.isStore,
    required this.isSearch
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<StoreDetailApiImpl>(
              create: (BuildContext context) => const StoreDetailApiImpl(
                  action: StoreDetailAction()
              )
          ),
          RepositoryProvider<StoreApiImpl>(
              create: (BuildContext context) => const StoreApiImpl(
                  action: StoreAction()
              )
          ),
          RepositoryProvider<DealApiImpl>(
              create: (BuildContext context) => const DealApiImpl(
                  action: DealAction()
              )
          ),
          RepositoryProvider<StoreDetailRepositoryImpl>(
              create: (BuildContext context) =>
                  StoreDetailRepositoryImpl(
                      dealApi: context.read<DealApiImpl>(),
                      dio: context.read<VerseConfig>().dio,
                      function: context.read<VerseConfig>().function,
                      calculate: const StoreDetailCalculate(),
                      api: context.read<StoreDetailApiImpl>(),
                      storeApi: context.read<StoreApiImpl>(),
                      chatConnectApi: context.read<ChatConnectApiImpl>(),
                      mIdx: mIdx,
                      smId: smId

                  )
          ),
          RepositoryProvider<ChatRoomApiImpl>(
              create: (BuildContext context) =>
              const ChatRoomApiImpl(
                  action: ChatRoomAction()
              )
          ),

          RepositoryProvider<SocketRestApiImpl>(
              create: (BuildContext context) =>
              const SocketRestApiImpl()
          ),

          RepositoryProvider<SocketApiImpl>(
              create: (BuildContext context) =>
              const SocketApiImpl()
          ),

          RepositoryProvider<SocketInviteRepositoryImpl>(
            create: (BuildContext context) => SocketInviteRepositoryImpl(
              dio: context.read<VerseConfig>().dio,
              chatRoomApi: context.read<ChatRoomApiImpl>(),
              socketRestApi: context.read<SocketRestApiImpl>(),
              socketApi: context.read<SocketApiImpl>(),
              url: context.read<VerseConfig>().url,
              mName: context.read<BananaRouteCubit>().state.userVO.mName,
              mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,

            ),
          ),
          RepositoryProvider<StoreDetailManager>(
              create: (BuildContext context) =>
                  StoreDetailManager(
                    route: StoreDetailManagerHelperRoute(
                        routerContext: routerContext,
                        isBookmark: isBookmark,
                        smId: smId, storeName: storeName, mIdx: mIdx,
                        isStore: isStore,
                        isSearch: isSearch
                    ),
                    logic: StoreDetailManagerHelperLogic(
                        smId: smId,
                        mIdx: mIdx,
                      isStore: isStore
                    ),
                  )
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaStoreDetailBloc>(
                create: (BuildContext context) =>
                BananaStoreDetailBloc(
                    repository: context.read<StoreDetailRepositoryImpl>()
                )..add(const StoreDetailGetInfo())
            ),
            BlocProvider<BananaStoreDetailOptionBloc>(
                create: (BuildContext context) =>
                    BananaStoreDetailOptionBloc()..add(const InitDetailOption())
            ),
            BlocProvider<BananaStoreDetailDealBloc>(
                create: (BuildContext context) =>
                BananaStoreDetailDealBloc(
                  repository: context.read<StoreDetailRepositoryImpl>()
                )..add(const InitDealData())
            ),
            BlocProvider<BananaStoreDetailSocketBloc>(
                create: (BuildContext context) =>
                    BananaStoreDetailSocketBloc(
                    repository: context.read<SocketInviteRepositoryImpl>()
                )
            ),
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
        listener: StoreDetailListener(),
        canvasEnum: CanvasEnum.storeDetail,
        body: _Body(),
        floatingActionButton: _Floating(),
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaStoreDetailBloc, BananaStoreDetailState, StatusEnum>(
        selector: (state) => state.statusEnum,
        builder: (context, statusEnum) =>
        switch(statusEnum){
          StatusEnum.initial => const BdLoadingSpin(),
          StatusEnum.loading => const BdLoadingSpin(),
          StatusEnum.success => const StoreDetailBodyView(),
          _ => BdRefreshButton(
            onTap: () {
              context.read<StoreDetailManager>().refreshButton(context);
            },
          )
        }
    );
  }
}

class _Floating extends StatelessWidget {
  const _Floating();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaStoreDetailBloc, BananaStoreDetailState, StoreDetailVO>(
        selector: (state) => state.detailVO,
        builder: (context, detail) =>
        detail.isDealing == 0
            ?  BlocBuilder<BananaStoreDetailDealBloc, BananaStoreDetailDealState>(
                builder: (context, state) =>
                switch(state.statusEnum){
                  StatusEnum.initial =>
                  const SizedBox(),
                  StatusEnum.success =>
                  state.myDeal.isNotEmpty
                      ? BdFloatingActionButton(
                      onPressed: (){
                        context.read<StoreDetailManager>().clickFloatingSrcSendInvite(context: context, diIdx: state.myDeal.first.diIdx);
                        }, iconData: Icons.outgoing_mail)
                      : BdFloatingActionButton(
                      onPressed: (){
                        context.read<StoreDetailManager>().route.clickFloatingSrcNull(context);
                        },
                      iconData: Icons.sell),
                  _ =>  BdFloatingActionButton(onPressed: (){
                    context.read<StoreDetailManager>().refreshFloating(context);
                    }, iconData: Icons.refresh),
                },
        )
            : const SizedBox()
    );
  }
}
