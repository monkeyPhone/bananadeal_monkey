import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'deal_edit_event.dart';
part 'deal_edit_state.dart';

class DealEditBloc extends Bloc<DealEditEvent, DealEditState> {
  DealEditBloc() : super(const DealEditState()) {
    on<InitDealList>(_initDealList);
    on<AllDelete>(_allDelete);
    on<CancelDelete>(_cancelDelete);
    on<FetchDelete>(_fetchDelete);
    on<FetchStatus>(_fetchStatus);
  }

  Future<void> _initDealList(InitDealList event, Emitter<DealEditState> emit) async{
    List<MyDealListVO> value = [];
    value.addAll(event.remote);
    emit(state.copyWith(dealList: value));
  }

  Future<void> _allDelete(AllDelete event, Emitter<DealEditState> emit) async{
    List<MyDealListVO> value = [];
    value.addAll(state.dealList);
    emit(state.copyWith(deleteList: value));
  }

  Future<void> _cancelDelete(CancelDelete event, Emitter<DealEditState> emit) async{
    final List<MyDealListVO> value = [];
    emit(state.copyWith(deleteList: value));
  }

  Future<void> _fetchDelete(FetchDelete event, Emitter<DealEditState> emit) async{
    List<MyDealListVO> value = [];
    value.addAll(state.deleteList);
    if(value.length >= state.dealList.length){
      value.remove(event.value);
    }
    else{
      if(value.contains(event.value)){
        value.remove(event.value);
      } else{
        value.add(event.value);
      }
    }
    emit(state.copyWith(deleteList: value));
  }

  Future<void> _fetchStatus(FetchStatus event, Emitter<DealEditState> emit) async{
    emit(state.copyWith(status: event.status));
  }

}
