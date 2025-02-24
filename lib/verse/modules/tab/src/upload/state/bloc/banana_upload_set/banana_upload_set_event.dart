part of 'banana_upload_set_bloc.dart';

sealed class BananaUploadSetEvent extends Equatable{
  const BananaUploadSetEvent();

  @override
  List<Object> get props => [];
}



final class BananaUploadSetSelectImage extends BananaUploadSetEvent {
  final AssetEntity? photo;
  const BananaUploadSetSelectImage(this.photo);
}