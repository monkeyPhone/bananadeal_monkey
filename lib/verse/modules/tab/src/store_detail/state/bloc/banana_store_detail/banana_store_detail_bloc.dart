import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail/store_detail_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_store_detail_event.dart';
part 'banana_store_detail_state.dart';

class BananaStoreDetailBloc extends Bloc<BananaStoreDetailEvent, BananaStoreDetailState> {
  final StoreDetailRepository _repository;
  BananaStoreDetailBloc({
    required StoreDetailRepository repository,
  }) : _repository = repository, super(const BananaStoreDetailState()) {
    on<StoreDetailGetInfo>(_storeDetailGetInfo);
    on<UpdateFavorite>(_updateFavorite);
  }

  Future<void> _storeDetailGetInfo(StoreDetailGetInfo event, Emitter<BananaStoreDetailState> emit) async{
    await emit.forEach(
        _repository.getData(),
        onData: (result) {
          if(result.statusEnum == StatusEnum.success){
            final StoreDetailVO detail = convertStoreDetailVO(result.data).first;
            final bool isBookmark = detail.favoriteStore == 0 ? false : true;
            final List<String> imageList = _repository.calculateImage(detail);
            final List<(String, String)> eventList = _repository.calculateEvent(detail);
            final (bool ,bool, String) openInfo = _repository.calculateTime(detail);
            return state.copyWith(
              statusEnum: result.statusEnum,
              detailVO: detail,
              isBookmark: isBookmark,
              imageList: imageList,
              eventList: eventList,
              openInfo: openInfo,
            );
          }
          else{
            return state.copyWith(statusEnum: result.statusEnum, detailVO: ModelConfig.storeDetailVO);
          }

        }
    );
  }

  Future<void> _updateFavorite(UpdateFavorite event, Emitter<BananaStoreDetailState> emit) async{
    final bool result = await _repository.sendFavorite(
        isFavorite: state.isBookmark,
    );
    if(result){
      emit(state.copyWith(isBookmark: !state.isBookmark));
    }
  }



}
