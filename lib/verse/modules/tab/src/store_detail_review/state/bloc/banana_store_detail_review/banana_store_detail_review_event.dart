part of 'banana_store_detail_review_bloc.dart';

sealed class BananaStoreDetailReviewEvent extends Equatable {

  const BananaStoreDetailReviewEvent();

  @override
  List<Object> get props => [];

}

final class FirstData extends BananaStoreDetailReviewEvent{
  final String smId;
  final int mIdx;
  final int page;
  final int length;

  const FirstData({
    required this.smId,
    required this.mIdx,
    required this.page,
    required this.length
  });
}

final class GetData extends BananaStoreDetailReviewEvent{
  final List<StoreReviewVO> value;

  const GetData({
    required this.value
  });
}