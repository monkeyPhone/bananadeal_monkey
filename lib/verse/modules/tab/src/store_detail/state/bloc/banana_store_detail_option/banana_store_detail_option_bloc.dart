import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_store_detail_option_event.dart';
part 'banana_store_detail_option_state.dart';

class BananaStoreDetailOptionBloc extends Bloc<BananaStoreDetailOptionEvent, BananaStoreDetailOptionState> {
  late final ScrollController scrollController;

  BananaStoreDetailOptionBloc() : super(const BananaStoreDetailOptionState()) {
    on<InitDetailOption>(_initDetailOption);
    on<ChangeTap>(_changeTap);
    on<ChangeState>(_changeState);
  }

  Future<void> _initDetailOption(InitDetailOption event, Emitter<BananaStoreDetailOptionState> emit) async{
    scrollController = ScrollController();
    emit(state.copyWith());
  }

  Future<void> _changeTap(ChangeTap event, Emitter<BananaStoreDetailOptionState> emit) async{
    emit(state.copyWith(currentIndex: event.index));
  }

  Future<void> _changeState(ChangeState event, Emitter<BananaStoreDetailOptionState> emit) async{
    emit(state.copyWith(isUpdate: event.value));
  }


  @override
  Future<void> close() {
    // TODO: implement close
    scrollController.dispose();
    return super.close();
  }

}
