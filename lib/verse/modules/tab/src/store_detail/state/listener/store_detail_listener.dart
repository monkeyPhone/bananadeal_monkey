import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/store_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_option/banana_store_detail_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail_socket/banana_store_detail_socket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailListener extends StatelessWidget {
  const StoreDetailListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaStoreDetailOptionBloc, BananaStoreDetailOptionState>(
            listener: (context, state){
              if(state.isUpdate){
                context.read<BananaStoreDetailBloc>().add(
                    const StoreDetailGetInfo()
                );
                context.read<BananaStoreDetailOptionBloc>().add(
                    const ChangeState(value: false)
                );
              }

            },
          ),
          BlocListener<BananaStoreDetailSocketBloc, BananaStoreDetailSocketState>(
              listener: (context, state){
                if(state.isSend){
                  context.read<StoreDetailManager>().refreshButton(context);
                  context.read<StoreDetailManager>().refreshFloating(context);
                }
              }
          )
          // BlocListener<BananaStoreDetailDealBloc, BananaStoreDetailDealState>(
          //   listener: (context, state){
          //     if(state.myDeal.isNotEmpty){
          //       context.read<BananaStoreDetailDealBloc>().add(
          //           InitDealData2(
          //
          //               mIdx: context.read<BananaRouteCubit>().state.userVO.mIdx,
          //               lat: context.read<BananaRouteCubit>().state.userVO.mLatitude,
          //               lng: context.read<BananaRouteCubit>().state.userVO.mLongitude,
          //               smId: context.read<StoreDetailManager>().route.smId
          //           )
          //       );
          //     }
          //
          //   },
          // ),
        ],
        child: const SizedBox()
    );
  }
}