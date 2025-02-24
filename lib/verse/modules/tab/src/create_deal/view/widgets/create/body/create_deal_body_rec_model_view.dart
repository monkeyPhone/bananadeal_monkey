import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodyRecModelView extends StatelessWidget {
  const CreateDealBodyRecModelView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BananaCreateDealBloc, BananaCreateDealState>(
        builder: (context, state) {
          List<String> selectAge(){
            switch(state.age)
            {
              case '성인':
                return ['최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰', '어르신들을 위한 효도폰'];
              case '어르신':
                return ['최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰', '어르신들을 위한 효도폰'];
              case '청소년':
                return ['최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰', '학생을 위한 공부폰', '어린 아이들을 위한 어린이폰'];
              case '어린이':
                return ['최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰', '학생을 위한 공부폰', '어린 아이들을 위한 어린이폰'];
              case '현역군인':
                return ['최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰'];
              default:
                return [];
            }
          }
          return BdRippleSelectBox(

              buttonList: List.generate(selectAge().length,
                      (index) => (selectAge()[index], '', (){
                    context.read<CreateDealManager>().changeCreateState( value: selectAge()[index], context: context);
                  })
              ),
              currentIndex: (selectAge().indexOf(state.recModel))
          );
        }
    );
  }
}