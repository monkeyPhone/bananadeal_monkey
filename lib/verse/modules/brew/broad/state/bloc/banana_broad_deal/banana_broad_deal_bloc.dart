import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/broad/broad_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/manager/tab_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/browser_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


part 'banana_broad_deal_event.dart';
part 'banana_broad_deal_state.dart';

class BananaBroadDealBloc extends Bloc<BananaBroadDealEvent, BananaBroadDealState> {
  final BroadRepository _repository;
  final TabManager _tab;
  final BrowserSnackbar _snackbar;
  final BrowserDialog _dialog;
  BananaBroadDealBloc({
    required BroadRepository repository,
    required TabManager tab,
    required BrowserSnackbar snackbar,
    required BrowserDialog dialog,
  }) : _repository = repository,
        _tab = tab,
        _snackbar = snackbar,
        _dialog = dialog,
        super(const BananaBroadDealState()) {

    on<InitDealData>(_initDealData);
    on<GotoModelListDetailEvent>(_gotoModelListDetailEvent);
    on<ExceptionMessageEvent>(_exceptionMessageEvent);
    on<RankTileClickEvent>(_rankTileClickEvent);
  }

  Future<void> _initDealData(InitDealData event, Emitter<BananaBroadDealState> emit) async{
    emit(state.copyWith(statusEnum: StatusEnum.loading));
    await emit.forEach(_repository.streamInitData(),
        onData: (result) => state.copyWith(
          statusEnum: result.statusEnum,
          myDealInfo: result.myDealDetail.isNotEmpty ?convertMyDealDetailVO(result.myDealDetail) : [],
          estimateList1: result.estimate1.isNotEmpty ? convertEstimateVO(result.estimate1) : [],
          estimateList2: result.estimate1.isNotEmpty ? convertEstimateVO(result.estimate1) : [],
        )

    );
  }

  Future<void> _gotoModelListDetailEvent(GotoModelListDetailEvent event, Emitter<BananaBroadDealState> emit) async {
    if(event.psIdx == '' || event.psIdx == '0'){
      add(ExceptionMessageEvent(context: event.context));
    }
    else{
      _tab.gotoModelListDetailView(
        context: event.context,
        psIdx: event.psIdx, name: event.ldcpName, isIntro: event.isIntro);
    }
  }

  Future<void> _exceptionMessageEvent(ExceptionMessageEvent event, Emitter<BananaBroadDealState> emit) async {
    _snackbar.showSnackBar(context: event.context, text: '확인할 수 없는 모델입니다.');
  }

  Future<void> _rankTileClickEvent(RankTileClickEvent event, Emitter<BananaBroadDealState> emit) async {
    final RankVO rank = event.rank;
    switch(state.statusEnum){
      case StatusEnum.success:
        add(GotoModelListDetailEvent(context: event.context, psIdx:'${ rank.psIdx}', ldcpName: rank.psName));
      default:
        _dialog.customDialogRank(rank: rank, routerContext: event.context);
    }


  }


}
