part of 'banana_upload_bloc.dart';

final class BananaUploadState extends Equatable {
  final bool loading;
  final UploadEnum caseUpload;
  final List<AssetPathEntity> albums;
  final AssetPathEntity? currentAlbums;
  final List<AssetEntity> assetList;
  final int currentPage;
  // final AssetEntity? currentImage;
  // final String croppedFilePath;
  final bool isLimit;

  const BananaUploadState({
    this.loading = false,
    this.caseUpload = UploadEnum.none,
    this.albums = const [],
    this.currentAlbums,
    this.assetList = const [],
    // this.currentImage,
    // this.croppedFilePath = '',
    this.currentPage = 1,
    this.isLimit = false,
  });

  BananaUploadState copyWith({
    bool? loading,
    BuildContext? routerContext,
    UploadEnum? caseUpload,
    List<AssetPathEntity>? albums,
    AssetPathEntity? currentAlbums,
    List<AssetEntity>? assetList,
    int? currentPage,
    // AssetEntity? currentImage,
    // String? croppedFilePath,
    bool? isLimit,
  }) =>
      BananaUploadState(
        loading: this.loading,
        caseUpload: caseUpload ?? this.caseUpload,
        albums: albums ?? this.albums,
        currentAlbums: currentAlbums,
        assetList: assetList ?? this.assetList,
        currentPage: currentPage ?? this.currentPage,
        // currentImage: currentImage,
        // croppedFilePath: croppedFilePath ?? this.croppedFilePath,
        isLimit: isLimit ?? this.isLimit,
      );

  @override
  List<Object?> get props => [loading, albums, currentAlbums, caseUpload, currentPage, assetList, isLimit];
}

