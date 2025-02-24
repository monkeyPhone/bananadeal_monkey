part of 'banana_estimate_option_bloc.dart';

final class BananaEstimateOptionState extends Equatable {
  final StatusEnum statusEnum;
  final int page;
  final int current;
  final bool isUpdate;
  final String dStatus;

  const BananaEstimateOptionState({
    this.statusEnum = StatusEnum.initial,
    this.page = 0,
    this.current = 0,
    this.isUpdate = true,
    this.dStatus = '',
  });

  BananaEstimateOptionState copyWith({
    StatusEnum? statusEnum,
    int? page,
    int? current,
    bool? isUpdate,
    String? dStatus,
  }) => BananaEstimateOptionState(
    statusEnum: statusEnum ?? this.statusEnum,
    page: page ?? this.page,
    current: current ?? this.current,
    isUpdate: isUpdate ?? this.isUpdate,
    dStatus: dStatus ?? this.dStatus
  );

  @override
  List<Object> get props => [statusEnum, page, current, isUpdate, dStatus];
}
