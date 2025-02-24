import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_create_deal_init_event.dart';
part 'banana_create_deal_init_state.dart';

class BananaCreateDealInitBloc extends Bloc<BananaCreateDealInitEvent, BananaCreateDealInitState> {
  BananaCreateDealInitBloc() : super(const BananaCreateDealInitState()) {
    on<InitInfo>(_initInfo);
    on<ChangeStepWidget>(_changeStepWidget);
  }

  Future<void> _initInfo(InitInfo event, Emitter<BananaCreateDealInitState> emit) async{
    emit(
        state.copyWith(
            initInfo:  event.selectModel ?? ("","","","",)
        )
    );
  }

  Future<void> _changeStepWidget(ChangeStepWidget event, Emitter<BananaCreateDealInitState> emit) async{
    emit(state.copyWith(
        stepWidget: event.step
    ));
  }

}
