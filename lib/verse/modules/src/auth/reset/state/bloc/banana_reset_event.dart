part of 'banana_reset_bloc.dart';

sealed class BananaResetEvent extends Equatable {
  const BananaResetEvent();

  @override
  List<Object> get props => [];
}

final class SendEmail extends BananaResetEvent{
  const SendEmail();
}

final class Loading extends BananaResetEvent {
  const Loading();
}

final class FetchEmailValidate extends BananaResetEvent{
  final String validate;
  final String email;
  const FetchEmailValidate({
    required this.email,
    required this.validate
  });
}

final class EmailSend extends BananaResetEvent{
  const EmailSend();
}

final class FetchOtp extends BananaResetEvent{
  final String otp;
  const FetchOtp({
    required this.otp,
  });
}

final class InitCount extends BananaResetEvent{
  const InitCount();
}

final class MinusCount extends BananaResetEvent{
  const MinusCount();
}

final class StartCount extends BananaResetEvent{
  const StartCount();
}

final class CancelCount extends BananaResetEvent{
  const CancelCount();
}

final class InitialSendEmail extends BananaResetEvent{
  const InitialSendEmail();
}

final class ResendEmail extends BananaResetEvent{
  const ResendEmail();
}

final class ChangePw extends BananaResetEvent{
  const ChangePw();
}

final class FetchPw1 extends BananaResetEvent{
  final String pw1;
  final String validate;
  const FetchPw1({
    required this.pw1,
    required this.validate
  });
}

final class FetchPw2 extends BananaResetEvent{
  final String pw2;
  final String validate;
  const FetchPw2({
    required this.pw2,
    required this.validate
  });
}


final class FetchLock1 extends BananaResetEvent{
  const FetchLock1();
}

final class FetchLock2 extends BananaResetEvent {
  const FetchLock2();
}

final class FinishReset extends BananaResetEvent {
  const FinishReset();
}
