part of 'banana_store_option_bloc.dart';

sealed class BananaStoreOptionEvent extends Equatable {
  const BananaStoreOptionEvent();

  @override
  List<Object> get props => [];

}

final class InitOption extends BananaStoreOptionEvent{
  const InitOption();
}

final class ChangeOption extends BananaStoreOptionEvent{
  final int currentSort;

  const ChangeOption(this.currentSort);


// const ChangeOption({
//   int? page,
//   required this.order,
//   OrderEnum? orderEnum,
// }) : page = page ?? 0,
//       orderEnum = orderEnum ?? OrderEnum.asc;


}

final class ChangePage1 extends BananaStoreOptionEvent{
  final int page;
  const ChangePage1(this.page);
}

final class ChangeUpdate extends BananaStoreOptionEvent{
  final bool value;

  const ChangeUpdate(this.value);
}