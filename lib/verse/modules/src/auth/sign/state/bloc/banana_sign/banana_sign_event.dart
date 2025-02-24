part of 'banana_sign_bloc.dart';

sealed class BananaSignEvent extends Equatable {
  const BananaSignEvent();

  @override
  List<Object> get props => [];
}

final class SendEmail extends BananaSignEvent{
  const SendEmail();
}

final class Loading extends BananaSignEvent {
  const Loading();
}

final class FetchEmailValidate extends BananaSignEvent{
  final String validate;
  final String email;
  const FetchEmailValidate({
    required this.email,
    required this.validate
  });
}

final class EmailSend extends BananaSignEvent{
  const EmailSend();
}

final class FetchOtp extends BananaSignEvent{
  final String otp;
  const FetchOtp({
    required this.otp,
  });
}

final class InitCount extends BananaSignEvent{
  const InitCount();
}

final class MinusCount extends BananaSignEvent{
  const MinusCount();
}

final class StartCount extends BananaSignEvent{
  const StartCount();
}

final class CancelCount extends BananaSignEvent{
  const CancelCount();
}

final class InitialSendEmail extends BananaSignEvent{
  const InitialSendEmail();
}

final class ResendEmail extends BananaSignEvent{
  const ResendEmail();
}

final class ChangePw extends BananaSignEvent{
  const ChangePw();
}

final class FetchPw1 extends BananaSignEvent{
  final String pw1;
  final String validate;
  const FetchPw1({
    required this.pw1,
    required this.validate
  });
}

final class FetchPw2 extends BananaSignEvent{
  final String pw2;
  final String validate;
  const FetchPw2({
    required this.pw2,
    required this.validate
  });
}


final class FetchLock1 extends BananaSignEvent{
  const FetchLock1();
}

final class FetchLock2 extends BananaSignEvent {
  const FetchLock2();
}

final class FinishSign extends BananaSignEvent {
  const FinishSign();
}
