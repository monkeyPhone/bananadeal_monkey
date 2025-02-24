import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/flutter_neumorphic.dart';
import 'package:banana_deal_by_monkeycompany/package/data/estimate_status_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/estimate/estimate_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_estimate_option_event.dart';
part 'banana_estimate_option_state.dart';

class BananaEstimateOptionBloc extends Bloc<BananaEstimateOptionEvent, BananaEstimateOptionState> {
  late final ScrollController scrollController;
  final EstimateRepository _repository;
  BananaEstimateOptionBloc({
    required EstimateRepository repository
  }) : _repository = repository, super(const BananaEstimateOptionState()) {
    on<InitOption>(_initOption);
    on<ConvertDStatus>(_convertDStatus);
    on<ChangeUpdate>(_changeUpdate);
    on<ChangeSort>(_changeSort);
    on<ChangePage>(_changePage);
    on<SetController>(_setScrollController);
  }

  Future<void> _setScrollController(SetController event, Emitter<BananaEstimateOptionState> emit) async{
    scrollController = event.controller;
  }

  Future<void> _convertDStatus(ConvertDStatus event, Emitter<BananaEstimateOptionState> emit) async{
    await emit.forEach(
        _repository.streamEstimateStatus(diIdx: event.diIdx),
        onData: (result){
          if(result.statusEnum == StatusEnum.success){
            final EstimateStatusVO statusVO = convertEstimateStatusVO(result.data).first;
            return state.copyWith(
                statusEnum: StatusEnum.success,
                dStatus: statusVO.diStatus
            );
          }
          else{
            return state.copyWith(statusEnum: StatusEnum.exception, dStatus: '');
          }

        }
    );
  }

  Future<void> _initOption(InitOption event, Emitter<BananaEstimateOptionState> emit) async {
    emit(state.copyWith(isUpdate: true, current: 0, page: 0));
  }

  Future<void> _changeUpdate(ChangeUpdate event, Emitter<BananaEstimateOptionState> emit) async {
    emit(state.copyWith(isUpdate: event.isUpdate));
  }

  Future<void> _changeSort(ChangeSort event, Emitter<BananaEstimateOptionState> emit) async {
    emit(state.copyWith(current: event.index, page: 0, isUpdate:  true));
  }

  Future<void> _changePage(ChangePage event, Emitter<BananaEstimateOptionState> emit) async {
    emit(state.copyWith(page: event.index));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    scrollController.dispose();
    return super.close();
  }

}
