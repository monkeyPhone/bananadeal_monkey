import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


part 'banana_store_search_option_event.dart';
part 'banana_store_search_option_state.dart';

class BananaStoreSearchOptionBloc extends Bloc<BananaStoreSearchOptionEvent, BananaStoreSearchOptionState> {
  BananaStoreSearchOptionBloc() : super(const BananaStoreSearchOptionState()) {

    on<ChangePage1>(_changePage);
    on<ChangeUpdate>(_changeUpdate);
    on<ChangeFavorite>(_changeFavorite);
    on<FetchKeyword>(_fetchKeyword);
  }



  Future<void> _changePage(ChangePage1 event,  Emitter<BananaStoreSearchOptionState> emit) async{
    emit(state.copyWith(page: event.page));
  }

  Future<void> _changeUpdate(ChangeUpdate event, Emitter<BananaStoreSearchOptionState> emit) async{
    emit(state.copyWith(isUpdate: event.value));
  }

  Future<void> _changeFavorite(ChangeFavorite event, Emitter<BananaStoreSearchOptionState> emit) async{
    emit(state.copyWith(isFavorite: event.value));
  }

  Future<void> _fetchKeyword(FetchKeyword event, Emitter<BananaStoreSearchOptionState> emit) async{
    emit(state.copyWith(keyword: event.keyword));
  }



}
