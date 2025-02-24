import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/rank_total/rank_total_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rank_all/const/rank_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_rank_all_event.dart';
part 'banana_rank_all_state.dart';

class BananaRankAllBloc extends Bloc<BananaRankAllEvent, BananaRankAllState> {
  final RankTotalRepository _repository;

  BananaRankAllBloc({
    required RankTotalRepository repository,

  }) : _repository = repository, super(const BananaRankAllState()) {
    on<GetAllRank>(_getAllRank);
    on<ChangeCategory>(_changeCategory);
    on<ChangeList>(_changeList);
  }

  Future<void> _getAllRank(GetAllRank event, Emitter<BananaRankAllState> emit) async{
    emit(state.copyWith(
        rankAll: event.rankAll,
        rankPremium: event.rankPremium,
        rankHigh: event.rankHigh,
        rankNormal: event.rankNormal,
        rankWorthy: event.rankWorthy
    ));
  }


  Future<void> _changeCategory(ChangeCategory event, Emitter<BananaRankAllState> emit) async{
    emit(state.copyWith(rankEnum: event.rankEnum,));
  }



  Future<void> _changeList(ChangeList event, Emitter<BananaRankAllState> emit) async{
    int result = state.isList == 0 ? 1 : 0;
    emit(state.copyWith(isList: result));
  }





}
