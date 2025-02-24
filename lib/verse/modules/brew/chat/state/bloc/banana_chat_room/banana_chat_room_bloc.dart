import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/chat/chat_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_chat_room_event.dart';
part 'banana_chat_room_state.dart';

class BananaChatRoomBloc extends Bloc<BananaChatRoomEvent, BananaChatRoomState> {
  final ChatRepository _repository;

  BananaChatRoomBloc({
    required ChatRepository repository,
  }) : _repository = repository, super(const BananaChatRoomState()) {
    on<ReloadRoom>(_reloadRoom);
    on<LoadingGotoRoom>(_loadingGotoRoom);
  }

  Future<void> _reloadRoom(ReloadRoom event, Emitter<BananaChatRoomState> emit) async{
    emit(state.copyWith(status: StatusEnum.loading));
    await emit.forEach(
        _repository.streamVO(),
        onData: (result) =>
            state.copyWith(status: result.statusEnum, roomList: convertChatRoomVO(result.data))
    );
  }

  Future<void> _loadingGotoRoom(LoadingGotoRoom event, Emitter<BananaChatRoomState> emit) async{
    emit(state.copyWith(status: event.statusEnum));
  }


}
