part of 'banana_invite_deal_option_bloc.dart';

sealed class BananaInviteDealOptionEvent extends Equatable {

  const BananaInviteDealOptionEvent();

  @override
  List<Object> get props => [];
}

final class GetStoreLength extends BananaInviteDealOptionEvent{
  const GetStoreLength();
}

final class InitOption extends BananaInviteDealOptionEvent{
  const InitOption();
}

final class FetchPage extends BananaInviteDealOptionEvent{
  final int page;
  final bool isUpdate;
  const FetchPage({
    required this.page,
    required this.isUpdate,
  });
}



final class OptionIsAllChange extends BananaInviteDealOptionEvent {
  final bool value;
  const OptionIsAllChange({
    required this.value
  });

}

final class FetchSelectListAll extends BananaInviteDealOptionEvent{
  final List<StoreVO> valueList;
  const FetchSelectListAll({
    required this.valueList
  });
}


final class FetchSelectList extends BananaInviteDealOptionEvent{
  final StoreVO value;
  const FetchSelectList(this.value);
}
