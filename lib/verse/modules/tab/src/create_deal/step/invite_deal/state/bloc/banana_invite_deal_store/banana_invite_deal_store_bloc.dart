import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/invite/invite_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_invite_deal_store_event.dart';
part 'banana_invite_deal_store_state.dart';

class BananaInviteDealStoreBloc extends Bloc<BananaInviteDealStoreEvent, BananaInviteDealStoreState> {
  final InviteRepository _repository;
  BananaInviteDealStoreBloc({
    required InviteRepository repository
  }) : _repository = repository, super(const BananaInviteDealStoreState()) {
    on<StoreInitData>(_storeInitData);
    on<ChangeStoreStatus>(_changeStoreStatus);
    on<FetchStoreData>(_fetchStoreData);
    on<LoadingBar>(_loadingBar);
  }

  Future<void> _storeInitData(StoreInitData event, Emitter<BananaInviteDealStoreState> emit) async {
    emit(state.copyWith(statusEnum: StatusEnum.loading));
    await emit.forEach(
        _repository.streamStoreData(
          page: 0,
          order: 'favorite_store',
          orderBy: 'DESC',
        ),
        onData: (result) {
          final List<StoreVO> storeList = convertStoreVO(result.data);
          return state.copyWith(statusEnum: result.statusEnum, storeList: storeList);
        }

    );
  }


  Future<void> _changeStoreStatus(ChangeStoreStatus event, Emitter<BananaInviteDealStoreState> emit) async{
    emit(state.copyWith(statusEnum: event.status));
  }

  Future<void> _fetchStoreData(FetchStoreData event, Emitter<BananaInviteDealStoreState> emit) async{
    add(const LoadingBar());
    final DataDto storeData = await _repository.fetchStoreData(page: event.page*20, order: 'favorite_store', orderBy: 'DESC');
    List<StoreVO> list = [];
    if(storeData.statusEnum == StatusEnum.success){
      final List<StoreVO> storeList = convertStoreVO(storeData.data);
      list.addAll(state.storeList);
      list.addAll(storeList);
      emit(state.copyWith(storeList: list));
    }
    else{
     if(storeData.statusEnum == StatusEnum.failure){
       emit(state.copyWith(statusEnum: StatusEnum.failure));
     }
     else{
       emit(state.copyWith(statusEnum: storeData.statusEnum, storeList: []));
     }
    }
  }

  Future<void> _loadingBar(LoadingBar event, Emitter<BananaInviteDealStoreState> emit) async{
    emit(state.copyWith(statusEnum: StatusEnum.loading));
  }

}