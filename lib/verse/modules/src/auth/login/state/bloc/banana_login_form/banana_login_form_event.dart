part of 'banana_login_form_bloc.dart';

sealed class BananaLoginFormEvent extends Equatable {
  const BananaLoginFormEvent();

  @override
  List<Object> get props => [];
}

final class InitEmail extends BananaLoginFormEvent{
  const InitEmail();
}

final class UpdateEmail extends BananaLoginFormEvent{
  final String email;
  const UpdateEmail({
    required this.email,
  });
}

final class UpdateLockEvent extends BananaLoginFormEvent{
  const UpdateLockEvent();

}

final class ValidateEmailEvent extends BananaLoginFormEvent{
  final String email;
  const ValidateEmailEvent({
    required this.email
  });

}


final class UpdatePwEvent extends BananaLoginFormEvent{
  final String pw;
  const UpdatePwEvent({
    required this.pw
  });
}

final class SuccessOtp extends BananaLoginFormEvent{
  final String email;
  final String pw;
  const SuccessOtp({
    required this.email,
    required this.pw,
  });
}