import 'dart:developer';
import 'dart:typed_data';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';



part 'banana_browser_image_event.dart';
part 'banana_browser_image_state.dart';

class BananaBrowserImageBloc extends Bloc<BananaBrowserImageEvent, BananaBrowserImageState> {
  BananaBrowserImageBloc() : super(const BananaBrowserImageState()) {
    on<GetImageListBBIE>(_getImageListBBIE);
    on<ChangeIndexBBIE>(_changeIndexBBIE);
    on<DownLoadImageBBIE>(_downloadImageBBIE);
    on<DownLoadCloseBBIE>(_downloadCloseBBIE);
  }

  Future<void> _getImageListBBIE(GetImageListBBIE event, Emitter<BananaBrowserImageState> emit) async{
    emit(
        state.copyWith(
            currentIndex: event.currentIndex,
            imageList: event.imageList
        )
    );
  }

  Future<void> _changeIndexBBIE(ChangeIndexBBIE event, Emitter<BananaBrowserImageState> emit) async{
    emit(state.copyWith(currentIndex: event.currentIndex));
  }

  //TODO: Go 이거 퀄리티 조정해야됨 80정도면 픽셀이 보임
  Future<void> _downloadImageBBIE(DownLoadImageBBIE event, Emitter<BananaBrowserImageState> emit) async{
    Dio dio = Dio();
    emit(
        state.copyWith(downloadState: DownLoadEnum.loading)
    );
    String url = '${event.baseUrl}${state.imageList[state.currentIndex]}';
    try{
      final response = await dio.get(
          url,
          options: Options(responseType: ResponseType.bytes),
          onReceiveProgress: (rec, total){
            emit(state.copyWith(value: "${((rec / total) * 100).toStringAsFixed(0)}%"));
          }
      );
      await ImageGallerySaverPlus.saveImage(Uint8List.fromList(response.data), quality: 100);
      await Future.delayed(const Duration(milliseconds: 40),);
      emit(state.copyWith(value: '다운로드 성공', downloadState: DownLoadEnum.success));
      await Future.delayed(const Duration(seconds: 1),);
      dio.close();
      emit(state.copyWith(value: '', downloadState: DownLoadEnum.initial));
    } catch(e){
      log(e.toString());
      emit(state.copyWith(value: "기간이 만료된 이미지입니다.", downloadState: DownLoadEnum.fail));
      await Future.delayed(const Duration(seconds: 5),);
      dio.close();
      emit(state.copyWith(value: '', downloadState: DownLoadEnum.initial));

    }
  }

  Future<void> _downloadCloseBBIE(DownLoadCloseBBIE event, Emitter<BananaBrowserImageState> emit) async {
    emit(state.copyWith(value: '', downloadState: DownLoadEnum.initial));
  }

}
