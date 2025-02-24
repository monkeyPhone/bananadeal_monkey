part of 'banana_intro_bloc.dart';

sealed class BananaIntroEvent extends Equatable {
  const BananaIntroEvent();

  @override
  List<Object> get props => [];
}

final class BananaIntroImageFetched extends BananaIntroEvent {
  const BananaIntroImageFetched();
}

final class BananaIntroImageIndex extends BananaIntroEvent {
  final int index;
  const BananaIntroImageIndex({
    required this.index
  });
}