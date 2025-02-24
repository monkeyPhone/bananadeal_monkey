part of 'banana_chat_log_repo_bloc.dart';


sealed class BananaChatLogRepoEvent extends Equatable {
  const BananaChatLogRepoEvent();

  @override
  List<Object> get props  => [];
}

final class GetChatLog extends BananaChatLogRepoEvent {
  final List<ChatLogDto> data;

  const GetChatLog({
    required this.data
  });
}

final class AddChatLog extends BananaChatLogRepoEvent {
  final ChatLogDto data;

  const AddChatLog({
    required this.data
  });
}

final class SaveChatLog extends BananaChatLogRepoEvent{
  const SaveChatLog();
}

final class GetImageList extends BananaChatLogRepoEvent{
  const GetImageList();
}