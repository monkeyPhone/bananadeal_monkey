part of 'banana_store_detail_bloc.dart';

final class BananaStoreDetailState extends Equatable {
  final StatusEnum statusEnum;
  final StoreDetailVO detailVO;
  final bool isBookmark;
  final List<String> imageList;
  final List<(String, String)> eventList;
  final (bool ,bool, String) openInfo;

  const BananaStoreDetailState({
    this.statusEnum = StatusEnum.initial,
    this.detailVO = ModelConfig.storeDetailVO,
    this.isBookmark = false,
    this.imageList = const [],
    this.eventList = const [],
    this.openInfo = (false, false, ''),
  });

  BananaStoreDetailState copyWith({
    StatusEnum? statusEnum,
    StoreDetailVO? detailVO,
    bool? isBookmark,
    List<String>? imageList,
    List<(String, String)>? eventList,
    (bool ,bool, String)? openInfo,
  }) => BananaStoreDetailState(
    statusEnum: statusEnum ?? this.statusEnum,
    detailVO: detailVO ?? this.detailVO,
    isBookmark: isBookmark ?? this.isBookmark,
    imageList: imageList ?? this.imageList,
    eventList: eventList ?? this.eventList,
    openInfo: openInfo ?? this.openInfo,
  );

  @override
  List<Object> get props => [
    statusEnum, detailVO, imageList, isBookmark, eventList, openInfo
  ];
}