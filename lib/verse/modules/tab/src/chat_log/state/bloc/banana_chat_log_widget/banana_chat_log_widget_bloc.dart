import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'banana_chat_log_widget_event.dart';
part 'banana_chat_log_widget_state.dart';

class BananaChatLogWidgetBloc extends Bloc<BananaChatLogWidgetEvent, BananaChatLogWidgetState> {
  late ScrollController scrollController;

  BananaChatLogWidgetBloc() : super(const BananaChatLogWidgetState()) {
    on<MenuBarClick>(_menuBarClick);
  }


  Future<void> _menuBarClick(MenuBarClick event, Emitter<BananaChatLogWidgetState> emit) async{
    switch(event.isOpen){
      case null:
        emit(state.copyWith(isMenu: !state.isMenu));
      default:
        emit(state.copyWith(isMenu: event.isOpen));
    }
  }


  @override
  Future<void> close() {
    // TODO: implement close
    scrollController.dispose();
    return super.close();
  }

}
