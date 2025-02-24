import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail/store_detail_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_store_detail_deal_event.dart';
part 'banana_store_detail_deal_state.dart';

class BananaStoreDetailDealBloc extends Bloc<BananaStoreDetailDealEvent, BananaStoreDetailDealState> {
  final StoreDetailRepository _repository;

  BananaStoreDetailDealBloc({
    required StoreDetailRepository repository,
  }) : _repository = repository,
        super(const BananaStoreDetailDealState()) {
    on<InitDealData>(_initDealData);
  }

  Future<void> _initDealData(InitDealData event, Emitter<BananaStoreDetailDealState> emit) async{
    await emit.forEach(
        _repository.streamInitData(),
        onData: (result){
          final StatusEnum status =
            (result.statusEnum == StatusEnum.success || result.statusEnum == StatusEnum.later)
                ? StatusEnum.success
                : StatusEnum.exception;
          List<MyDealDetailVO> myDeal = [];

          if(status == StatusEnum.success){
            myDeal.addAll(convertMyDealDetailVO(result.myDealDetail));
          }
          return state.copyWith(
            statusEnum: status,
            myDeal: myDeal,
          );
    });
  }


}
