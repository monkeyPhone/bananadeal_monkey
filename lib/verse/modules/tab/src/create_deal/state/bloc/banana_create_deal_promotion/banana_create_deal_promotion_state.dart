part of 'banana_create_deal_promotion_bloc.dart';

final class BananaCreateDealPromotionState extends Equatable {
  final StatusEnum statusEnum;
  final List<String> maxInst;
  final List<String> supportType;
  final List<String> guyhap;
  final List<String> walfare;
  final String tkIdx;


  const BananaCreateDealPromotionState({
    this.statusEnum = StatusEnum.initial,
    this.maxInst = const [],
    this.supportType = const [],
    this.guyhap = const [],
    this.walfare = const [],
    this.tkIdx = '',

  });

  BananaCreateDealPromotionState copyWith({
    StatusEnum? statusEnum,
    List<String>? maxInst,
    List<String>? supportType,
    List<String>? guyhap,
    List<String>? walfare,
    String? tkIdx,

  }) => BananaCreateDealPromotionState(
    statusEnum:  statusEnum ?? this.statusEnum,
    maxInst: maxInst ?? this.maxInst,
    supportType: supportType ?? this.supportType,
    guyhap: guyhap ?? this.guyhap,
    walfare:  walfare ?? this.walfare,
    tkIdx: tkIdx ?? this.tkIdx,

  );

  @override
  List<Object> get props => [
    statusEnum, maxInst, supportType, guyhap, walfare, tkIdx,
  ];

}