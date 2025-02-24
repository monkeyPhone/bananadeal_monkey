import 'dart:async';

import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/sign/sign_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_sign_event.dart';
part 'banana_sign_state.dart';

class BananaSignBloc extends Bloc<BananaSignEvent, BananaSignState> {
  final SignRepository _repository;
  late Timer? _timer;
  BananaSignBloc({
    required SignRepository repository,
  }) : _repository = repository, super(const BananaSignState()) {
    on<SendEmail>(_sendEmail);
    on<Loading>(_loading);
    on<FetchEmailValidate>(_fetchEmailValidate);
    on<InitialSendEmail>(_initialSendEmail);
    on<FetchOtp>(_fetchOtp);
    on<InitCount>(_initCount);
    on<MinusCount>(_minusCount);
    on<StartCount>(_startCount);
    on<CancelCount>(_cancelCount);
    on<ResendEmail>(_resendEmail);
    on<ChangePw>(_changePw);
    on<FetchPw1>(_fetchPw1);
    on<FetchPw2>(_fetchPw2);
    on<FetchLock1>(_fetchLock1);
    on<FetchLock2>(_fetchLock2);
    on<FinishSign>(_finishSign);
  }



  Future<void> _loading(Loading event, Emitter<BananaSignState> emit) async{
    emit(state.copyWith(dataDto: const DataDto(statusEnum: StatusEnum.loading, data: [], tokenError: false)));
    await _repository.futureDelay(300);
  }

  Future<void> _sendEmail(SendEmail event, Emitter<BananaSignState> emit) async {
    add(const Loading());
    await emit.forEach(
        _repository.streamCheckEmail(email: state.email, ),
        onData: (result) => state.copyWith(dataDto: result)
    );
    if(state.dataDto.statusEnum == StatusEnum.success){
      final String origin = '${state.dataDto.data.first['authNumber']}';
      emit(state.copyWith(
          originOtp: origin,
          dataDto: ModelConfig.dataDto,
          otpProgressEnum: OtpProgressEnum.otp,
      ));
      add(const StartCount());
    } else {
      emit(state.copyWith(
        dataDto: ModelConfig.dataDto,
      ));
    }
  }

  Future<void> _initialSendEmail(InitialSendEmail event, Emitter<BananaSignState> emit) async {
    add(const InitCount());
    emit(state.copyWith(dataDto: ModelConfig.dataDto, originOtp: '', otpProgressEnum: OtpProgressEnum.email, otp: ''));
  }

  Future<void> _resendEmail(ResendEmail event, Emitter<BananaSignState> emit) async {
    add(const InitCount());
    emit(state.copyWith(dataDto: ModelConfig.dataDto, originOtp: '', otp: ''));
    add(const SendEmail());
  }

  Future<void> _fetchOtp(FetchOtp event,  Emitter<BananaSignState> emit) async{
    emit(state.copyWith(otp: event.otp));
  }

  Future<void> _fetchEmailValidate(FetchEmailValidate event, Emitter<BananaSignState> emit) async {
    emit(state.copyWith(validate: event.validate, email: event.email));
  }

  Future<void> _initCount(InitCount event, Emitter<BananaSignState> emit) async{
    add(const CancelCount());
    emit(state.copyWith(count: 300));
  }

  Future<void> _minusCount(MinusCount event, Emitter<BananaSignState> emit) async {
    int count = state.count;
    count--;
    emit(state.copyWith(count: count));
  }

  Future<void> _startCount(StartCount event, Emitter<BananaSignState> emit) async{
    emit(state.copyWith(count: 300));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.count == 0) {
        add(const InitialSendEmail());
      }
      add(const MinusCount());

    });
  }

  Future<void> _cancelCount(CancelCount event, Emitter<BananaSignState> emit) async{
    try{
      if(_timer != null){
        if(_timer!.isActive){
          _timer!.cancel();
        }
      }
    } catch(_){

    }
    _timer = null;
    emit(state.copyWith(count: 300));
  }

  Future<void> _changePw(ChangePw event, Emitter<BananaSignState> emit) async{
    add(const Loading());
    add(const CancelCount());
    emit(state.copyWith(
        dataDto: ModelConfig.dataDto,
        otpProgressEnum: OtpProgressEnum.pw));
  }

  Future<void> _fetchPw1(FetchPw1 event, Emitter<BananaSignState> emit) async{
    emit(state.copyWith(pw1: event.pw1, validate: event.validate));
  }

  Future<void> _fetchPw2(FetchPw2 event, Emitter<BananaSignState> emit) async{
    emit(state.copyWith(pw2: event.pw2, validate: event.validate));
  }

  Future<void> _fetchLock1(FetchLock1 event, Emitter<BananaSignState> emit) async{
    bool lock = !state.lock1;
    emit(state.copyWith(lock1: lock));
  }

  Future<void> _fetchLock2(FetchLock2 event, Emitter<BananaSignState> emit) async{
    bool lock = !state.lock2;
    emit(state.copyWith(lock2: lock));
  }

  Future<void> _finishSign(FinishSign event, Emitter<BananaSignState> emit) async{
    add(const Loading());
    await emit.forEach(_repository.streamCreatePw(
        email: state.email,
        pw: state.pw1
    ), onData: (result) => state.copyWith(dataDto: result));
    if(state.dataDto.statusEnum == StatusEnum.success){
      emit(state.copyWith(
          dataDto: ModelConfig.dataDto,
          otpProgressEnum: OtpProgressEnum.finish));
    }
    else{
      emit(state.copyWith(dataDto: ModelConfig.dataDto));
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    add(const CancelCount());
    return super.close();

  }

}
