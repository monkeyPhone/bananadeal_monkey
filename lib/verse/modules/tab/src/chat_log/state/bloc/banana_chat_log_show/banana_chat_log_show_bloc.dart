import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_chat_log_show_event.dart';
part 'banana_chat_log_show_state.dart';

class BananaChatLogShowBloc extends Bloc<BananaChatLogShowEvent, BananaChatLogShowState> {
  BananaChatLogShowBloc() : super(const BananaChatLogShowState()) {
    on<GetChatPageNation>(_getChatPageNation);
    on<LoadMoreChat>(_loadMoreChat);
    on<AddMoreChat>(_addMoreChat);
    on<AddScrollChat>(_addScrollChat);
    on<AddManyChat>(_addManyChat);
    on<ConvertY>(_convertY);
  }

  Future<void> _getChatPageNation(GetChatPageNation event, Emitter<BananaChatLogShowState> emit) async{
    List<ChatLogDto> showList = event.showList.reversed.toList();
    emit(state.copyWith(showList: showList));
  }

  Future<void> _loadMoreChat(LoadMoreChat event, Emitter<BananaChatLogShowState> emit) async{
    List<ChatLogDto> now = state.showList.reversed.toList();
    int totalLength = event.data.length;
    int nowLength = now.length;
    int remainLength = totalLength - nowLength;
    if (remainLength > 0) {
      int loadLength = remainLength < 100 ? remainLength : 100;
      int startIndex = remainLength - loadLength;
      int endIndex = remainLength;
      List<ChatLogDto> newMessages = event.data.sublist(startIndex, endIndex);
      now.insertAll(0, newMessages);
      emit(state.copyWith(showList: now.reversed.toList()));
    }
  }

  Future<void> _addMoreChat(AddMoreChat event, Emitter<BananaChatLogShowState> emit) async{
    List<ChatLogDto> lazy = state.lazyList.toList();
    if(event.isUp){
      lazy.add(event.data);
      emit(state.copyWith(lazyList: lazy));
    } else{
      List<ChatLogDto> now = state.showList.reversed.toList();
      if(lazy.isNotEmpty){
        now.addAll(lazy);
        now.add(event.data);
        lazy.clear();
        emit(state.copyWith(showList: now.reversed.toList(), lazyList: lazy));
      } else{
        now.add(event.data);
        emit(state.copyWith(showList: now.reversed.toList()));
      }
    }

  }

  Future<void> _addScrollChat(AddScrollChat event, Emitter<BananaChatLogShowState> emit) async{
    List<ChatLogDto> lazy = state.lazyList.toList();
    if(lazy.isNotEmpty){
      List<ChatLogDto> now = state.showList.reversed.toList();
      now.addAll(lazy);
      lazy.clear();
      emit(state.copyWith(showList: now.reversed.toList(), lazyList: lazy));
    }
  }


  Future<void> _addManyChat(AddManyChat event, Emitter<BananaChatLogShowState> emit) async{
    List<ChatLogDto> now = state.showList.reversed.toList();
    now.addAll(event.data);
    emit(state.copyWith(showList: now.reversed.toList()));
  }


  Future<void> _convertY(ConvertY event, Emitter<BananaChatLogShowState> emit) async{
    List<ChatLogDto> now = state.showList.reversed.toList();
    List<ChatLogDtoRow> convertNow = now.map((entity) => entity.toRow()).toList();
    for(int i=0; i < convertNow.length; i++ ){
      if(convertNow[i].cIsRead == 'N'){
        convertNow[i].cIsRead = 'Y';
      }
    }
    List<ChatLogDto> result = convertNow.map((entity) => entity.toHigh()).toList();
    emit(state.copyWith(showList: result.reversed.toList()));

  }

}
