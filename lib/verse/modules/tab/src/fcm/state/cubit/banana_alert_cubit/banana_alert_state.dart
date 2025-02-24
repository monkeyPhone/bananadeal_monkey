part of 'banana_alert_cubit.dart';


final class BananaAlertState extends Equatable {
  final List<NotiEntity> notiDealDto;
  final List<NotiEntity> notiEtcDto;
  final (List<NotiEntity>, List<NotiEntity>) waitDto;
  final bool isEditMode;
  final int currentIndex;

  const BananaAlertState({
    this.notiDealDto = const [],
    this.notiEtcDto = const [],
    this.waitDto = (const [], const []),
    this.isEditMode = false,
    this.currentIndex = 0,
  });

  BananaAlertState copyWith({
    List<NotiEntity>? notiDealDto,
    List<NotiEntity>? notiEtcDto,
    ( List<NotiEntity>,  List<NotiEntity>)? waitDto,
    bool? isEditMode,
    int? currentIndex,
  }) => BananaAlertState(
      notiDealDto: notiDealDto ?? this.notiDealDto,
      notiEtcDto: notiEtcDto ?? this.notiEtcDto,
      waitDto: waitDto ?? this.waitDto,
      isEditMode: isEditMode ?? this.isEditMode,
      currentIndex: currentIndex ?? this.currentIndex
  );

  @override
  List<Object> get props => [notiDealDto, notiEtcDto, waitDto, isEditMode, currentIndex];
}
