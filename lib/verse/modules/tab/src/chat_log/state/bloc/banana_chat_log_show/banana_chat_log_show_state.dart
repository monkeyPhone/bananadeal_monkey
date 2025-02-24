part of 'banana_chat_log_show_bloc.dart';


final class BananaChatLogShowState extends Equatable {
  final List<ChatLogDto> showList;
  final List<ChatLogDto> lazyList;

  const BananaChatLogShowState({
    this.showList = const [],
    this.lazyList = const [],
  });


  BananaChatLogShowState copyWith({
    List<ChatLogDto>? showList,
    List<ChatLogDto>? lazyList,
  }) => BananaChatLogShowState(
    showList: showList ?? this.showList,
    lazyList: lazyList ?? this.lazyList,
  );

  @override
  List<Object> get props => [
    showList,
    lazyList
  ];

}