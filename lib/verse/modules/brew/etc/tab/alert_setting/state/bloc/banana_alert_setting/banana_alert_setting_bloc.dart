import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/fcm_edit/fcm_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


part 'banana_alert_setting_event.dart';
part 'banana_alert_setting_state.dart';

class BananaAlertSettingBloc extends Bloc<BananaAlertSettingEvent, BananaAlertSettingState> {
  final FcmEditRepository _repository;
  BananaAlertSettingBloc({
    required FcmEditRepository repository,
  }) : _repository = repository, super(const BananaAlertSettingState()) {
    on<InitSetting>(_initSetting);
    on<ChangeEditMode>(_changeEditMode);
    on<ChangeSp>(_changeSp);
    on<ChangeMp>(_changeMp);
    on<ChangeDeal>(_changeDeal);
    on<ChangeChat>(_changeChat);
    on<ChangeAdd>(_changeAdd);
    on<FetchStatus>(_fetchStatus);
  }

  Future<void> _initSetting(InitSetting event, Emitter<BananaAlertSettingState> emit) async{
    emit(state.copyWith(
        isOriginSpValue: false,
        isOriginSpDate: '',
        isOriginMpValue: false,
        isOriginMpDate: '',
        isEditMode: false,
        isSpValue: false,
        isSpDate: '',
        isMpValue: false,
        isMpDate: '',
        isDealPush: false,
        isChatPush: false,
        isAddPush: false,
        statusEnum: StatusEnum.initial,
    ));
  }

  Future<void> _changeEditMode(ChangeEditMode event, Emitter<BananaAlertSettingState> emit) async{
    emit(state.copyWith(
      isOriginSpValue: event.isSpValue,
      isOriginSpDate: event.isSpDate,
      isOriginMpValue: event.isMpValue,
      isOriginMpDate: event.isMpDate,
        isEditMode: event.isEditMode,
      isSpValue: event.isSpValue,
      isSpDate: event.isSpDate,
      isMpValue: event.isMpValue,
      isMpDate: event.isMpDate,
      isDealPush: event.isDealPush,
      isChatPush: event.isChatPush,
      isAddPush: event.isAddPush
    ));
  }


  Future<void> _changeSp(ChangeSp event, Emitter<BananaAlertSettingState> emit) async{
    final String date =
        event.isSpValue == false ? '' :
      state.isOriginSpDate == '' ? DateFormat("yyyy년 MM월 dd일").format(DateTimeConfig().now) : state.isOriginSpDate;
    emit(state.copyWith(isSpValue: event.isSpValue, isSpDate: date, isDealPush: event.isSpValue, isChatPush: event.isSpValue, isAddPush: event.isSpValue));
  }

  Future<void> _changeMp(ChangeMp event, Emitter<BananaAlertSettingState> emit) async{
    final String date =
    event.isMpValue == false ? '' :
    state.isOriginMpDate == '' ? DateFormat("yyyy년 MM월 dd일").format(DateTimeConfig().now) : state.isOriginMpDate;
    emit(state.copyWith(isMpValue: event.isMpValue, isMpDate: date));
  }

  Future<void> _changeDeal(ChangeDeal event, Emitter<BananaAlertSettingState> emit) async{
    if(!state.isChatPush && !state.isAddPush && !event.isDealPush){
      emit(state.copyWith(isDealPush: event.isDealPush, isSpValue: false, isSpDate: ''));
    }else{
      emit(state.copyWith(isDealPush: event.isDealPush));
    }

  }

  Future<void> _changeChat(ChangeChat event, Emitter<BananaAlertSettingState> emit) async{
    if(!event.isChatPush && !state.isAddPush && !state.isDealPush){
      emit(state.copyWith(isChatPush: event.isChatPush, isSpValue: false, isSpDate: ''));
    }else{
      emit(state.copyWith(isChatPush: event.isChatPush));
    }


  }

  Future<void> _changeAdd(ChangeAdd event, Emitter<BananaAlertSettingState> emit) async{
    if(!state.isChatPush && !event.isAddPush && !state.isDealPush){
      emit(state.copyWith(isAddPush: event.isAddPush, isSpValue: false, isSpDate: ''));
    }else{
      emit(state.copyWith(isAddPush: event.isAddPush));
    }

  }

  Future<void> _fetchStatus(FetchStatus event, Emitter<BananaAlertSettingState> emit) async{
    final StatusEnum result = await _repository.fetchFcmStatus(
        spPush: state.isSpValue ? 'Y' : 'N',
        appPush: state.isDealPush ? 'Y' : 'N',
        gwanggoPush: state.isAddPush ? 'Y' : 'N',
        chatPush: state.isChatPush ? 'Y' : 'N',
        mpPush: state.isMpValue ? 'Y' : 'N',
        mpEditDate: state.isMpDate,
        spEditDate: state.isSpDate
    );
    emit(state.copyWith(statusEnum: result));
  }

}
