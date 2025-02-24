import 'package:banana_deal_by_monkeycompany/package/repository/socket_invite/socket_invite_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_invite_deal_socket_event.dart';
part 'banana_invite_deal_socket_state.dart';

class BananaInviteDealSocketBloc extends Bloc<BananaInviteDealSocketEvent, BananaInviteDealSocketState> {
  final SocketInviteRepository _repository;
  BananaInviteDealSocketBloc({
    required SocketInviteRepository repository
  }) : _repository = repository,  super(BananaInviteDealSocketState()) {
    on<SendInviteMulti>(_sendInviteMulti);
  }

  Future<void> _sendInviteMulti(SendInviteMulti event, Emitter<BananaInviteDealSocketState> state) async {
    await _repository.sendInviteMulti(
        isAll: event.isAll,
        diIdx: event.diIdx,
        smMidList: event.smMidList
    );
  }

}
