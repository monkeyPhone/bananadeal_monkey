import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_group_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan/plan_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_rate_list_event.dart';
part 'banana_rate_list_state.dart';

class BananaRateListBloc extends Bloc<BananaRateListEvent, BananaRateListState> {
  final PlanRepository _repository;
  BananaRateListBloc({
    required PlanRepository repository
  }) : _repository = repository,
        super(const BananaRateListState()) {
    on<InitRateList>(_initRateList);
    on<ChangeCategory>(_changeCategory);
    on<ChangeSort>(_changeSort);
  }

  Future<void> _initRateList(InitRateList event, Emitter<BananaRateListState> emit) async{
    await emit.forEach(_repository.streamRatePlan(tkIdx: event.initInfo.$2, psIdx: event.initInfo.$1),
        onData: (result) =>
            state.copyWith(
                statusEnum: result.statusEnum,
                categoryList: result.planGroup,
                rateDto: result.planList
            )
    );
    _changeCategory(const ChangeCategory(0),emit);
  }

  Future<void> _changeCategory(ChangeCategory event, Emitter<BananaRateListState> emit) async{
    List<PlanDto> data = [];
    data.addAll(state.rateDto.where((element) => element.pgName!.contains(state.categoryList[event.index].pgName)));
    emit(state.copyWith(currentIndex: event.index, rateShow: data));
    _changeSort(ChangeSort(state.currentSort), emit);
  }

  Future<void> _changeSort(ChangeSort event, Emitter<BananaRateListState> emit) async{
    switch(event.index){
      case 0:
        state.rateShow.sort((a,b) => int.parse(b.pOrder!).compareTo(int.parse(a.pOrder!)));
      case 1:
        state.rateShow.sort((a,b) => int.parse(a.pPlanPrice!).compareTo(int.parse(b.pPlanPrice!)));
      case 2:
        state.rateShow.sort((a,b) => int.parse(b.pPlanPrice!).compareTo(int.parse(a.pPlanPrice!)));
      case 3:
        state.rateShow.sort((a,b) => int.parse(b.pIdx!).compareTo(int.parse(a.pIdx!)));
      case 4:
        state.rateShow.sort((a,b) => a.pPlanName!.compareTo(b.pPlanName!));
      case 5:
        state.rateShow.sort((a,b) => b.pPlanName!.compareTo(a.pPlanName!));
    }
    emit(state.copyWith(currentSort: event.index));
  }

}
