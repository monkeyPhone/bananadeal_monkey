import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/info_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_member_out_event.dart';
part 'banana_member_out_state.dart';

class BananaMemberOutBloc extends Bloc<BananaMemberOutEvent, BananaMemberOutState> {
  final InfoEditRepository _repository;
  BananaMemberOutBloc({
    required InfoEditRepository repository
  }) : _repository = repository, super(const BananaMemberOutState()) {
    on<SelectIndex>(_selectIndex);
    on<UpdateAnswer>(_updateAnswer);
    on<MemberOut>(_memberOut);
  }

  Future<void> _selectIndex(SelectIndex event, Emitter<BananaMemberOutState> emit) async{
    emit(state.copyWith(currentIndex: event.index, answer: switch(event.index){
      0 => '더 이상 사용을 안해요.',
      1 => '딜의 결과가 마음에 들지 않아요.',
      2 => '고객 응대가 마음에 들지 않아요.',
      3 => '다른 서비스를 이용하려고 해요.',
      _ => ''
    },));
  }

  Future<void> _updateAnswer(UpdateAnswer event, Emitter<BananaMemberOutState> emit) async {
    emit(state.copyWith(answer: event.value));
  }

  Future<void> _memberOut(MemberOut event, Emitter<BananaMemberOutState> emit) async{
    if(state.currentIndex+1 > 5){
      event.context.read<VerseConfig>().browser.snackBar.showSnackBar(context: event.context, text: '잠시 후, 다시 시도해주세요.');
      emit(state.copyWith(currentIndex: 5, answer: '', statusEnum: StatusEnum.initial));
    }
    else{
      await emit.forEach(
          _repository.memberOut(currentIndex: state.currentIndex+1, answer: state.currentIndex+1 == 5 ? state.answer : ''),
          onData: (result) {
            if(result == StatusEnum.success){
              event.context.read<VerseConfig>().browser.snackBar.showSnackBar(context: event.context, text: '회원탈퇴가 완료되었습니다. 바나나딜을 이용해주셔서 감사합니다!');
              event.context.read<VerseConfig>().route.logout(
                  context: event.context,
                  idx: event.context.read<BananaRouteCubit>().state.userVO.mIdx, how: true);
            }
            else{
              event.context.read<VerseConfig>().browser.snackBar.showSnackBar(context: event.context, text: '잠시 후, 다시 시도해주세요.');
            }
            return state.copyWith(
              statusEnum: result
            );
          }
      );
      // final StatusEnum status = await _repository.memberOut(currentIndex: state.currentIndex+1, answer: state.currentIndex+1 == 5 ? state.answer : '');
      //
      //
      //
      //
      //
      //
      // if(status == StatusEnum.success){
      //   if(event.context.mounted){
      //     event.context.read<VerseConfig>().func.helper.snackbar.showSnackBar(context: event.context, text: '회원탈퇴가 완료되었습니다. 바나나딜을 이용해주셔서 감사합니다!');
      //     event.context.read<VerseConfig>().route.routeManager.
      //   }
      //   emit(state.copyWith(statusEnum: status,));
      // }
      // else{
      //   if(event.context.mounted){
      //     event.context.read<VerseConfig>().func.helper.snackbar.showSnackBar(context: event.context, text: '잠시 후, 다시 시도해주세요.');
      //   }
      //   emit(state.copyWith(currentIndex: 5, answer: '', statusEnum: StatusEnum.initial));
      // }
    }
  }

}
