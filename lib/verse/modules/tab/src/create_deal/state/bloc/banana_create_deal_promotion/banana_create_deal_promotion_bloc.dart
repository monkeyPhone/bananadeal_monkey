import 'package:banana_deal_by_monkeycompany/package/repository/monkey/promotion/promotion_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_create_deal_promotion_event.dart';
part 'banana_create_deal_promotion_state.dart';

class BananaCreateDealPromotionBloc extends Bloc<BananaCreateDealPromotionEvent, BananaCreateDealPromotionState> {
  final PromotionRepository _repository;
  BananaCreateDealPromotionBloc({
    required PromotionRepository repository
  }) : _repository = repository, super(const BananaCreateDealPromotionState()) {
    on<InitPromotion>(_initInfo);
  }

  Future<void> _initInfo(InitPromotion event, Emitter<BananaCreateDealPromotionState> emit) async{
    await emit.forEach(_repository.initInfo(tkIdx: event.tkIdx, psIdx: event.psIdx),
        onData: (result) => state.copyWith(
          statusEnum: result.$1,
          maxInst: result.$2,
          supportType: result.$3,
          guyhap: result.$4,
          walfare: result.$5,
          tkIdx: event.tkIdx,
        )
    );
  }


}
