import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/home/home_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_home_banner_event.dart';
part 'banana_home_banner_state.dart';

class BananaHomeBannerBloc extends Bloc<BananaHomeBannerEvent, BananaHomeBannerState> {
  final HomeRepository _repository;
  BananaHomeBannerBloc({
    required HomeRepository repository,
  }) : _repository = repository, super(const BananaHomeBannerState()) {
    on<HomeBannerListFetch>(_homeBannerListFetch);
  }

  Future<void> _homeBannerListFetch(HomeBannerListFetch event, Emitter<BananaHomeBannerState> emit) async{
    if(event.isLoading){
      emit(state.copyWith(statusEnum: StatusEnum.loading));
    }
    await emit.forEach(
        _repository.streamBanner(),
        onData: (result) => state.copyWith(
            statusEnum: result.statusEnum,
            bannerList: result.statusEnum == StatusEnum.success ? convertHomeBannerVO(result.data) : []
        )
    );
  }

}
