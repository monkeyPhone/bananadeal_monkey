part of 'banana_store_detail_option_bloc.dart';

sealed class BananaStoreDetailOptionEvent extends Equatable {
  const BananaStoreDetailOptionEvent();

  @override
  List<Object> get props => [];

}

final class InitDetailOption extends BananaStoreDetailOptionEvent{
  const InitDetailOption();

}


final class ChangeTap extends BananaStoreDetailOptionEvent{
  final int index;
  const ChangeTap({
    required this.index
  });
}

final class ChangeState extends BananaStoreDetailOptionEvent{
  final bool value;
  const ChangeState({
    required this.value
  });
}
