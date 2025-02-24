part of 'banana_fcm_cubit.dart';

final class BananaFcmState extends Equatable {
  final bool isStop;
  final bool isReadDeal;
  final bool isReadNotice;
  final bool isReadChat;


  const BananaFcmState({
    this.isStop = false,
    this.isReadDeal = true,
    this.isReadNotice = true,
    this.isReadChat = true,

  });

  BananaFcmState copyWith({
    bool? isStop,
    bool? isReadDeal,
    bool? isReadNotice,
    bool? isReadChat,


  }) => BananaFcmState(
    isStop: isStop ?? this.isStop,
    isReadDeal: isReadDeal ?? this.isReadDeal,
    isReadNotice: isReadNotice ?? this.isReadNotice,
    isReadChat: isReadChat ?? this.isReadChat,

  );

  @override
  List<Object> get props => [isStop, isReadDeal, isReadNotice, isReadChat, ];
}

