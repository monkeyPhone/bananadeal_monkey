import 'package:banana_deal_by_monkeycompany/package/repository/socket_invite/socket_invite_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_store_detail_socket_event.dart';
part 'banana_store_detail_socket_state.dart';

class BananaStoreDetailSocketBloc extends Bloc<BananaStoreDetailSocketEvent, BananaStoreDetailSocketState> {
  final SocketInviteRepository _repository;
  BananaStoreDetailSocketBloc({
    required SocketInviteRepository repository
  }) : _repository = repository, super(const BananaStoreDetailSocketState()) {
    on<SendInviteMulti>(_sendInviteMulti);
  }

  Future<void> _sendInviteMulti(SendInviteMulti event, Emitter<BananaStoreDetailSocketState> emit) async {
    final bool result = await _repository.sendInviteMulti(
        isAll: event.isAll,
        diIdx: event.diIdx,
        smMidList: event.smMidList
    );
    emit(state.copyWith(isSend: result));

  }


}
