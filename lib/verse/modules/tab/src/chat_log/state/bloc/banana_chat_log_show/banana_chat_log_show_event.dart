part of 'banana_chat_log_show_bloc.dart';

sealed class BananaChatLogShowEvent extends Equatable {
  const BananaChatLogShowEvent();

  @override
  List<Object> get props => [];

}

final class GetChatPageNation extends BananaChatLogShowEvent{
  final List<ChatLogDto> showList;
  const GetChatPageNation({
    required this.showList
  });
}

final class LoadMoreChat extends BananaChatLogShowEvent {
  final List<ChatLogDto> data;
  const LoadMoreChat({
    required this.data
  });
}

final class AddMoreChat extends BananaChatLogShowEvent {
  final ChatLogDto data;
  final bool isUp;
  const AddMoreChat({
    required this.data,
    required this.isUp,
  });
}

final class AddScrollChat extends BananaChatLogShowEvent {

  const AddScrollChat();
}

final class AddManyChat extends BananaChatLogShowEvent {
  final List<ChatLogDto> data;
  const AddManyChat({
    required this.data,
  });
}

final class ConvertY extends BananaChatLogShowEvent {

  const ConvertY();
}
