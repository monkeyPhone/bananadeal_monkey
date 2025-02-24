import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store/store_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_store_event.dart';
part 'banana_store_state.dart';

class BananaStoreBloc extends Bloc<BananaStoreEvent, BananaStoreState> {
  final StoreRepository _repository;
  BananaStoreBloc({
    required StoreRepository repository
  }) : _repository = repository, super(const BananaStoreState()) {
    on<FirstData>(_firstData);
    on<FetchStore>(_fetchStore);
    on<CheckUpdate>(_checkUpdate);
    on<UpdateFavorite>(_updateFavorite);
    on<UpdateAllShow>(_updateAllShow);
  }

  Future<void> _firstData(FirstData event, Emitter<BananaStoreState> emit) async{
    final DataDto data = await _repository.fetchData(page: 0 ,order: 'distance', orderBy: 'ASC');
    emit(state.copyWith(
      statusEnum:  data.statusEnum,
      storeShow: convertStoreVO(data.data),
    ));
  }


  Future<void> _fetchStore(FetchStore event, Emitter<BananaStoreState> emit) async{
    DataDto data = await _repository.fetchData(page: event.option.$1, order: event.option.$2, orderBy: event.option.$3);
    List<StoreVO>? current = [];
    if(data.statusEnum == StatusEnum.success){
      current.addAll(convertStoreVO(data.data));
    }
    switch(event.currentSort){
      case 0:
        emit(state.copyWith(statusEnum: data.statusEnum, storeShow: current));
      case 1:
        emit(state.copyWith(statusEnum: data.statusEnum, storeShow: current));
      case 2:
        emit(state.copyWith(statusEnum: data.statusEnum,  storeShow: current));
      case 3:
        emit(state.copyWith(statusEnum: data.statusEnum, storeShow: current));
    }
  }

  Future<void> _checkUpdate(CheckUpdate event, Emitter<BananaStoreState> emit) async{
    List<StoreVO> current = [];
    current.addAll(state.storeShow);
    current.addAll(event.store);
    emit(state.copyWith(storeShow: current));
  }

  Future<void> _updateFavorite(UpdateFavorite event, Emitter<BananaStoreState> emit) async{
    final bool result = await _repository.sendFavorite(
        isFavorite: event.isFavorite,
        mIdx: event.mIdx,
        smId: event.smId
    );
    if(result){
      emit(state.copyWith(statusEnum: StatusEnum.loading));
    }
  }

  Future<void> _updateAllShow(UpdateAllShow event, Emitter<BananaStoreState> emit) async{
    try{
      List<DataDto> voList = [];

      for(int i = 0; i <= event.option.$1; i++){
        DataDto data = await _repository.fetchData(page: i*20, order: event.option.$2, orderBy: event.option.$3);
        voList.add(data);
      }

      List<StoreVO> current = voList.expand((data) => convertStoreVO(data.data)).toList();
      emit(state.copyWith(statusEnum: StatusEnum.success,storeShow: current));
    } catch(_){
      emit(state.copyWith(statusEnum: StatusEnum.exception, storeShow: []));
    }
  }

}
