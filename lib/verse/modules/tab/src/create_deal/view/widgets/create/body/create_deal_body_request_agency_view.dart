import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodyRequestAgencyView extends StatelessWidget {
  const CreateDealBodyRequestAgencyView({super.key});

  @override
  Widget build(BuildContext context) {
    List currentAgencyList = ['0', ['1','2','3','4','5','6','8','12','14'], ''];
    return BlocBuilder<BananaCreateDealBloc, BananaCreateDealState>(
        builder: (context, state) =>
            BdRippleSelectBox(
                buttonList: [
                  ('상관없어요','', (){
                    // context.read<CreateDealEvent>().initModel(context);
                    context.read<CreateDealManager>().changeCreateState(value: '0', context: context);
                    context.read<CreateDealManager>().showSnackBar(
                        text: '선택하신 단말기에 따라 제안 받는 통신사가 달라질 수 있습니다.', context: context
                    );
                  }),
                  (
                  context.read<CreateDealManager>().convertAgency(agency: state.requestAgency, isCurrent: false),
                  '',
                      () async{

                    if(state.selectModel.$2 == ''){
                      context.read<CreateDealManager>().showSheetEvent(
                        context: context,
                        isCurrent: true,
                      );
                    } else{
                      context.read<CreateDealManager>().showSheetEvent(
                        context: context,
                        isCurrent: false,
                      );
                    }
                    // context.read<CreateDealEvent>().changeCreateState(context: context, value: ageList1[1]);
                  }),
                ],
                currentIndex: !currentAgencyList.contains(state.requestAgency) ? 1 : currentAgencyList.indexOf(state.requestAgency)
            )
    );
  }
}
