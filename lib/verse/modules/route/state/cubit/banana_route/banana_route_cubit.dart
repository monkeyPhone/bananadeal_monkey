import 'dart:async';
import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/route/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/data/user_vo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




part 'banana_route_state.dart';

class BananaRouteCubit extends Cubit<BananaRouteState> {
  final RouteRepository _routeRepository;
  final AuthCacheProvider _authCacheProvider;

  late StreamSubscription<bool> _permissionSubScription;
  late StreamSubscription<bool> _splashSubScription;
  late StreamSubscription<String?> _tokenSubScription;
  late StreamSubscription<int?> _idxSubScription;
  late StreamSubscription<String?> _infoSubScription;
  late StreamSubscription<DataDto?> _memberSubScription;

  BananaRouteCubit({
    required RouteRepository routeRepository,
    required AuthCacheProvider authCacheProvider
  }) :  _routeRepository = routeRepository,
        _authCacheProvider = authCacheProvider,
        super(const BananaRouteState()){
    appRouting();
  }




  void appRouting() async{
    if(!kIsWeb){
      await _routingDelay();
    }
    _permissionRouting();
  }

  void _permissionRouting() {
    _permissionSubScription = _routeRepository.getPermission().listen((bool event) {
      switch(event){
        case true :
          _splashRouting();
        case false :
          emit(state.copyWith(appRouter: RouterEnum.pagePermission ));
      }
      _permissionSubScription.cancel();
    });
  }

  void _splashRouting(){
    _splashSubScription = _routeRepository.splashRouting().listen((bool event) {
      switch(event){
        case true:
          authRouting();
        case false:
          emit(state.copyWith(appRouter: RouterEnum.pageSplash,));
      }
      _splashSubScription.cancel();
    });
  }

  void authRouting(){
    _tokenSubScription = _authCacheProvider.getTokenHive().listen((String event) async{
      switch(event){
        case '':
          _signRouting();
        default :
          await _memberRouting();
      }
      _tokenSubScription.cancel();
    });
  }


  void _signRouting(){
    _idxSubScription = _authCacheProvider.getIdxHive().listen((int event) {
      final bool router = event != 0;
      final RouterEnum routerEnum =
      switch(router){
        true => RouterEnum.pageAuthLogin,
        false => RouterEnum.pagAuthIntro
      };
      emit(state.copyWith(appRouter: routerEnum,));
      _idxSubScription.cancel();
    });
  }


  Future<void> _memberRouting() async {
    if(state.userVO.mIdx != 0) {
      _loginRouting();
    }
    else {
      await _memberRoutingNoState();
    }
  }

  Future<void> _memberRoutingNoState() async {
    _memberSubScription = _routeRepository.getUser().listen((DataDto event) async{
      if(event.statusEnum != StatusEnum.success){
        await logout(how: true);
      }
      else{
        final UserVO data = convertUserVO(event.data).first;
        switch(data.mIdx){
          case 0:
            await logout(how: true);
          default:
            emit(state.copyWith(userVO: data));
            final int mIdx = data.mIdx;
            final bool idxOk = await _authCacheProvider.saveIdxHive(mIdx);
            final String entity = userVOToJson(data);
            final bool infoOk = await _authCacheProvider.saveInfoHive(entity);
            final bool next = idxOk && infoOk;
            if(kIsWeb){
              authRouting();
            } else{
              switch(next){
                case true:
                  bool result = await _routeRepository.checkModelUUID(uuid: data.mUuid, model: data.mModel);
                  switch(result){
                    case true:
                      authRouting();
                    case false:
                      await logout(how: true);
                  }
                case false:
                  await logout(how: true);
              }
            }
        }
      }
      _memberSubScription.cancel();
    });
  }


  void _loginRouting(){
    _infoSubScription = _authCacheProvider.getInfoHive().listen((String event) {
      switch(event){
        case '':
          appRouting();
        default:
          final UserVO userVO = userVOFromJson(event);
          if(userVO.mName == ''){
            emit(state.copyWith(appRouter: RouterEnum.userInfo));
          }
          else if(userVO.mIsUsed == '이용정지'){
            emit(state.copyWith(appRouter: RouterEnum.userStop));
          }
          else {
            emit(state.copyWith(appRouter: RouterEnum.loginSuccess));
          }
      }
      _infoSubScription.cancel();
    });
  }


  //마지막 else 부분 뭘 넣으면 좋을지 체크해야 됨.
  Future<void> logout({int? idx, required bool how}) async{
    final int mIdx;
    final bool next =
    switch(idx){
      null => switch(mIdx = await _authCacheProvider.getIdxHiveFuture()){
        0 => false,
        _ =>  await _routeRepository.logout(mIdx, how)
      },
      _ =>
      await _routeRepository.logout(idx, how),
    };

    if(next){
      _authCacheProvider.logout();
      emit(state.copyWith(userVO: ModelConfig.userVO));
      appRouting();
    }  // 에러 체크 필요함

  }



  Future<void> _routingDelay() async{
    emit(state.copyWith(appRouter: RouterEnum.adsDelay, userVO: ModelConfig.userVO));
    final int delay = await _routeRepository.setPosition();
    if (kDebugMode) {
      print(delay);
    }
    final int milliseconds = delay >= 5000 ? 0 : 5000 - delay;
    await Future.delayed(Duration(milliseconds: milliseconds));
  }


  Future<void> memberInfoUpdate() async {
    _memberSubScription = _routeRepository.getUser().listen((DataDto event) async{
      if(event.statusEnum != StatusEnum.success){
        await logout(how: true);
      }
      else{
        final UserVO data = convertUserVO(event.data).first;
        switch(data.mIdx){
          case 0:
            await logout(how: true);
          default:
            emit(state.copyWith(userVO: data));
            final int mIdx = data.mIdx;
            final bool idxOk = await _authCacheProvider.saveIdxHive(mIdx);
            final String entity = userVOToJson(data);
            final bool infoOk = await _authCacheProvider.saveInfoHive(entity);
            final bool next = idxOk && infoOk;
            switch(next){
              case true:
                bool result = await _routeRepository.checkModelUUID(uuid: data.mUuid, model: data.mModel);
                switch(result){
                  case true:
                    null;
                  case false:

                    await logout(how: true);
                }
              case false:
                await logout(how: true);
            }
        }
      }
      _memberSubScription.cancel();
    });
  }

  @override
  Future<void> close(){
    _permissionSubScription.cancel();
    _splashSubScription.cancel();
    _tokenSubScription.cancel();
    _idxSubScription.cancel();
    _memberSubScription.cancel();
    _infoSubScription.cancel();
    _routeRepository.close();
    return super.close();
  }


}
