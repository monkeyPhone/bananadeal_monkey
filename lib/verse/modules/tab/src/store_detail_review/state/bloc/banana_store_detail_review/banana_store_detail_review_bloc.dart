import 'package:banana_deal_by_monkeycompany/package/data/store/store_review_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail_review/store_detail_review_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_store_detail_review_event.dart';
part 'banana_store_detail_review_state.dart';

class BananaStoreDetailReviewBloc extends Bloc<BananaStoreDetailReviewEvent, BananaStoreDetailReviewState> {
  final StoreDetailReviewRepository _repository;
  BananaStoreDetailReviewBloc({
    required StoreDetailReviewRepository repository
  }) : _repository = repository, super(const BananaStoreDetailReviewState()) {
    on<FirstData>(_firstData);
    on<GetData>(_getData);
  }

  Future<void> _firstData(FirstData event, Emitter<BananaStoreDetailReviewState> emit) async{
    final DataDto data = await _repository.getData(
      smMid: event.smId,
      mIdx: event.mIdx,
      page: event.page,
      length: event.length,
    );
    emit(state.copyWith(statusEnum: data.statusEnum, reviewList: convertStoreReviewVO(data.data)));
  }

  Future<void> _getData(GetData event, Emitter<BananaStoreDetailReviewState> emit) async{
    List<StoreReviewVO> current = state.reviewList;
    current.addAll(event.value);
    emit(state.copyWith(reviewList: current));
  }

}
