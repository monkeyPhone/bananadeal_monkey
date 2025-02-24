part of 'banana_info_thumbnail_bloc.dart';

final class BananaInfoThumbnailState extends Equatable {
  final StatusEnum statusEnum;
  final String fetchUrl;
  const BananaInfoThumbnailState({
    this.statusEnum = StatusEnum.initial,
    this.fetchUrl = '',
  });

  BananaInfoThumbnailState copyWith({
    StatusEnum? statusEnum,
    String? fetchUrl,
  }) => BananaInfoThumbnailState(
      statusEnum: statusEnum ?? this.statusEnum,
      fetchUrl: fetchUrl ?? this.fetchUrl
  );

  @override
  List<Object> get props => [statusEnum, fetchUrl];
}
