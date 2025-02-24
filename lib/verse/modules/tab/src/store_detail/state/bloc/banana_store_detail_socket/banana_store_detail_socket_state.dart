part of 'banana_store_detail_socket_bloc.dart';

final class BananaStoreDetailSocketState extends Equatable {
  final bool isSend;
const BananaStoreDetailSocketState({
    this.isSend = false
});

  BananaStoreDetailSocketState copyWith({
    bool? isSend
  }) => BananaStoreDetailSocketState(
    isSend: isSend ?? this.isSend
  );

  @override
  List<Object> get props => [isSend];
}
