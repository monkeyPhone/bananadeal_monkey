part of 'banana_rate_list_bloc.dart';

final class BananaRateListState extends Equatable {
  final StatusEnum statusEnum;
  final List<PlanGroupDto> categoryList;
  final List<PlanDto> rateDto;
  final List<PlanDto> rateShow;
  final int currentIndex;
  final int currentSort;

  const BananaRateListState({
    this.statusEnum = StatusEnum.initial,
    this.categoryList = const [],
    this.rateDto = const [],
    this.rateShow = const [],
    this.currentIndex = 0,
    this.currentSort = 0,
  });


  BananaRateListState copyWith({
    StatusEnum? statusEnum,
    List<PlanGroupDto>? categoryList,
    List<PlanDto>? rateDto,
    List<PlanDto>? rateShow,
    int? currentIndex,
    int? currentSort,
  }) => BananaRateListState(
      statusEnum: statusEnum ?? this.statusEnum,
      categoryList: categoryList ?? this.categoryList,
      rateDto: rateDto ?? this.rateDto,
      rateShow: rateShow ?? this.rateShow,
      currentIndex: currentIndex ?? this.currentIndex,
      currentSort: currentSort ?? this.currentSort
  );

  @override
  List<Object> get props => [statusEnum, categoryList, rateDto, rateShow, currentIndex, currentSort];
}

