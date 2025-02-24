import 'package:banana_deal_by_monkeycompany/package/repository/upload/upload_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_upload_crop_event.dart';
part 'banana_upload_crop_state.dart';

class BananaUploadCropBloc extends Bloc<BananaUploadCropEvent, BananaUploadCropState> {
  final UploadRepository _repository;

  BananaUploadCropBloc(UploadRepository repository) :
        _repository = repository,
        super(const BananaUploadCropState()) {
    on<BananaUploadCropCropImage>(_cropImage);
    on<BananaUploadCropCropInit>(_cropInit);
  }

  Future<void> _cropImage(BananaUploadCropCropImage event, Emitter<BananaUploadCropState> emit) async{
    await emit.forEach(_repository.streamCropImage(caseUpload: event.caseUpload, selectImagePath: event.currentImagePath),
        onData: (result) => state.copyWith(croppedFilePath: result.imageUrl, imageSize: result.imageSize, canSize: result.isCanUpload, msg: result.msg)
    );
  }

  Future<void> _cropInit(BananaUploadCropCropInit event, Emitter<BananaUploadCropState> emit) async{
    emit(state.copyWith(croppedFilePath: '', canSize: false, imageSize: ''));
  }

}