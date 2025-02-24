import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'banana_login_form_event.dart';
part 'banana_login_form_state.dart';

class BananaLoginFormBloc extends Bloc<BananaLoginFormEvent, BananaLoginFormState> {
 final CommonFunction _commonFunction;

  BananaLoginFormBloc({
   required CommonFunction commonFunction
  }) : _commonFunction = commonFunction, super(const BananaLoginFormState()) {
    on<InitEmail>(_initEmail);
    on<UpdateEmail>(_updateEmail);
    on<UpdateLockEvent>(_updateLockEvent);
    on<ValidateEmailEvent>(_validateEmailEvent);
    on<UpdatePwEvent>(_updatePwEvent);
    on<SuccessOtp>(_successOtp);
  }

  Future<void> _initEmail(InitEmail event, Emitter<BananaLoginFormState> emit) async {
    emit(state.copyWith(email: '', pw: '', lock: true, validate: ''));
  }

  Future<void> _updateEmail(UpdateEmail event, Emitter<BananaLoginFormState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _updateLockEvent(UpdateLockEvent event, Emitter<BananaLoginFormState> emit) async {
    emit(state.copyWith(lock: !state.lock));
  }

  Future<void> _validateEmailEvent(ValidateEmailEvent event, Emitter<BananaLoginFormState> emit) async {
    String validate = switch(event.email){
      '' => '',
      _ => _commonFunction.validationEmail(event.email)
    };
    if(validate == ''){
      add(UpdateEmail(email: event.email));
    }
    emit(state.copyWith(validate: validate));
  }

  Future<void> _updatePwEvent(UpdatePwEvent event, Emitter<BananaLoginFormState> emit) async{
    emit(state.copyWith(pw: event.pw));
  }


 Future<void> _successOtp(SuccessOtp event, Emitter<BananaLoginFormState> emit) async{
   emit(state.copyWith(email: event.email, pw: event.pw, validate: '', lock: true));
 }

}
