part of 'banana_create_deal_promotion_bloc.dart';

sealed class BananaCreateDealPromotionEvent extends Equatable {

  const BananaCreateDealPromotionEvent();

  @override
  List<Object> get props => [];

}

final class InitPromotion extends BananaCreateDealPromotionEvent {
  final String tkIdx;
  final String psIdx;

  const InitPromotion({
    required this.tkIdx,
    required this.psIdx,
  });

}

