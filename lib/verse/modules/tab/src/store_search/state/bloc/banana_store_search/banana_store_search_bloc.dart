import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_search/store_search_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_store_search_event.dart';
part 'banana_store_search_state.dart';

class BananaStoreSearchBloc extends Bloc<BananaStoreSearchEvent, BananaStoreSearchState> {
  final StoreSearchRepository _repository;
  BananaStoreSearchBloc({
    required StoreSearchRepository repository
  }) : _repository = repository, super(const BananaStoreSearchState()) {

    on<FetchStore>(_fetchStore);
    on<InitStore>(_initStore);
    on<UpdateFavorite>(_updateFavorite);
    on<UpdateAllShow>(_updateAllShow);
  }

  Future<void> _fetchStore(FetchStore event, Emitter<BananaStoreSearchState> emit) async{
    final DataDto data = await _repository.originData(start: event.option.$1, keyword: event.option.$2);
    List<StoreVO>? current = [];
    if(data.statusEnum == StatusEnum.success){
      current.addAll(convertStoreVO(data.data));
    }
    emit(state.copyWith(statusEnum: data.statusEnum, storeShow: current));
  }

  Future<void> _initStore(InitStore event, Emitter<BananaStoreSearchState> emit) async{
    emit(state.copyWith(storeShow: []));
  }

  Future<void> _updateFavorite(UpdateFavorite event, Emitter<BananaStoreSearchState> emit) async{
    final bool result = await _repository.sendFavorite(
        isFavorite: event.isFavorite,
        mIdx: event.mIdx,
        smId: event.smId
    );
    if(result == true){
      emit(state.copyWith(statusEnum: StatusEnum.loading));
    }
  }

  Future<void> _updateAllShow(UpdateAllShow event, Emitter<BananaStoreSearchState> emit) async{
    try{
      List<DataDto> voList = [];

      for(int i = 0; i <= event.option.$1; i++){
        DataDto data = await _repository.originData(start: i*20, keyword: event.option.$2);
        voList.add(data);
      }
      List<StoreVO> current = voList.expand((data) => convertStoreVO(data.data)).toList();
      emit(state.copyWith(statusEnum: StatusEnum.success,storeShow: current));
    } catch(_){
      emit(state.copyWith(statusEnum: StatusEnum.exception, storeShow: []));
    }
  }




}
