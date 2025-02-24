import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodyAgeView extends StatelessWidget {
  const CreateDealBodyAgeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ageList1 = ['성인', '어르신', '청소년', '어린이', '현역군인'];
    List<String> ageList2 = ['(만 19세 이상)', '(만 65세 이상)', '(만 18세 이하)', '(만 12세 이하)', '(의무복무 중인 현역 병사)'];

    return BlocSelector<BananaCreateDealBloc, BananaCreateDealState, String>(
        selector: (state) => state.age,
        builder: (context, age) =>
            BdRippleSelectBox(
                buttonList: [
                  (ageList1[0], ageList2[0], (){
                    context.read<CreateDealManager>().changeCreateState(value: ageList1[0], context: context);
                  }),
                  (ageList1[1], ageList2[1], (){
                    context.read<CreateDealManager>().changeCreateState(value: ageList1[1], context: context);
                  }),
                  (ageList1[2], ageList2[2], (){
                    context.read<CreateDealManager>().changeCreateState(value: ageList1[2], context: context);
                  }),
                  (ageList1[3], ageList2[3], (){
                    context.read<CreateDealManager>().changeCreateState(value: ageList1[3], context: context);
                  }),
                  (ageList1[4], ageList2[4], (){
                    context.read<CreateDealManager>().changeCreateState(value: ageList1[4], context: context);
                  }),
                ],
                currentIndex: ageList1.indexOf(age)
            )
    );
  }
}