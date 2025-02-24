part of 'banana_upload_crop_bloc.dart';

sealed class BananaUploadCropEvent extends Equatable {
  const BananaUploadCropEvent();

  @override
  List<Object> get props => [];
}

final class BananaUploadCropCropImage extends BananaUploadCropEvent {
  final UploadEnum caseUpload;
  final String currentImagePath;

  const BananaUploadCropCropImage({
    required this.caseUpload,
    required this.currentImagePath,
  });

}

final class BananaUploadCropCropInit extends BananaUploadCropEvent{
  const BananaUploadCropCropInit();
}