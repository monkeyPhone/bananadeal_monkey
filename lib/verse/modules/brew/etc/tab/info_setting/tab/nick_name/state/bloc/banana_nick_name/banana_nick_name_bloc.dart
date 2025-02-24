import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/info_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/manager/info_setting_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_nick_name_event.dart';
part 'banana_nick_name_state.dart';

class BananaNickNameBloc extends Bloc<BananaNickNameEvent, BananaNickNameState> {
  final InfoEditRepository _repository;
  final BuildContext _routerContext;
  BananaNickNameBloc({
    required InfoEditRepository repository,
    required BuildContext routerContext,
  }) : _repository = repository, _routerContext = routerContext, super(const BananaNickNameState()) {
    on<InitNickname>(_initNickname);
    on<CheckDuplication>(_checkDuplication);
    on<ConfirmNickName>(_confirmNickName);
  }

  Future<void> _initNickname(InitNickname event, Emitter<BananaNickNameState> emit) async{
    emit(state.copyWith(nickName: '', validate: ''));
  }

  Future<void> _checkDuplication(CheckDuplication event, Emitter<BananaNickNameState> emit) async{
    if(event.context.read<VerseConfig>().function.nickNext(event.name)){
      final DataDto dto = await _repository.checkDuplication(event.name);
      final StatusEnum status = dto.statusEnum;
      if(event.context.mounted){
        switch(status){
          case StatusEnum.success:
            emit(state.copyWith(nickName: event.name, validate: ''));
          case StatusEnum.failure:
            emit(state.copyWith(nickName: '', validate: '이미 사용중인 닉네임입니다.'));
          default:
            event.context.read<VerseConfig>().browser.snackBar.showSnackBar(context: event.context, text: '잠시 후, 다시 시도해주세요.');
            emit(state.copyWith(nickName: '', validate: ''));
        }
      }
    } else{
      emit(state.copyWith(nickName: '', validate: '사용할 수 없는 닉네임입니다.'));
    }
  }

  Future<void> _confirmNickName(ConfirmNickName event, Emitter<BananaNickNameState> emit) async{
    if(state.nickName != ''){
      final Map<String, dynamic> dataMap = {
        "M_name": state.nickName,
      };
      final StatusEnum status = await _repository.updateUser(dataMap: dataMap);
      if(_routerContext.mounted && event.context.mounted){
        switch(status){
          case StatusEnum.success:
            _routerContext.read<InfoSettingManager>().fetchUserInfo(_routerContext);
            event.context.read<VerseConfig>().route.closeDialog(event.context);
          default:
            event.context.read<VerseConfig>().browser.snackBar.showSnackBar(context: event.context, text: '잠시 후, 다시 시도해주세요.');
        }
      }
    }
  }

}
