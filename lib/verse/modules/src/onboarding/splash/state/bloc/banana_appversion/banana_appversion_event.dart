part of 'banana_appversion_bloc.dart';

sealed class BananaAppversionEvent extends Equatable{
  const BananaAppversionEvent();

  @override
  List<Object> get props => [];
}

final class VersionFetched extends BananaAppversionEvent {
  const VersionFetched();
}
