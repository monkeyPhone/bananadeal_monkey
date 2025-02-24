part of 'banana_model_list_bloc.dart';

sealed class BananaModelListEvent extends Equatable {
  const BananaModelListEvent();

  @override
  List<Object> get props => [];
}

final class InitModelList extends BananaModelListEvent {
  final String tkIdx;

  const InitModelList({
    required this.tkIdx,

  });

}

final class ChangeIndex extends BananaModelListEvent {
  final int index;

  const ChangeIndex(this.index);
}

final class ChangeSort extends BananaModelListEvent {
  final int index;

  const ChangeSort(this.index);
}