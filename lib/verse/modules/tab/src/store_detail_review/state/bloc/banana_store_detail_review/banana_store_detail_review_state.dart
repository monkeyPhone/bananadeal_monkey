part of 'banana_store_detail_review_bloc.dart';


final class BananaStoreDetailReviewState extends Equatable {
  final StatusEnum statusEnum;
  final List<StoreReviewVO> reviewList;

  const BananaStoreDetailReviewState({
    this.statusEnum = StatusEnum.initial,
    this.reviewList = const [],
  });

  BananaStoreDetailReviewState copyWith({
    StatusEnum? statusEnum,
    List<StoreReviewVO>? reviewList,
  }) => BananaStoreDetailReviewState(
      statusEnum: statusEnum ?? this.statusEnum,
      reviewList: reviewList ?? this.reviewList
  );

  @override
  List<Object> get props => [statusEnum, reviewList];
}
