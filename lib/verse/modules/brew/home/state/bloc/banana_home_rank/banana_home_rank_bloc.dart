import 'package:banana_deal_by_monkeycompany/package/data/broad/rank_all_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/home/home_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/manager/tab_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_home_rank_event.dart';
part 'banana_home_rank_state.dart';

class BananaHomeRankBloc extends Bloc<BananaHomeRankEvent, BananaHomeRankState> {
  final HomeRepository _repository;
  final TabManager _tab;
  BananaHomeRankBloc({
    required HomeRepository repository,
    required TabManager tab,
  }) : _repository = repository,
        _tab = tab, super(const BananaHomeRankState()) {
    on<GetHomeRank>(_getHomeRank);
    on<GotoRankAll>(_gotoRankAll);
  }

  Future<void> _getHomeRank(GetHomeRank event, Emitter<BananaHomeRankState> emit) async{
    if(event.isLoading){
      emit(state.copyWith(status: StatusEnum.loading));
    }
    await emit.forEach(_repository.streamRank(),
        onData: (result) {
          final List<RankAllVO> list = convertRankAllVO(result.data);
          final RankAllVO allVO = list.first;
          if(allVO.all.isEmpty){
            return state.copyWith(status: StatusEnum.exception,
            );
          }
          else{
            if(result.tokenError){
              return state.copyWith(status: StatusEnum.token);
            }
            else{
              return state.copyWith(
                  status: result.statusEnum,
                  rankAll: allVO.all,
                  rankPremium: allVO.premium,
                  rankHigh: allVO.high,
                  rankNormal: allVO.normal,
                  rankWorthy: allVO.worthy
              );
            }
          }
        },
        onError: (error, stackTrace) => state.copyWith(
            status: StatusEnum.error
        )
    );
  }

  Future<void> _gotoRankAll(GotoRankAll event, Emitter<BananaHomeRankState> emit) async {
    _tab.gotoRankAllView(
        context: event.context, listClickCallback: event.callback,
        rankAll: state.rankAll,
        rankPremium: state.rankPremium,
        rankHigh: state.rankHigh,
        rankNormal: state.rankNormal,
        rankWorthy: state.rankWorthy
    );
  }

}
