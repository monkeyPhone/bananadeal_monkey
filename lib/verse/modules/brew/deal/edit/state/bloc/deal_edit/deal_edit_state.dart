part of 'deal_edit_bloc.dart';

final class DealEditState extends Equatable{
  final StatusEnum status;
  final List<MyDealListVO> dealList;
  final List<MyDealListVO> deleteList;

  const DealEditState({
    this.status = StatusEnum.initial,
    this.dealList = const [],
    this.deleteList = const []
  });

  DealEditState copyWith({
    StatusEnum? status,
    List<MyDealListVO>? dealList,
    List<MyDealListVO>? deleteList
  }) => DealEditState(
      status: status ?? this.status,
      dealList: dealList ?? this.dealList,
      deleteList: deleteList ?? this.deleteList
  );

  @override
  List<Object> get props => [status, dealList, deleteList];
}
