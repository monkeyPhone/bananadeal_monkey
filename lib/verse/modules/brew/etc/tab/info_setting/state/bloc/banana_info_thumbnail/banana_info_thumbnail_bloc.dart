import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/info_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_info_thumbnail_event.dart';
part 'banana_info_thumbnail_state.dart';

class BananaInfoThumbnailBloc extends Bloc<BananaInfoThumbnailEvent, BananaInfoThumbnailState> {
  final InfoEditRepository _repository;
  BananaInfoThumbnailBloc({
    required InfoEditRepository repository
  }) : _repository = repository, super(const BananaInfoThumbnailState()) {
    on<InitThumbNail>(_initThumbNail);
    on<UpdateThumbNailUrl>(_updateThumbNailUrl);
    on<FetchThumbNailUrl>(_fetchThumbNailUrl);
  }

  Future<void> _initThumbNail(InitThumbNail event, Emitter<BananaInfoThumbnailState> emit) async{
    emit(state.copyWith(
      statusEnum: StatusEnum.initial,
      fetchUrl: '',
    ));
  }

  Future<void> _updateThumbNailUrl(UpdateThumbNailUrl event, Emitter<BananaInfoThumbnailState> emit) async{
    emit(state.copyWith(fetchUrl: event.url));
  }

  Future<void> _fetchThumbNailUrl(FetchThumbNailUrl event, Emitter<BananaInfoThumbnailState> emit) async{
    final StatusEnum status = await _repository.fetchThumbnail(eMail: event.mEmail, originImage: event.mPathImg, imageUrl: state.fetchUrl);
    emit(state.copyWith(statusEnum: status));
  }

}
