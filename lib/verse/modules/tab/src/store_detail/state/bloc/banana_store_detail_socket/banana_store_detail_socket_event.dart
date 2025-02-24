part of 'banana_store_detail_socket_bloc.dart';


sealed class BananaStoreDetailSocketEvent extends Equatable {
  const BananaStoreDetailSocketEvent();

  @override
  List<Object> get props => [];
}

final class SendInviteMulti extends BananaStoreDetailSocketEvent{
  final bool isAll;
  final int diIdx;
  final String smMidList;
  const SendInviteMulti({
    required this.isAll,
    required this.diIdx,
    required this.smMidList
  });
}