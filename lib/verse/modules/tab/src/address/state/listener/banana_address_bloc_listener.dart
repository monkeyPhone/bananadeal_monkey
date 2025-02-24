import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/manager/address_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/state/bloc/banana_address_bloc/banana_address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BananaAddressBlocListener extends StatelessWidget {
  const BananaAddressBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaAddressBloc, BananaAddressState>(
            listener: (context, state){
              if(state.addressSearch.results.common.errorMessage == '서버 에러'){
                context.read<AddressManager>().initAddress(context);
                context.read<AddressManager>().showSnackBar(text: '잠시 후 다시 시도해주세요.', context: context);
              }
            },
          )
        ],
        child: const SizedBox()
    );
  }
}