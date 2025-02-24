import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

part 'banana_upload_set_event.dart';
part 'banana_upload_set_state.dart';

class BananaUploadSetBloc extends Bloc<BananaUploadSetEvent, BananaUploadSetState> {
  BananaUploadSetBloc() : super(const BananaUploadSetState()) {
    on<BananaUploadSetSelectImage>(_selectImage);

  }

  Future<void> _selectImage(BananaUploadSetSelectImage event,
      Emitter<BananaUploadSetState> emit) async {
    emit(
        state.copyWith(currentImage: event.photo)
    );
  }

}

