part of 'banana_rate_list_bloc.dart';

sealed class BananaRateListEvent extends Equatable {
  const BananaRateListEvent();

  @override
  List<Object> get props => [];
}

final class InitRateList extends BananaRateListEvent{
  final (String psIdx, String tkIdx) initInfo;

  const InitRateList(this.initInfo);

}

final class ChangeCategory extends BananaRateListEvent{
  final int index;
  const ChangeCategory(this.index);
}

final class ChangeSort extends BananaRateListEvent{
  final int index;
  const ChangeSort(this.index);
}
