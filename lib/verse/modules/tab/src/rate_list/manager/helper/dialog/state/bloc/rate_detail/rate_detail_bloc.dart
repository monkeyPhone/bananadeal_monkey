import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan_detail/plan_detail_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rate_detail_event.dart';
part 'rate_detail_state.dart';

class RateDetailBloc extends Bloc<RateDetailEvent, RateDetailState> {
  final PlanDetailRepository _repository;
  RateDetailBloc({
    required PlanDetailRepository repository
  }) : _repository = repository, super(const RateDetailState()) {
    on<InitData>(_initData);
  }

  Future<void> _initData(InitData event, Emitter<RateDetailState> emit) async{
    emit(state.copyWith(statusEnum: StatusEnum.loading));
    await emit.forEach(
        _repository.streamRatePlanDetail(),
        onData: (result) =>
            state.copyWith(
                statusEnum: result.isNotEmpty ? StatusEnum.success : StatusEnum.exception,
                detail: result
            )
    );
  }

}
