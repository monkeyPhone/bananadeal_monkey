part of 'banana_naver_map_bloc.dart';

final class BananaNaverMapState extends Equatable {
  final AddressVO addressVO;
  final bool next;
  final bool isMove;
  final bool isInit;

  const BananaNaverMapState({
    this.addressVO = ModelConfig.addressVO,
    this.next = false,
    this.isMove = false,
    this.isInit = false,
  });

  BananaNaverMapState copyWith({
    AddressVO? addressVO,
    bool? next,
    bool? isMove,
    bool? isInit,
  }) => BananaNaverMapState(
      addressVO: addressVO ?? this.addressVO,
      next: next ?? this.next,
      isMove: isMove ?? this.isMove,
      isInit:  isInit ?? this.isInit
  );

  @override
  List<Object?> get props => [addressVO, next, isMove, isInit];

}
