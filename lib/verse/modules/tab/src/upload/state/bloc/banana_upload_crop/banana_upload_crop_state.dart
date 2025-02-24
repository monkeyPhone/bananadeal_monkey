part of 'banana_upload_crop_bloc.dart';

final class BananaUploadCropState extends Equatable {
  final String croppedFilePath;
  final String imageSize;
  final String msg;
  final bool canSize;

  const BananaUploadCropState({
    this.croppedFilePath = '',
    this.imageSize = '',
    this.msg = '',
    this.canSize = false,
  });

  BananaUploadCropState copyWith({
    String? croppedFilePath,
    String? imageSize,
    String? msg,
    bool? canSize,
  }) =>
      BananaUploadCropState(
        croppedFilePath: croppedFilePath ?? this.croppedFilePath,
        imageSize:  imageSize ?? this.imageSize,
        msg: msg ?? this.msg,
        canSize: canSize ?? this.canSize,
      );

  @override
  List<Object?> get props => [croppedFilePath, imageSize, msg, canSize];
}