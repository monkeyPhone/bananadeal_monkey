import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/intro/intro_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/package/data/intro_image_vo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_intro_event.dart';
part 'banana_intro_state.dart';

class BananaIntroBloc extends Bloc<BananaIntroEvent, BananaIntroState> {
  final IntroRepository _repository;

  BananaIntroBloc({
    required IntroRepository repository
  }) : _repository = repository, super(const BananaIntroState()) {
    on<BananaIntroImageFetched>(_bananaIntroImageFetched);
    on<BananaIntroImageIndex>(_bananaIntroImageIndex);
  }

  Future<void> _bananaIntroImageFetched(BananaIntroImageFetched event, Emitter<BananaIntroState> emit) async{
    await emit.forEach(_repository.getImageList(),
        onData: (result) {
          if(!(result.statusEnum == StatusEnum.success || result.statusEnum == StatusEnum.later))
          {
            add(const BananaIntroImageIndex(index: 0));
          }
          final StatusEnum status = result.statusEnum;
          List<String> imageList = [];
          if(status == StatusEnum.success){
            final List<IntroImageVO> voList = convertIntroImageVO(result.data);
            final List<String> convertList = voList.map((e) => e.aiiPathImg).toList();
            imageList.addAll(convertList);
          }
          final JsonError error = result.error == null
              ? ModelConfig.jsonError
              : result.error!;
          return state.copyWith(
            statusEnum: status,
            imageList: imageList,
            error: error
          );
        }
    );
  }

  Future<void> _bananaIntroImageIndex(BananaIntroImageIndex event, Emitter<BananaIntroState> emit) async {
    emit(
        state.copyWith(
            currentIndex: event.index
        )
    );
  }

}
