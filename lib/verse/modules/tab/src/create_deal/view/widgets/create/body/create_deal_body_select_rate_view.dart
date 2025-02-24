import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodySelectRateView extends StatelessWidget {
  const CreateDealBodySelectRateView({super.key});

  @override
  Widget build(BuildContext context) {
    List selectRateList = ['0', ['select'], ''];
    return BlocBuilder<BananaCreateDealBloc, BananaCreateDealState>(
        builder: (context, state) =>
            BdRippleSelectBox(
                buttonList: [
                  ('요금제를 추천해주세요.', '', (){
                    // context.read<CreateDealEvent>().initModel(context);
                    context.read<CreateDealManager>().changeCreateState2(value: (0, '0'), context: context);
                  }),
                  (
                  selectRateList.contains(state.selectRate.$2) ? '요금제를 직접 선택할래요.' : state.selectRate.$2,
                  '', (){

                    context.read<CreateDealManager>().gotoRateListView(
                      tkIdx: state.requestAgency,
                      psIdx: state.selectModel.$1 == '0' ? '' :  state.selectModel.$1, context: context,
                    );

                  }),
                ],
                currentIndex: !selectRateList.contains(state.selectRate.$2) ? 1 : selectRateList.indexOf(state.selectRate.$2)
            )
    );

    //   Builder(
    //     builder: (BuildContext context){
    //       final initState = context.watch<BananaCreateDealInitBloc>().state;
    //       final dealState = context.watch<BananaCreateDealBloc>().state;
    //       return     ;
    //     }
    // );
  }
}