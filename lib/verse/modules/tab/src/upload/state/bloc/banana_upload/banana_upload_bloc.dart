import 'package:banana_deal_by_monkeycompany/package/repository/upload/upload_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';


part 'banana_upload_event.dart';
part 'banana_upload_state.dart';

class BananaUploadBloc extends Bloc<BananaUploadEvent, BananaUploadState> {
  final UploadRepository _repository;

  BananaUploadBloc({
    required UploadRepository repository
  }) :
        _repository = repository,

        super(const BananaUploadState()) {
    on<BananaUploadFetchUploadImageListInit>(_fetchUploadImageListInit);
    on<BananaUploadSelectAlbum>(_selectAlbum);
    on<BananaUploadFetchMoreImageList>(_fetchMoreImageList);
    on<BananaUploadCrackImage>(_crackImage);
    on<BananaUploadCheckEmit>(_checkEmit);
  }

  // void _onScroll() {
  //   // 리스너에서 이벤트 추가
  //   if(scrollController.position.maxScrollExtent == scrollController.position.pixels){
  //     add(const SetController());
  //   }
  // }
  //
  //
  // Future<void> _setController(SetController event , Emitter<BananaUploadState> emit) async{
  //   (List<AssetEntity>, bool) result = await  _repository.mixinMorePhoto(album: state.currentAlbums!, currentPage: state.currentPage+1);
  //   if(result.$2){
  //     List<AssetEntity> entities = state.assetList;
  //     entities.addAll(result.$1);
  //     emit(state.copyWith(currentAlbums: state.currentAlbums, assetList: entities, currentPage: state.currentPage+1));
  //   }


  // _repository.mixinMorePhoto(album: state.currentAlbums!, currentPage: state.currentPage).then((value) {
  //   if(value.$2){
  //     List<AssetEntity> entities = state.assetList;
  //     entities.addAll(value.$1);
  //     emit(state.copyWith(currentAlbums: state.currentAlbums, assetList: entities, currentPage: state.currentPage+1));
  //   }
  // });


  //}

  Future<void> _checkEmit(BananaUploadCheckEmit event  , Emitter<BananaUploadState> emit) async{
    final isLimit = await _repository.checkLimit();
    emit(state.copyWith(isLimit: isLimit));
  }


  Future<void> _fetchUploadImageListInit(BananaUploadFetchUploadImageListInit event, Emitter<BananaUploadState> emit) async{
    add(const BananaUploadCheckEmit());
    await emit.forEach(_repository.streamLoadPhotos(),
        onData: (result) => state.copyWith(
            albums: result.$1,
            currentAlbums: result.$1.first,
            assetList: result.$2,
            caseUpload: event.caseUpload,
        )
    );
  }

  Future<void> _selectAlbum(BananaUploadSelectAlbum event,
      Emitter<BananaUploadState> emit) async {
    await emit.forEach(_repository.streamLoadPhotosChange(event.album), onData: (result) =>
        state.copyWith(
            assetList: result,
            currentAlbums: event.album,
            currentPage: 1
        )
    );
  }

  Future<void> _fetchMoreImageList(BananaUploadFetchMoreImageList event, Emitter<BananaUploadState> emit) async {
    List<AssetEntity> entities = state.assetList;
    entities.addAll(event.album);
    emit(state.copyWith(currentAlbums: state.currentAlbums, assetList: state.assetList, currentPage: state.currentPage+1));
  }

  Future<void>_crackImage(BananaUploadCrackImage event, Emitter<BananaUploadState> emit) async {
    final isLimit = await _repository.checkLimit();
    emit(state.copyWith(isLimit: isLimit));
    await emit.forEach(_repository.streamLoadPhotos(),
        onData: (result) => state.copyWith(
          albums: result.$1,
          currentAlbums: result.$1.first,
          assetList: result.$2,
        )
    );
  }

}
