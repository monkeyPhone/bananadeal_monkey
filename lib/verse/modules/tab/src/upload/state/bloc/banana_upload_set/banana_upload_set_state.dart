part of 'banana_upload_set_bloc.dart';

final class BananaUploadSetState extends Equatable {
  final AssetEntity? currentImage;

  const BananaUploadSetState({
    this.currentImage,
  });

  BananaUploadSetState copyWith({
    AssetEntity? currentImage,
  }) =>
      BananaUploadSetState(
        currentImage: currentImage,
      );

  @override
  List<Object?> get props => [currentImage];
}
