part of 'banana_appversion_bloc.dart';

final class BananaAppversionState extends Equatable {
  final SplashVO splashVO;

  const BananaAppversionState({
    this.splashVO = ModelConfig.splashVO
  });

  BananaAppversionState copyWith({
    SplashVO? splashVO,
  }) {
    return BananaAppversionState(
        splashVO: splashVO ?? this.splashVO
    );
  }

  @override
  List<Object> get props => [splashVO];

}
