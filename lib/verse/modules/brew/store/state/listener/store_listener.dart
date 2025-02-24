import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_nav/banana_broad_nav_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/manager/store_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store/banana_store_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/store/state/bloc/banana_store_option/banana_store_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreListener extends StatelessWidget {
  const StoreListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaRouteCubit, BananaRouteState>(
              listener:  (context, state){
                context.read<StoreManager>().refreshButton(context: context);
              }
          ),
          BlocListener<BananaBroadNavBloc, BananaBroadNavState>(
              listener:  (context, state){
                if(state.currentPage == NavEnum.store){
                  if(context.read<StoreManager>().storeController(context).hasClients){
                    context.read<StoreManager>().storeController(context).jumpTo(0.0);
                  }
                  context.read<BananaStoreOptionBloc>().add(const ChangeOption(0));
                  context.read<BananaStoreBloc>().add(const FirstData());
                }
              }
          ),
          BlocListener<BananaStoreOptionBloc, BananaStoreOptionState>(
              listenWhen: (previous, current) => previous.currentSort != current.currentSort,
              listener: (context, state){
                context.read<BananaStoreBloc>().add(FetchStore(
                    currentSort: state.currentSort,
                    option: (
                    state.page,
                    state.order,
                    state.orderBy
                    )
                ));
              }
          ),
          BlocListener<BananaStoreBloc, BananaStoreState>(
              listener: (context, state) {
                if(state.statusEnum == StatusEnum.loading){
                  context.read<StoreManager>().updateAllShow(context);
                }
              }
          )
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
