part of 'banana_nick_name_bloc.dart';

sealed class BananaNickNameEvent extends Equatable {
  const BananaNickNameEvent();

  @override
  List<Object> get props => [];
}

final class InitNickname extends BananaNickNameEvent{
  const InitNickname();
}

final class CheckDuplication extends BananaNickNameEvent {
  final String name;
  final BuildContext context;
  const CheckDuplication({
    required this.name,
    required this.context
  });
}

final class ConfirmNickName extends BananaNickNameEvent {
  final BuildContext context;
  const ConfirmNickName({
    required this.context,
  });
}
