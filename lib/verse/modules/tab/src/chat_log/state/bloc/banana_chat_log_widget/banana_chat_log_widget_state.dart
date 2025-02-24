part of 'banana_chat_log_widget_bloc.dart';

final class BananaChatLogWidgetState extends Equatable {
  final bool isMenu;

  const BananaChatLogWidgetState({
    this.isMenu = false,
  });

  BananaChatLogWidgetState copyWith({
    bool? isMenu,
  }) => BananaChatLogWidgetState(
    isMenu: isMenu ?? this.isMenu,

  );


  @override
  List<Object> get props => [isMenu];
}