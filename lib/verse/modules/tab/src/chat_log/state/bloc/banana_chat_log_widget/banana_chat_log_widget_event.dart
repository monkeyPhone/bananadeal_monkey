part of 'banana_chat_log_widget_bloc.dart';

sealed class BananaChatLogWidgetEvent extends Equatable {

  const BananaChatLogWidgetEvent();

  @override
  List<Object> get props => [];

}

final class MenuBarClick extends BananaChatLogWidgetEvent{
  final bool? isOpen;
  const MenuBarClick({this.isOpen});

}
