part of 'banana_invite_deal_option_bloc.dart';

final class BananaInviteDealOptionState extends Equatable {
  final StatusEnum statusEnum;
  final int storeLength;
  final bool isAll;
  final List<StoreVO> selectList;
  final int page;
  final bool isUpdate;

  const BananaInviteDealOptionState({
    this.statusEnum = StatusEnum.initial,
    this.storeLength = 0,
    this.isAll = false,
    this.selectList = const [],
    this.page = 0,
    this.isUpdate = true
  });

  BananaInviteDealOptionState copyWith({
    StatusEnum? statusEnum,
    int? storeLength,
    bool? isAll,
    List<StoreVO>? selectList,
    int? page,
    bool? isUpdate,
  }) => BananaInviteDealOptionState(
      statusEnum: statusEnum ?? this.statusEnum,
      storeLength: storeLength ?? this.storeLength,
      isAll: isAll ?? this.isAll,
      selectList: selectList ?? this.selectList,
      page: page ?? this.page,
      isUpdate: isUpdate ?? this.isUpdate
  );


  @override
  List<Object> get props => [statusEnum, storeLength, isAll, selectList, page, isUpdate];
}
