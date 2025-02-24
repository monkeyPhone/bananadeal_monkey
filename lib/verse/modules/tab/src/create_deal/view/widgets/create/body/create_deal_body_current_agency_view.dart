import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodyCurrentAgencyView extends StatelessWidget {
  const CreateDealBodyCurrentAgencyView({super.key});

  @override
  Widget build(BuildContext context) {
    List currentAgencyList = ['0', ['1','2','3','4','5','6','8','12','14'], ''];
    return BlocSelector<BananaCreateDealBloc, BananaCreateDealState, String>(
        selector: (state) => state.currentAgency,
        builder: (context, currentAgency) =>
            BdRippleSelectBox(
                buttonList: [
                  ('없어요','', (){
                    context.read<CreateDealManager>().changeCreateState(value: '0', context: context);
                  }),
                  (
                  context.read<CreateDealManager>().convertAgency(agency: currentAgency, isCurrent: true),
                  '', (){
                    // currentAgencyList.contains(currentAgency) ?
                    // context.read<CreateDealEvent>().changeCreateState(context: context, value: '') : null;
                    context.read<CreateDealManager>().showSheetEvent(
                      context: context,
                      isCurrent: true,
                    );
                    // context.read<CreateDealEvent>().changeCreateState(context: context, value: ageList1[1]);
                  }),
                ],
                currentIndex: !currentAgencyList.contains(currentAgency) ? 1 : currentAgencyList.indexOf(currentAgency)
            )
    );
  }
}