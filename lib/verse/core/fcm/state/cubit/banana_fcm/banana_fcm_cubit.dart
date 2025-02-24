import 'dart:async';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/repository/fcm_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'banana_fcm_state.dart';

class BananaFcmCubit extends Cubit<BananaFcmState> {
  final FcmRepository _repository;
  final BuildContext _mainContext;

  late StreamSubscription<NotiVO> _notiSubScription;

  BananaFcmCubit({
    required BuildContext mainContext,
    required FcmRepository repository
  }) :
        _mainContext = mainContext,
        _repository = repository, super(const BananaFcmState()){
    broadCastNoti();
  }

  void broadCastNoti() {
    if (kDebugMode) {
      print('black Color');
    }
    _notiSubScription = _repository.didReceiveLocalNotificationStreams().listen((event) {
      if (kDebugMode) {
        print('it is controller type: ${event.type}  message: ${event.title}, ${event.msg}');
      }
      // _repository.receiveMessage(message: event, context: _context);
      if(event.type == 'banana_deal'){
        // if(_mainContext.mounted){
        //   _repository.showSnackBar(context: _mainContext, text: event.msg ?? '');
        // }
        emit(state.copyWith(isReadDeal: false   ));
      }
      else if(event.type == 'banana_chat'){
        // if(_mainContext.mounted){
        //   _repository.showSnackBar(context: _mainContext, text: event.msg ?? '');
        // }
      }
      else if(event.type == 'banana_push'){
        // if(_mainContext.mounted){
        //   _repository.showSnackBar(context: _mainContext, text: event.msg ?? '');
        // }
        emit(state.copyWith(isReadChat: false)
        );
      }
      else if(event.type == ''){
        // if(_mainContext.mounted){
        //   _repository.showSnackBar(context: _mainContext, text: event.title ?? '');
        // }
        emit(state.copyWith(isReadNotice: false,   ));
      }
      else if(event.msg!.contains('이용정지')){
        emit(state.copyWith(isStop: true));
      }
      else if(event.msg!.contains('이용중')){
        emit(state.copyWith(isStop: false));
      }
    });
  }

  void commitAlert() {
    emit(state.copyWith(isReadDeal: true, isReadNotice: true,));
  }

  void checkPause(BuildContext context){
    _repository.checkPause().then((value) =>
    switch(value){
      true => emit(state.copyWith(isStop: false)),
      false => context.mounted
          ? _repository.showSnackBar(
          context: context,
          text: '아직 정지중입니다. 1:1 문의신청을 해주세요.') : null
    }
    );

  }




  @override
  Future<void> close() {
    _notiSubScription.cancel();
    return super.close();
  }

}
