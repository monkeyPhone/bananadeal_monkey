import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/action/chat_room_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/chat_room_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/socket/socket_api/model/socket_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/socket/socket_rest_api/model/socket_rest_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/model/action/store_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/model/store_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/invite/src/invite_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/socket_invite/src/socket_invite_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_finish/banana_create_deal_finish_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/manager/helper/invite_deal_manager_helper_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/manager/invite_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/state/bloc/banana_invite_deal_option/banana_invite_deal_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/state/bloc/banana_invite_deal_socket/banana_invite_deal_socket_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/step/invite_deal/state/bloc/banana_invite_deal_store/banana_invite_deal_store_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_sort_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/bd_loading_cont.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/store/bd_ui_store_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InviteDealView extends StatelessWidget {
  const InviteDealView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<StoreApiImpl>(
            create: (BuildContext context) =>
             const StoreApiImpl(
                action: StoreAction(),
            )
        ),
        RepositoryProvider<InviteRepositoryImpl>(
            create: (BuildContext context) =>
                InviteRepositoryImpl(
                    storeApi: context.read<StoreApiImpl>(),
                    dio: context.read<VerseConfig>().dio
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
        RepositoryProvider<InviteDealManager>(
            create: (BuildContext context) => const InviteDealManager(
                bloc: InviteDealManagerHelperBloc(),

            )
        )
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaInviteDealStoreBloc>(
                create: (BuildContext context) => BananaInviteDealStoreBloc(
                  repository: context.read<InviteRepositoryImpl>()
                )..add(const StoreInitData())
            ),
            BlocProvider<BananaInviteDealOptionBloc>(
                create: (BuildContext context) => BananaInviteDealOptionBloc(
                  repository: context.read<InviteRepositoryImpl>()
                )..add(const GetStoreLength())
            ),
            BlocProvider<BananaInviteDealSocketBloc>(
              create: (BuildContext context) => BananaInviteDealSocketBloc(
                repository: context.read<SocketInviteRepositoryImpl>()
              ),
            )
          ],
          child: const _Canvas()
      ),
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.inviteDeal,
      appbar: ('매장 초대하기', null, null, _Action()),
      body: _Body(),
      navbarWidget: _Navbar(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaInviteDealStoreBloc, BananaInviteDealStoreState, StatusEnum>(
      selector: (state) => state.statusEnum,
      builder: (context, status) =>
        switch(status){
          StatusEnum.initial => const BdLoadingSpin(),
          StatusEnum.success || StatusEnum.loading || StatusEnum.failure => Stack(
            children: [
              _Success(
                status: status,
              ),
              _Loading(statusEnum: status)
            ],
          ),
          _ => BdRefreshButton(
            onTap: (){
              context.read<InviteDealManager>().bloc.refreshInvite(context);
            },
          )
        },
    );
  }
}

class _Loading extends StatelessWidget {
  final StatusEnum statusEnum;
  const _Loading({
    required this.statusEnum,
  });

  @override
  Widget build(BuildContext context) {
    return statusEnum == StatusEnum.loading
        ? const BdLoadingCont()
        : const SizedBox();
  }
}


class _Action extends StatelessWidget {
  const _Action();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BlocSelector<BananaInviteDealStoreBloc, BananaInviteDealStoreState, List<StoreVO>>(
          selector: (state) => state.storeList,
          builder: (context, storeList) =>
              BlocBuilder<BananaInviteDealOptionBloc, BananaInviteDealOptionState>(
                builder: (context, state) =>
                    switch(state.statusEnum){
                      StatusEnum.success =>
                          Row(
                            children: [
                              BdTextWidget(text: '${state.isAll ? state.storeLength : state.selectList.length} / ${state.storeLength}', textStyle: sub,),
                              SizedBox(
                                height: size.sizedBox37,
                                child: BdRippleSortButton(
                                    margin: EdgeInsets.only(left: size.sized16grid,),
                                    padding: EdgeInsets.symmetric(horizontal: size.sizedBox10),
                                    size: size,
                                    text: '전체선택',
                                    isSort: state.isAll,
                                    onTap: (){
                                      context.read<InviteDealManager>().bloc.clickSortButton(context: context, value: state.isAll ? false : true,
                                          valueList: state.isAll ? [] : storeList
                                      );
                                    }
                                ),
                              ),
                            ],
                          ),
                      StatusEnum.later => const SizedBox(),
                      StatusEnum.initial => const SizedBox(),
                      _ => BdRefreshButton(
                        onTap: (){
                          context.read<InviteDealManager>().bloc.refreshAction(context);
                        },
                      )
                    }
              ),
        ),
        const BdCustomPad(padEnum: PadEnum.width8)
      ],
    );
    }
  }



class _Success extends StatelessWidget {
  final StatusEnum status;
  const _Success({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          const _ListProvider(),
          status == StatusEnum.loading
              ? const BdLoadingCont()
              : const SizedBox()
        ]
    );
  }
}

class _ListProvider extends StatelessWidget {
  const _ListProvider();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaInviteDealOptionBloc, BananaInviteDealOptionState, int>(
      selector: (state) => state.storeLength,
      builder: (context, storeLength) => BlocSelector<BananaInviteDealOptionBloc, BananaInviteDealOptionState, bool>(
          selector: (state) => state.isUpdate,
          builder: (context, isUpdate) =>
              BlocSelector<BananaInviteDealOptionBloc, BananaInviteDealOptionState, int>(
                  selector: (state) => state.page,
                  builder: (context, page) =>
                      _List(
                        page: page,
                        isUpdate: isUpdate,
                        storeLength: storeLength,
                      )
              )
      ),
    );
  }
}




class _List extends StatefulWidget {
  final int page;
  final int storeLength;
  final bool isUpdate;
  const _List({
    required this.page,
    required this.storeLength,
    required this.isUpdate
  });

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  late final ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _controller.addListener(() async{
      if(_controller.position.maxScrollExtent == _controller.position.pixels){
        if(widget.isUpdate){
          bool isUpdate = ((widget.page+1)*20) < widget.storeLength;
          context.read<InviteDealManager>().bloc.successUpdate(context: context, page: isUpdate ? widget.page+1 : widget.page, isUpdate: isUpdate);
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaInviteDealStoreBloc, BananaInviteDealStoreState, List<StoreVO>>(
      selector: (state) => state.storeList,
      builder: (context, storeList) =>
          Scrollbar(
            thumbVisibility: true,
            controller: _controller,
            child: BdRefreshIndicator(
              onRefresh: () async{
                context.read<InviteDealManager>().bloc.refreshInvite(context);
              },
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: size.sized16grid
                ),
                controller: _controller,
                itemCount: storeList.length,
                itemBuilder: (BuildContext context, int index) =>
                    BlocSelector<BananaInviteDealOptionBloc, BananaInviteDealOptionState, bool>(
                      selector: (state) => state.isAll,
                      builder: (context, isAll) =>
                          BlocSelector<BananaInviteDealOptionBloc, BananaInviteDealOptionState, List<StoreVO>>(
                            selector: (state) => state.selectList,
                            builder: (context, selectList) =>
                                BdUiStoreListTile(
                                  padding: EdgeInsets.only(
                                      left: size.sized4grid,
                                      right: size.sized4grid
                                  ),
                                  isStatus: false,
                                  onTapF: (){},
                                  key: ValueKey('${storeList[index].smMId}_$index'),
                                  storeVO: storeList[index],
                                  size: size,
                                  isCheck: selectList.contains(storeList[index]),
                                  onTap: (){
                                    context.read<InviteDealManager>().bloc.clickStoreButton(
                                        context: context,
                                        isAll: isAll,
                                        value: storeList[index]
                                    );
                                  },
                                ),
                          ),
                    ),

                // InviteDealBodyListTileView(
                //   key: ValueKey(index),
                // )
              ),
            ),
          ),
    );
  }
}


class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaCreateDealFinishBloc, BananaCreateDealFinishState, int>(
        selector: (state) => state.diIdx,
        builder: (context, diIdx) =>
            BlocBuilder<BananaInviteDealOptionBloc, BananaInviteDealOptionState>(
                builder: (context, state) =>
                    BdNeoButton(
                      fontSize: context.read<VerseConfig>().size.titleLittle,
                      onPressed: () {
                        context.read<InviteDealManager>().bloc.sendRequest(
                        context: context,
                            isAll: state.isAll,
                            diIdx: diIdx,
                            selectList: state.isAll ? [] : state.selectList
                        );
                      }, text: '견적 요청', size: context.read<VerseConfig>().size,)
            )
    );
  }
}