part of 'banana_invite_deal_socket_bloc.dart';

sealed class BananaInviteDealSocketEvent extends Equatable {
  const BananaInviteDealSocketEvent();

  @override
  List<Object> get props => [];
}

final class SendInviteMulti extends BananaInviteDealSocketEvent{
  final bool isAll;
  final int diIdx;
  final String smMidList;
  const SendInviteMulti({
    required this.isAll,
    required this.diIdx,
    required this.smMidList
  });
}


