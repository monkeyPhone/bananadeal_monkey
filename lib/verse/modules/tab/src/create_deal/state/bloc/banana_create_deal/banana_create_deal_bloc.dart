import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/create_deal/create_deal_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'banana_create_deal_event.dart';
part 'banana_create_deal_state.dart';

class BananaCreateDealBloc extends Bloc<BananaCreateDealEvent, BananaCreateDealState> {
  final CreateDealRepository _repository;

  BananaCreateDealBloc({
    required CreateDealRepository repository,
  }) : _repository = repository, super(const BananaCreateDealState()) {
    on<NextStep>(_nextStep);
    on<PreviousStep>(_previousStep);
    on<ChangeCreateState>(_changeCreateState);
    on<InitModel>(_initModel);
    on<SetModel>(_setModel);
    on<SetPromotion>(_setPromotion);
    on<ShowSheetEvent>(_showSheetEvent);
  }

  Future<void> _nextStep(NextStep event, Emitter<BananaCreateDealState> emit) async{
    emit(
        state.copyWith(
            step: (state.selectModel.$1 != '0' && state.step == StepEnum.selectModel && state.requestAgency != '0') ||
                (state.selectRate.$2 != '0' && state.step == StepEnum.selectRate && state.requestAgency != '0')
                || (state.requestAgency == '0' && state.selectModel.$1 == '0' && state.step == StepEnum.recModel)
                ? StepEnum.values[StepEnum.values.indexOf(state.step)+2]
                : (state.requestAgency == '0' && state.selectModel.$1 != '0' && state.step == StepEnum.selectModel)
                ? StepEnum.values[StepEnum.values.indexOf(state.step)+3]
                : StepEnum.values[StepEnum.values.indexOf(state.step)+1]
        )
    );
  }

  Future<void> _previousStep(PreviousStep event, Emitter<BananaCreateDealState> emit) async{
    emit(
        state.copyWith(
            step:
            (state.selectModel.$1 != '0' && state.step == StepEnum.selectRate && state.requestAgency != '0') ||
                (state.selectRate.$2 != '0' && state.step == StepEnum.promotion && state.requestAgency != '0')
                || (state.requestAgency == '0' && state.selectModel.$1 == '0' && state.step == StepEnum.recRate)
                ? StepEnum.values[StepEnum.values.indexOf(state.step)-2]
                :( state.requestAgency == '0' && state.selectModel.$1 != '0' && state.step == StepEnum.recRate)
                ? StepEnum.values[StepEnum.values.indexOf(state.step)-3]
                : StepEnum.values[StepEnum.values.indexOf(state.step)-1]
        )

    );
  }

  Future<void> _changeCreateState(ChangeCreateState event, Emitter<BananaCreateDealState> emit) async{
    // log('hihi: ${event.value}');
    emit(
        switch(state.step){
          StepEnum.age =>
              state.copyWith(
                age: event.value,
                recModel:  state.age != event.value ? '' : state.recModel,
              ),
          StepEnum.currentAgency =>
              state.copyWith(
                currentAgency: event.value,
              ),
          StepEnum.requestAgency =>
          state.requestAgency != event.value ?
          state.copyWith(
            requestAgency: event.value,
            selectRate:  (0, '') ,
            maxInstallment: '',
            supportType: '',
            combination: '',
            welfare: '',
            request: '',
          ) : state.copyWith(
            requestAgency: event.value,
          ),
          StepEnum.selectModel =>
              state.copyWith(
                selectModel: event.value,
                recModel:   event.value == '0' ? state.recModel : '',
              ),
          StepEnum.recModel =>
              state.copyWith(
                recModel: event.value,
              ),
          StepEnum.selectRate =>
              state.copyWith(
                selectRate: event.value,
                recRate:  event.value != '0' ? '' : state.recRate,
              ),
          StepEnum.recRate =>
              state.copyWith(
                recRate:   event.value,
              ),
          _ => state.copyWith(),
        // StepEnum.promotion =>
        //     state.copyWith(),
        // StepEnum.finish =>
        //     state.copyWith(),
        }
    );
  }



  Future<void> _initModel(InitModel event, Emitter<BananaCreateDealState> emit) async{
    emit(
        state.copyWith(
          selectModel: ('','','',''),
          recModel: '',
          selectRate: (0, ''),
          recRate: '',
          maxInstallment: '',
          supportType: '',
          combination: '',
          welfare: '',
          request: '',
        ));
  }


  Future<void> _setModel(SetModel event, Emitter<BananaCreateDealState> emit) async{
    emit(state.copyWith(
      selectModel: event.selectModel,
      recModel: '',
      selectRate: (0, ''),
      recRate: '',
      maxInstallment: '',
      supportType: '',
      combination: '',
      welfare: '',
      request: '',
    ));
  }

  Future<void> _setPromotion(SetPromotion event, Emitter<BananaCreateDealState> emit) async{
    switch(event.promotionEnum){
      case PromotionEnum.maxInstallment:
        emit(state.copyWith(
            maxInstallment: event.value
        ));
      case PromotionEnum.request:
        emit(state.copyWith(
            request: event.value
        ));
      case PromotionEnum.welfare:
        emit(state.copyWith(
            welfare: event.value
        ));
      case PromotionEnum.combination:
        emit(state.copyWith(
            combination: event.value
        ));
      case PromotionEnum.supportType:
        emit(state.copyWith(
            supportType: event.value
        ));
    }

  }


  Future<void> _showSheetEvent(ShowSheetEvent event,  Emitter<BananaCreateDealState> emit) async{
    final BuildContext context = event.context;
    final bool isPsIdx = state.selectModel.$1 != '';
    final bool isCurrent = event.isCurrent;

    GestureTapCallback onTapValue(String tkIdx) =>
            () async{
            add(ChangeCreateState(value: tkIdx));
            switch(isPsIdx){
              case true:
                final bool isOk = await _repository.checkValue(tkIdx:  int.parse(tkIdx), psIdx: int.parse(state.selectModel.$1));
                if(context.mounted){
                  switch(isOk){
                    case true:
                      Navigator.pop(context);
                    case false:
                      context.read<VerseConfig>().browser.dialog.customDialogColumn(
                          routerContext: context,
                          barrierDismissible: false,
                          mainText: '해당 단말기를 지원하지\n않는 통신사입니다.', cancelText: '다른 통신사 선택하기', confirmText: '단말기 초기화',
                          cancelOnTap:  () {
                            add(const ChangeCreateState(value: ''));
                            Navigator.pop(context);
                          },
                          conFirmOnTap: () {
                            add(const InitModel());
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                      );
                  }
                }
              case false:
                Navigator.pop(context);
            }
        };

    final BottomSheetVO sk = BottomSheetVO(
        buttonName: 'SK',
        onTap: onTapValue('1')
    );

    final BottomSheetVO kt = BottomSheetVO(
        buttonName: 'KT',
        onTap: onTapValue('2')
    );

    final BottomSheetVO lg = BottomSheetVO(
        buttonName: 'LG',
        onTap: onTapValue('3')
    );

    final BottomSheetVO mobile7 = BottomSheetVO(
        buttonName: '7모바일',
        onTap: onTapValue('4')
    );

    final BottomSheetVO mMobile = BottomSheetVO(
        buttonName: 'M모바일',
        onTap: onTapValue('5')
    );

    final BottomSheetVO uMobile = BottomSheetVO(
        buttonName: 'U모바일',
        onTap: onTapValue('6')
    );


    final BottomSheetVO helloMobileKt = BottomSheetVO(
        buttonName: 'Hello모바일 (KT망)',
        onTap: onTapValue('8')
    );

    final BottomSheetVO helloMobileLg = BottomSheetVO(
        buttonName: 'Hello모바일 (LG망)',
        onTap: onTapValue('12')
    );

    final BottomSheetVO etc = BottomSheetVO(
        buttonName: '기타',
        onTap: onTapValue('14')
    );


    List<BottomSheetVO> result1 = [
      sk, kt, lg, mobile7, mMobile, uMobile, helloMobileKt, helloMobileLg, etc
    ];

    List<BottomSheetVO> result2 = [
      sk, kt, lg, mobile7, mMobile, uMobile, helloMobileKt, helloMobileLg
    ];

    List<BottomSheetVO> result = isCurrent ? result1 : result2;

    context.read<VerseConfig>().browser.sheet.showSheet(
        routerContext: context, sheetList: result,
    );
  }


}
