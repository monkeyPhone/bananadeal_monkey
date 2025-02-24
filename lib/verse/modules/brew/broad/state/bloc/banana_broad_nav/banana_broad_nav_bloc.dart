import 'package:banana_deal_by_monkeycompany/verse/core/common/route/repository/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_broad_nav_event.dart';
part 'banana_broad_nav_state.dart';

class BananaBroadNavBloc extends Bloc<BananaBroadNavEvent, BananaBroadNavState> {
  final CommonRouteRepository _route;
  BananaBroadNavBloc({
    required CommonRouteRepository route,
  }) : _route = route, super(const BananaBroadNavState()) {
    on<ChangePage>(_changePage);
    on<BackSpace>(_backSpace);
  }

  Future<void> _changePage(ChangePage event, Emitter<BananaBroadNavState> emit) async{
    if(state.currentPage != event.page){
      emit(state.copyWith(currentPage: event.page));
    }

  }

  Future<void> _backSpace(BackSpace event, Emitter<BananaBroadNavState> emit) async {
    if(state.currentPage == NavEnum.home){
      _route.closeAppDialog(event.context);
    }
  }

}
