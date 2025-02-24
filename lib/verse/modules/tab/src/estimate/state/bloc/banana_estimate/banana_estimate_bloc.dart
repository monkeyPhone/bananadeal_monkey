import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/estimate/estimate_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_estimate_event.dart';
part 'banana_estimate_state.dart';

class BananaEstimateBloc extends Bloc<BananaEstimateEvent, BananaEstimateState> {
  final int _diIdx;
  final EstimateRepository _repository;
  BananaEstimateBloc({
    required EstimateRepository repository,
    required int diIdx
  }) : _repository = repository, _diIdx = diIdx, super(const BananaEstimateState()) {
    on<InitEstimate>(_initEstimate);
    on<RisingEstimate>(_risingEstimate);
    on<FetchEstimate>(_fetchEstimate);
    on<FetchStatus>(_fetchStatus);
  }


  Future<void> _initEstimate(InitEstimate event, Emitter<BananaEstimateState> emit) async{
    List<EstimateVO> list = [];
    emit(state.copyWith(
      statusEnum: StatusEnum.loading,
      estimateList: list
    ));
  }


  Future<void> _risingEstimate(RisingEstimate event, Emitter<BananaEstimateState> emit) async{
    emit(state.copyWith(statusEnum: StatusEnum.loading));
    await emit.forEach(_repository.streamEstimate(
        diIdx: _diIdx, start: 0, order: event.current, length: 10),
        onData: (result) {
          List<EstimateVO> list = [];
          if(result.data.isNotEmpty){
            final List<EstimateVO> convert = convertEstimateVO(result.data);
            list.addAll(convert);
          }
          return state.copyWith(
            statusEnum: result.statusEnum,
            estimateList: list
          );
        });
  }

  Future<void> _fetchEstimate(FetchEstimate event, Emitter<BananaEstimateState> emit) async{
    List<EstimateVO> list = [];
    if(event.statusEnum == StatusEnum.success){
      list.addAll(state.estimateList);
      list.addAll(event.valueList);
    }
    emit(state.copyWith(
      statusEnum: event.statusEnum,
      estimateList: list
    ));

  }

  Future<void>_fetchStatus(FetchStatus event, Emitter<BananaEstimateState> emit) async{
    List<EstimateVO> list = [];
    emit(state.copyWith(
        statusEnum: StatusEnum.exception,
        estimateList: list
    ));
  }

  // Future<void> _sortEstimate(SortEstimate event, Emitter<BananaEstimateState> emit) async{
  //   emit(state.copyWith(current: event.index, page: 0));
  // }

}
