import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/data/bootstrap/user_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/common/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/bootstrap/route/bloc/repository/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/bootstrap/route/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_route_event.dart';
part 'banana_route_state.dart';

class BananaRouteBloc extends Bloc<BananaRouteEvent, BananaRouteState> {
  final RouteRepository _repository;
  BananaRouteBloc({
    required RouteRepository repository
  }) : _repository = repository, super(const BananaRouteState()) {
    on<RouteAdsAction>(_routeAdsAction);
    on<RoutePermissionAction>(_routePermissionAction);
    on<RouteSplashAction>(_routeSplashAction);
    on<RouteAuthAction>(_routeAuthAction);
    on<RouteHomeAction>(_routeHomeAction);
    on<RouteErrorAction>(_routeErrorAction);
    on<RouteInfoUpdateAction>(_routeInfoUpdateAction);
    on<RouteLogoutAction>(_routeLogoutAction);
  }

  Future<void> _routeAdsAction(RouteAdsAction event, Emitter<BananaRouteState> emit) async {
    emit(state.copyWith(appRouter: RouterEnum.adsDelay, userVO: ModelConfig.userVO));
    final int delay = await _repository.setPosition();
    if (kDebugMode) {
      print(delay);
    }
    final int milliseconds = delay >= 5000 ? 0 : 5000 - delay;
    await Future.delayed(Duration(milliseconds: milliseconds));
    add(const RoutePermissionAction());
  }

  Future<void> _routePermissionAction(RoutePermissionAction event, Emitter<BananaRouteState> emit) async {
    final bool isNext = await _repository.getPermission();
    switch(isNext){
      case true:
        add(const RouteSplashAction());
      case false:
        emit(state.copyWith(appRouter: RouterEnum.pagePermission));
    }
  }

  Future<void> _routeSplashAction(RouteSplashAction event, Emitter<BananaRouteState> emit) async {
    final bool isNext = await _repository.splashRouting();
    switch(isNext){
      case true:
        add(const RouteAuthAction());
      case false:
        emit(state.copyWith(appRouter: RouterEnum.pageSplash));
    }
  }

  Future<void> _routeAuthAction(RouteAuthAction event, Emitter<BananaRouteState> emit) async {
    final String token = await _repository.getToken();
    switch(token){
      case '':
        emit(state.copyWith(appRouter: RouterEnum.pagAuthIntro));
      default:
        add(const RouteInfoUpdateAction());
        add(RouteHomeAction(token: token));
    }
  }

  Future<void> _routeHomeAction(RouteHomeAction event, Emitter<BananaRouteState> emit) async {
    if(event.token == ''){
      emit(state.copyWith(appRouter: RouterEnum.home));
    }
    await emit.forEach(_repository.getInfoHive(),
        onData: (result){
          if(result == ''){
            add(const RouteAuthAction());
            return state.copyWith();
          }
          else{
            final UserVO userVO =  userVOFromJson(result);
            if(userVO.mName == ''){
              return state.copyWith(appRouter: RouterEnum.userInfo);
            }
            else if(userVO.mIsUsed == '이용정지'){
              return state.copyWith(appRouter: RouterEnum.userStop);
            }
            else {
              return state.copyWith(appRouter: RouterEnum.home);
            }
          }
        }
    );
  }

  Future<void> _routeErrorAction(RouteErrorAction event, Emitter<BananaRouteState> emit) async {
    emit(state.copyWith(appRouter: RouterEnum.error));
  }


  Future<void> _routeLogoutAction(RouteLogoutAction event, Emitter<BananaRouteState> emit) async {
    final int idx = state.userVO.mIdx;
    int result;
    switch(idx){
      case 0:
        final int mIdx = await _repository.getIdxHiveFuture();
        result = mIdx;
      default:
        result = idx;
    }
   if(result != 0){
     final DataDto dto = await _repository.logout(result, event.how);
   }
    _repository.cacheLogout();
    emit(state.copyWith(userVO: ModelConfig.userVO));
    add(const RouteAdsAction());
  }

  Future<void> _routeInfoUpdateAction(RouteInfoUpdateAction event, Emitter<BananaRouteState> emit) async {
    final DataDto dto = await _repository.getUser();
    if(dto.statusEnum != StatusEnum.success){
      add(const RouteErrorAction());
    }
    else{
      final UserVO data = convertUserVO(dto.data).first;
      switch(data.mIdx){
        case 0:
          add(const RouteLogoutAction(how: true));
        default:
          final int mIdx = data.mIdx;
          final bool idxOk = await _repository.saveIdxHive(mIdx);
          final String entity = userVOToJson(data);
          final bool infoOk = await _repository.saveInfoHive(entity);
          final bool next = idxOk && infoOk;
          switch(next){
            case true:
              bool isUUID = await _repository.checkModelUUID(uuid: data.mUuid, model: data.mModel);
              switch(isUUID){
                case true:
                  emit(state.copyWith(userVO: data));
                case false:
                  add(const RouteLogoutAction(how: true));
              }
            case false:
              add(const RouteLogoutAction(how: true));
          }
      }
    }
  }


}
