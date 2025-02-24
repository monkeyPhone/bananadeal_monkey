import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'banana_store_option_event.dart';
part 'banana_store_option_state.dart';

class BananaStoreOptionBloc extends Bloc<BananaStoreOptionEvent, BananaStoreOptionState> {
  late ScrollController scrollController;
  BananaStoreOptionBloc() : super(const BananaStoreOptionState()) {
    on<InitOption>(_initOption);
    on<ChangeOption>(_changeOption);
    on<ChangePage1>(_changePage);
    on<ChangeUpdate>(_changeUpdate);
  }

  Future<void> _initOption(InitOption event, Emitter<BananaStoreOptionState> emit) async{
    scrollController = ScrollController();
    emit(state.copyWith());
  }

  Future<void> _changeOption(ChangeOption event, Emitter<BananaStoreOptionState> emit) async{
    if(scrollController.hasClients){
      scrollController.jumpTo(0.0);
    }

    switch(event.currentSort){
      case 0:
        emit(state.copyWith(
            currentSort: event.currentSort,
            order: 'distance',
            orderBy: 'ASC',
            page: state.distancePage));
      case 1:
        emit(state.copyWith(
            currentSort: event.currentSort,
            order: 'avg_point',
            orderBy: 'DESC',
            page: state.participationPage));
      case 2:
        emit(state.copyWith(
            currentSort: event.currentSort,
            order: 'send_deal',
            orderBy: 'DESC',
            page: state.pointPage));
      case 3:
        emit(state.copyWith(
            currentSort: event.currentSort,
            order: 'favorite_store',
            orderBy: 'DESC',
            page: state.favoritePage));
    }
  }


  Future<void> _changePage(ChangePage1 event,  Emitter<BananaStoreOptionState> emit) async{
    emit(state.copyWith(page: event.page));
  }

  Future<void> _changeUpdate(ChangeUpdate event, Emitter<BananaStoreOptionState> emit) async{
    emit(state.copyWith(isUpdate: event.value));
  }


  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

}
