part of 'banana_chat_log_repo_bloc.dart';

final class BananaChatLogRepoState extends Equatable {
  final List<ChatLogDto> repoList;
  final List<ChatLogDto> addList;

  const BananaChatLogRepoState({
    this.repoList = const [],
    this.addList = const [],
  });

  BananaChatLogRepoState copyWith({
    List<ChatLogDto>? repoList,
    List<ChatLogDto>? addList,
  }) => BananaChatLogRepoState(
      repoList: repoList ?? this.repoList,
      addList: addList ?? this.addList
  );


  @override
  List<Object> get props => [
    repoList,
    addList
  ];
}