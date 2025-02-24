import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_finish/banana_create_deal_finish_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_indexed_stack_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CreateDealCreateNavView extends StatelessWidget {
  const CreateDealCreateNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaCreateDealBloc, BananaCreateDealState>(
      builder: (context, state) =>
          BdUiIndexedStackAnimated(
            index: state.step.index,
            children: [
              _ButtonSrc(
                  step: StepEnum.age,
                  limit: state.age == '',
                  onTap: (){}
              ),
              _ButtonSrc(
                  step: StepEnum.currentAgency,
                  limit: state.currentAgency == '',
                  onTap: (){
                    context.read<CreateDealManager>().nextStep(context);
                  }
              ),
              _ButtonSrc(
                  step: StepEnum.requestAgency,
                  limit: state.requestAgency == '',
                  onTap: (){
                    context.read<CreateDealManager>().nextStep(context);
                  }
              ),
              _ButtonSrc(
                  step: StepEnum.selectModel,
                  limit: state.selectModel == ('','','',''),
                  onTap: (){
                    context.read<CreateDealManager>().nextStep(context);
                  }
              ),
              _ButtonSrc(
                  step: StepEnum.recModel,
                  limit: state.recModel == '',
                  onTap: (){
                    context.read<CreateDealManager>().nextStep(context);
                  }
              ),
              _ButtonSrc(
                  step: StepEnum.selectRate,
                  limit: state.selectRate.$2 == '',
                  onTap: (){
                    context.read<CreateDealManager>().nextStep(context);
                  }
              ),
              _ButtonSrc(
                  step: StepEnum.recRate,
                  limit: state.recRate == '',
                  onTap: (){
                    context.read<CreateDealManager>().nextStep(context);
                  }
              ),
              _ButtonSrc(
                  step: StepEnum.promotion,
                  limit: state.age == '',
                  onTap: (){
                    context.read<CreateDealManager>().nextStep(context);
                    context.read<BananaCreateDealFinishBloc>().add(
                        ConvertData(
                            userIdx: context.read<CreateDealManager>().mIdx,
                            age: state.age,
                            currentAgency: state.currentAgency,
                            requestAgency: state.requestAgency,
                            psIdx: state.selectModel.$1,
                            ldcpName: state.selectModel.$2,
                            recModel: state.recModel,
                            ldcpModel: state.selectModel.$3,
                            piPath: state.selectModel.$4,
                            planIdx: '${state.selectRate.$1}',
                            plan: state.selectRate.$2,
                            recRate: state.recRate,
                            maxInstallment: state.maxInstallment, supportType: state.supportType,
                            combination: state.combination, welfare: state.welfare, request: state.request)
                    );
                  }
              ),
              _ButtonSrc(
                  step: StepEnum.finish,
                  limit: state.age == '',
                  onTap: (){
                    context.read<CreateDealManager>().postDeal(context);
                  }
              ),
            ],
          ),
    );
  }
}


class _ButtonSrc extends StatelessWidget {
  final StepEnum step;
  final bool limit;
  final GestureTapCallback onTap;
  const _ButtonSrc({
    required this.step,
    required this.limit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return switch(step){
      StepEnum.age => _OneButton(
        limit: limit,
      ),
      _ =>  _TwoButton(
        onTap:  onTap,
        limit: limit,
        textChange: step == StepEnum.finish,
      )
    };
  }
}



class _TwoButton extends StatelessWidget {
  final bool limit;
  final bool textChange;
  final GestureTapCallback onTap;
  const _TwoButton({
    required this.limit,
    required this.textChange,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Row(
      children: [
        Flexible(
            flex: 4,
            child: BdRippleButtonBasic(
                onTap: (){
                  context.read<CreateDealManager>().previousStep(context);
                },
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                    color: yellow,
                    width: size.sizedBox2),
                height: size.sizedAppbar,
                child: Center(
                  child: Text(
                    '이전',
                    style: TextStyle(
                        fontSize: size.titleButton,
                        fontWeight: FontWeight.w400),
                  ),
                )
            )
        ),
        SizedBox(
          width: size.sized16grid,
        ),
        Flexible(
            flex: 7,
            child:  limit
                ? const BdDisabledButton(text: '다음',)
                : BdNeoButton(
              size: size,
              text: textChange ? '딜 등록하기' : '다음',
              onPressed: onTap,
            )
        )
      ],
    );
  }
}

class _OneButton extends StatelessWidget {
  final bool limit;
  const _OneButton({
    required this.limit
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return
      limit
          ? const BdDisabledButton(text: '다음')
          : BdNeoButton(
        size: size,
        text: '다음',
        onPressed: () {
          context.read<CreateDealManager>().nextStep(context);
        },
      );
  }
}
