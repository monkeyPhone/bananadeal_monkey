part of 'banana_chat_room_bloc.dart';

sealed class BananaChatRoomEvent extends Equatable{
  const BananaChatRoomEvent();

  @override
  List<Object> get props => [];
}

final class ReloadRoom extends BananaChatRoomEvent{
  const ReloadRoom();
}

final class LoadingGotoRoom extends BananaChatRoomEvent{
  final StatusEnum statusEnum;
  const LoadingGotoRoom(this.statusEnum);
}