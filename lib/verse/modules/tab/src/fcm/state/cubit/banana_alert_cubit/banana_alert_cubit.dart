import 'dart:async';
import 'dart:developer';
import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_list_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/repository/fcm_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_alert_state.dart';

class BananaAlertCubit extends Cubit<BananaAlertState> {
  final FcmRepository _repository;
  late StreamSubscription<NotiVO> _notiSubScription;
  BananaAlertCubit({
    required FcmRepository repository
  }) : _repository = repository,
        super(const BananaAlertState()) {
    getAlertFcm(true);
    broadCastNoti();
  }

  void broadCastNoti() {
    log('two Black Color');
    _notiSubScription = _repository.didReceiveLocalNotificationStreams().listen((event) {
      log('it is controller type: ${event.type}  message: ${event.title}, ${event.msg}');
      // _repository.receiveMessage(message: event, context: _context);
      if(event.type == 'banana_deal' || event.type == ''){
        getAlertFcm(false);
      }
    });
  }

  void getAlertFcm(bool init){
    _repository.getNotiDto().then(
            (value) {
          switch(init){
            case true:
              _defaultGetFcm(value: value);
            case false:
              _getAlertFcmInitFalse(value);

          }
        });
  }


  void _defaultGetFcm({required (List<NotiEntity>, List<NotiEntity>) value}) {
    emit(state.copyWith(notiDealDto: value.$1));
    emit(state.copyWith(notiEtcDto: value.$2));
  }

  void _getAlertFcmInitFalse((List<NotiEntity>, List<NotiEntity>) value) {
    if(state.isEditMode == false){
      _defaultGetFcm(value: value);
    } else{
      _editModeGetFcm(value);
    }
  }

  void _editModeGetFcm((List<NotiEntity>, List<NotiEntity>) value) {

    NotiListDto waitDeal = _editModeGetFcmValue(
        isDeal: true,
        value: value.$1
    );

    NotiListDto waitEtc = _editModeGetFcmValue(
        isDeal: false,
        value: value.$2
    );


    emit(
        state.copyWith(
            waitDto: (
            waitDeal.data, waitEtc.data
            )
        )
    );
  }

  NotiListDto _editModeGetFcmValue({
    required bool isDeal,
    required List<NotiEntity> value,
  }) {
    List<NotiEntity> result = [];
    isDeal
        ? state.waitDto.$1.isNotEmpty
        ? result.addAll(state.waitDto.$1)
        : null
        :  state.waitDto.$2.isNotEmpty
        ? result.addAll( state.waitDto.$2)
        : null;
    if(value.isNotEmpty){
      result.add(value.first);
    }
    return NotiListDto(data: result);

  }


  void setCurrentIndex(int index){
    emit(state.copyWith(currentIndex: index));
  }

  void deleteListDto(List<NotiEntity> dto) async{
    if(state.currentIndex == 0){
      emit(state.copyWith(notiDealDto: dto));
      await _repository.saveNoti(isDeal: true, value:  dto);

    } else{
      emit(state.copyWith(notiEtcDto: dto));
      await _repository.saveNoti(isDeal: false, value:  dto);
    }
    log(state.notiEtcDto.length.toString());
  }

  void changeEditMode(){
    if(state.isEditMode == false){
      closeAlertFcm(false);
      getAlertFcm(true);
      emit(state.copyWith(isEditMode: true));
    } else {
      _editFinish();
      emit(state.copyWith(isEditMode: false));
      getAlertFcm(true);
    }
  }

  void _editFinish() async{
    final int index = state.currentIndex;
    final (List<NotiEntity>, List<NotiEntity>) wait = state.waitDto;
    List<NotiEntity> result1 = [];
    List<NotiEntity> result2 = [];
    if(index == 0){
      if(wait.$1.isNotEmpty){
        result1.addAll(wait.$1);
        state.notiDealDto.isNotEmpty ? result1.addAll(state.notiDealDto) : null;
        await _repository.saveNoti(isDeal: true, value:  result1);
      } else{
        state.notiDealDto.isNotEmpty ? result1.addAll(state.notiDealDto) : result1.clear();
        await _repository.saveNoti(isDeal: true, value:  result1);
      }
    }
    else{
      if(wait.$2.isNotEmpty){
        result2.addAll(wait.$2);
        state.notiEtcDto.isNotEmpty ? result2.addAll(state.notiEtcDto) : null;
        await _repository.saveNoti(isDeal: false, value:  result2);
      } else{
        state.notiEtcDto.isNotEmpty ? result2.addAll(state.notiEtcDto) : result2.clear();
        await _repository.saveNoti(isDeal: false, value:  result2);
      }

    }
    emit(state.copyWith(waitDto: ([], [] )));

  }

  //ToDo: 생각난대로 골자만 맞춰놨음. 이미지화면 구현 이후 다시 확인하기.



  void closeAlertFcm(bool isExit) async{
    getAlertFcm(true);
    switch(isExit){
      case true:
        await _changeIsEtcDeal();
        await _changeIsReadDeal();
      case false:
        state.currentIndex == 0
            ? await _changeIsReadDeal()
            : await _changeIsEtcDeal();
    }


  }

  Future<void> _changeIsEtcDeal() async {
    if(state.notiEtcDto.where((element) => !element.isRead).isNotEmpty){
      List<NotiEntity> notiEtc = state.notiEtcDto;
      notiEtc.map((e){
        if(!e.isRead){
          return e.isRead = true;
        }
        else{
          return e;
        }
      }).toList();
      emit(state.copyWith(notiEtcDto: notiEtc));
      await _repository.saveNoti(isDeal: false, value: state.notiEtcDto);
    }
  }

  Future<void> _changeIsReadDeal() async{
    if(state.notiDealDto.where((element) => !element.isRead).isNotEmpty){
      List<NotiEntity> notiDeal = state.notiDealDto;
      notiDeal.map((e){
        if(!e.isRead){
          return e.isRead = true;
        }
        else{
          return e;
        }
      }).toList();
      emit(state.copyWith(notiDealDto: notiDeal));
      await _repository.saveNoti(isDeal: true, value: state.notiDealDto);
    }
  }



  @override
  Future<void> close() {
    _notiSubScription.cancel();
    return super.close();
  }

}