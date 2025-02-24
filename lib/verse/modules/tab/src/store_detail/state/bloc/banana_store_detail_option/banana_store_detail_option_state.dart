part of 'banana_store_detail_option_bloc.dart';

final class BananaStoreDetailOptionState extends Equatable {
  final int currentIndex;
  final bool isUpdate;

  const BananaStoreDetailOptionState({
    this.currentIndex = 0,
    this.isUpdate = false,
  });

  BananaStoreDetailOptionState copyWith({
    int? currentIndex,
    bool? isUpdate
  }) => BananaStoreDetailOptionState(
    currentIndex: currentIndex ?? this.currentIndex,
    isUpdate: isUpdate ?? this.isUpdate,
  );

  @override
  List<Object> get props => [
    currentIndex,
    isUpdate
  ];

}