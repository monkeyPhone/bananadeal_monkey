import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodyRecRateView extends StatelessWidget {
  const CreateDealBodyRecRateView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocSelector<BananaCreateDealBloc, BananaCreateDealState, String>(
        selector: (state) => state.recRate,
        builder: (context, recRate) {
          List<String> joinerRateRecList =
          [
            '8만원 이상의 사용량 무제한 요금제', '7만원대의 사용량이 많은 요금제', '5~6만원 대의 기본 요금제', '5만원 미만의 저렴한 요금제'
          ];

          return BdRippleSelectBox(
              buttonList: List.generate(joinerRateRecList.length,
                      (index) => (joinerRateRecList[index], '', (){
                    context.read<CreateDealManager>().changeCreateState(value: joinerRateRecList[index], context: context);
                  })
              ),
              currentIndex: (joinerRateRecList.indexOf(recRate))
          );
        }
    );
  }
}