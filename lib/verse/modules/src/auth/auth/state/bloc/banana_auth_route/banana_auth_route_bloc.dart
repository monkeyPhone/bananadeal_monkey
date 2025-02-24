

import 'package:banana_deal_by_monkeycompany/verse/core/common/route/repository/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/manager/tab_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/browser_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_auth_route_event.dart';
part 'banana_auth_route_state.dart';

class BananaAuthRouteBloc extends Bloc<BananaAuthRouteEvent, BananaAuthRouteState> {
  final BrowserDialog _dialog;
  final CommonRouteRepository _route;
  final TabManager _tab;
  BananaAuthRouteBloc({
    required BrowserDialog dialog,
    required CommonRouteRepository route,
    required TabManager tab,
  }) : _dialog = dialog,
        _route = route,
        _tab = tab, super(const BananaAuthRouteState()) {
    on<FetchProgress>(_fetchProgress);
    on<CloseSign>(_closeSign);
    on<TabClick>(_tabClick);
    on<BackSpace>(_backSpace);
  }

  Future<void> _fetchProgress(FetchProgress event, Emitter<BananaAuthRouteState> emit) async {
    emit(state.copyWith(authProgressEnum: event.authProgressEnum));
  }

  Future<void> _closeSign(CloseSign event, Emitter<BananaAuthRouteState> emit) async {
    _dialog.customDialog(
        routerContext: event.context,
        barrierDismissible: true,
        captionText: '',
        mainText: '회원가입을 종료하시겠습니까?',
        cancelText: '취소',
        confirmText: '종료',
        cancelOnTap: (){
          _route.closeDialog(event.context);
        },
        conFirmOnTap: () {
          _route.closeDialog(event.context);
          add(const FetchProgress(authProgressEnum: AuthProgressEnum.login));
        }
    );
  }


  Future<void> _tabClick(TabClick event, Emitter<BananaAuthRouteState> emit) async {
    if(state.authProgressEnum.index == event.index){

    }
    else{
      switch(state.authProgressEnum){
        case AuthProgressEnum.login:
          _tab.gotoTermsView(
              context: event.context,
              onTap: (){
                add(const FetchProgress(authProgressEnum: AuthProgressEnum.sign));
                _route.closePage(event.context);
              }
          );
        case AuthProgressEnum.sign:
          add(CloseSign(event.context));
      }
    }
  }

  Future<void> _backSpace(BackSpace event, Emitter<BananaAuthRouteState> emit) async {
    if(state.authProgressEnum == AuthProgressEnum.login){
      event.isCanPop
          ? _route.closePage(event.context)
          : _route.closeAppDialog(event.context);
    }
    else{
      add(CloseSign(event.context));
    }
  }

}
