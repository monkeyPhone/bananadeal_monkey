part of 'banana_upload_bloc.dart';

sealed class BananaUploadEvent extends Equatable{
  const BananaUploadEvent();

  @override
  List<Object> get props => [];
}

final class BananaUploadCheckEmit extends BananaUploadEvent {
  const BananaUploadCheckEmit();
}

final class BananaUploadFetchUploadImageListInit extends BananaUploadEvent {
  final UploadEnum caseUpload;
  const BananaUploadFetchUploadImageListInit({
    required this.caseUpload
  });
}

final class BananaUploadFetchMoreImageList extends BananaUploadEvent {
  final List<AssetEntity>  album;
  const BananaUploadFetchMoreImageList({
    required this.album
  });
}

final class BananaUploadFetchUploadImageList extends BananaUploadEvent {
  const BananaUploadFetchUploadImageList();
}

final class BananaUploadSelectAlbum extends BananaUploadEvent {
  final AssetPathEntity album;

  const BananaUploadSelectAlbum({
    required this.album,

  });
}

final class BananaUploadCrackImage extends BananaUploadEvent {
  const BananaUploadCrackImage();
}
