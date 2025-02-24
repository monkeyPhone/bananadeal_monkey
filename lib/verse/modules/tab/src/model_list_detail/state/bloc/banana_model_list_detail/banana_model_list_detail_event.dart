part of 'banana_model_list_detail_bloc.dart';

sealed class BananaModelListDetailEvent extends Equatable{
  const BananaModelListDetailEvent();

  @override
  List<Object> get props => [];

}

final class InitModelDetail extends BananaModelListDetailEvent{
  final String psIdx;
  const InitModelDetail({
    required this.psIdx
  });

}

final class ChangeDetailEnum extends BananaModelListDetailEvent{
  final ModelDetailEnum modelDetailEnum;
  const ChangeDetailEnum(this.modelDetailEnum);
}

final class ChangeColorIndex extends BananaModelListDetailEvent{
  final int currentIndex;
  const ChangeColorIndex(this.currentIndex);
}