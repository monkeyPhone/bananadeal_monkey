part of 'banana_chat_room_bloc.dart';

final class BananaChatRoomState extends Equatable {
  final StatusEnum status;
  final List<ChatRoomVO> roomList;

  const BananaChatRoomState({
    this.status = StatusEnum.initial,
    this.roomList = const [],
  });

  BananaChatRoomState copyWith({
    StatusEnum? status,
    List<ChatRoomVO>? roomList,
  }) => BananaChatRoomState(
      status: status ?? this.status,
      roomList: roomList ?? this.roomList
  );

  @override
  List<Object> get props => [status, roomList];

}