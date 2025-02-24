import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodySelectModelView extends StatelessWidget {
  const CreateDealBodySelectModelView({super.key});

  @override
  Widget build(BuildContext context) {
    List selectModelList = ['0', ['select'], ''];
    return BlocBuilder<BananaCreateDealBloc, BananaCreateDealState>(
        builder: (context, state) =>
            BdRippleSelectBox(
                buttonList: [
                  ('단말기를 추천해주세요.','(효도폰, 학생폰 등)', (){
                    context.read<CreateDealManager>().initModel(context);
                    context.read<CreateDealManager>().changeCreateStateModel(value: ('0', '', '', ''), context: context);
                  }),
                  (
                  selectModelList.contains(state.selectModel.$1) ? '단말기를 직접 선택할래요.' : state.selectModel.$2,
                  '', (){
                    // selectModelList.contains(state.dealState.selectModel) ?
                    // context.read<CreateDealEvent>().changeCreateState(context: context, value: '') :null;
                    context.read<CreateDealManager>().gotoSelectModel(
                        tkIdx: state.requestAgency,
                        context: context
                    );
                    // context.read<CreateDealEvent>().changeCreateState(context: context, value: ageList1[1]);
                  }),
                ],
                currentIndex: !selectModelList.contains(state.selectModel.$1) ? 1 : selectModelList.indexOf(state.selectModel.$1)
            )
    );
  }
}
