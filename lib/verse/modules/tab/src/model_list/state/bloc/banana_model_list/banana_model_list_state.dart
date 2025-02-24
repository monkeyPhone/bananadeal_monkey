part of 'banana_model_list_bloc.dart';

final class BananaModelListState extends Equatable {
  final StatusEnum statusEnum;
  final String tkIdx;
  final List<MakerKindDto> makerList;
  final SpecListVO specList;
  final List<PhoneSpecDto> specView;
  final List<MobileDataDto> mobileList;
  final List<MobileDataDto> mobileView;
  final int currentIndex;
  final int currentSort;



  const BananaModelListState({
    this.statusEnum = StatusEnum.initial,
    this.tkIdx = '',
    this.makerList = const [],
    this.specList = ModelConfig.specList,
    this.specView = const [],
    this.mobileList = const [],
    this.mobileView = const [],
    this.currentIndex = 0,
    this.currentSort = 0,
  });

  BananaModelListState copyWith({
    StatusEnum? statusEnum,
    String? tkIdx,
    List<MakerKindDto>? makerList,
    SpecListVO? specList,
    List<PhoneSpecDto>? specView,
    List<MobileDataDto>? mobileList,
    List<MobileDataDto>? mobileView,
    int? currentIndex,
    int? currentSort,
  }) => BananaModelListState(
    statusEnum: statusEnum ?? this.statusEnum,
    tkIdx: tkIdx ?? this.tkIdx,
    makerList: makerList ?? this.makerList,
    specList: specList ?? this.specList,
    specView: specView ?? this.specView,
    mobileList:  mobileList ?? this.mobileList,
    mobileView: mobileView ?? this.mobileView,

    currentIndex: currentIndex ?? this.currentIndex,
    currentSort: currentSort ?? this.currentSort,
  );

  @override
  List<Object> get props => [
    statusEnum, tkIdx, makerList, specList, specView, mobileList, mobileView,currentIndex, currentSort
  ];
}

