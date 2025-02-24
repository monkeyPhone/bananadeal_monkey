import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_nav/banana_broad_nav_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/chat/state/bloc/banana_chat_room/banana_chat_room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListener extends StatelessWidget {
  const ChatListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaBroadNavBloc, BananaBroadNavState>(
              listener:  (context, state){
                if(state.currentPage == NavEnum.chat){
                  // if(context.read<StoreManager>().storeController(context).hasClients){
                  //   context.read<StoreManager>().storeController(context).jumpTo(0.0);
                  // }
                  context.read<BananaChatRoomBloc>().add(
                      const ReloadRoom()
                  );
                }
              }
          ),
          // BlocListener<BananaStoreOptionBloc, BananaStoreOptionState>(
          //     listenWhen: (previous, current) => previous.currentSort != current.currentSort,
          //     listener: (context, state){
          //       context.read<BananaStoreBloc>().add(FetchStore(
          //           currentSort: state.currentSort,
          //           option: (
          //             state.page,
          //             state.order,
          //             state.orderBy
          //           )
          //       ));
          //     }
          // ),
          // BlocListener<BananaStoreBloc, BananaStoreState>(
          //     listener: (context, state) {
          //       if(state.statusEnum == StatusEnum.loading){
          //         context.read<StoreManager>().updateAllShow(context);
          //       }
          //     }
          // )
          // BlocListener<BananaStoreDioBloc, BananaStoreDioState>(
          //     listener: (context, state) {
          //       if(state.data.data.isNotEmpty){
          //         // context.read<BananaStoreBloc>().add(FetchStore(currentSort: option.currentSort, entityList: convertStoreEntity(state.data.data)));
          //         // context.read<BananaStoreDioBloc>().add(const InitStoreData());
          //
          //       }
          //     }
          // ),

        ],
        child: const SizedBox()
    );
  }
}