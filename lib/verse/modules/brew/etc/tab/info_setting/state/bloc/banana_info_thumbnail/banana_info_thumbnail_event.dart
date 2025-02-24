part of 'banana_info_thumbnail_bloc.dart';

sealed class BananaInfoThumbnailEvent extends Equatable {
  const BananaInfoThumbnailEvent();

  @override
  List<Object> get props => [];
}

final class InitThumbNail extends BananaInfoThumbnailEvent{
  const InitThumbNail();
}

final class UpdateThumbNailUrl extends BananaInfoThumbnailEvent{
  final String url;
  const UpdateThumbNailUrl({
    required this.url
  });
}

final class FetchThumbNailUrl extends BananaInfoThumbnailEvent{
  final String mPathImg;
  final String mEmail;
  const FetchThumbNailUrl({
    required this.mPathImg,
    required this.mEmail
  });
}