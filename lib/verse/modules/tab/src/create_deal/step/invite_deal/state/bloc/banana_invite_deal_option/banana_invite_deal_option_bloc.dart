import 'package:banana_deal_by_monkeycompany/package/data/store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/invite/invite_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_invite_deal_option_event.dart';
part 'banana_invite_deal_option_state.dart';

class BananaInviteDealOptionBloc extends Bloc<BananaInviteDealOptionEvent, BananaInviteDealOptionState> {
  final InviteRepository _repository;
  BananaInviteDealOptionBloc({
    required InviteRepository repository
  }) : _repository = repository, super(const BananaInviteDealOptionState()) {
    on<InitOption>(_initOption);
    on<GetStoreLength>(_getStoreLength);
    on<FetchPage>(_fetchPage);
    on<OptionIsAllChange>(_optionIsAllChange);
    on<FetchSelectListAll>(_fetchSelectListAll);
    on<FetchSelectList>(_fetchSelectList);
  }

  Future<void> _initOption(InitOption event, Emitter<BananaInviteDealOptionState> emit) async{
    List<StoreVO> list = [];
    emit(state.copyWith(isAll: false, selectList: list, page: 0, isUpdate: true));
  }

  Future<void> _getStoreLength(GetStoreLength event, Emitter<BananaInviteDealOptionState> emit) async{
    final DataDto data = await _repository.getStoreListLength();
    final StatusEnum status = data.statusEnum;
    final int length = switch(status){
      StatusEnum.success => data.data.first,
      _ => 0
    };
    final (StatusEnum, int) result = (status, length);
    emit(state.copyWith(statusEnum: result.$1, storeLength: result.$2));
  }

  Future<void> _fetchPage(FetchPage event, Emitter<BananaInviteDealOptionState> emit) async{
    emit(state.copyWith(page: event.page, isUpdate: event.isUpdate));
  }


  Future<void> _optionIsAllChange(OptionIsAllChange event, Emitter<BananaInviteDealOptionState> emit) async{
    emit(state.copyWith(isAll: event.value));
  }

  Future<void> _fetchSelectListAll(FetchSelectListAll event, Emitter<BananaInviteDealOptionState> emit) async{
    List<StoreVO> list = [];
    list.addAll(event.valueList);
    emit(state.copyWith(selectList: list));
  }

  Future<void> _fetchSelectList(FetchSelectList event, Emitter<BananaInviteDealOptionState> emit) async{
    List<StoreVO> list = [];
    list.addAll(state.selectList);
    if(list.contains(event.value)){
      list.remove(event.value);
    }
    else{
      list.add(event.value);
    }
    emit(state.copyWith(selectList: list));
  }

}
