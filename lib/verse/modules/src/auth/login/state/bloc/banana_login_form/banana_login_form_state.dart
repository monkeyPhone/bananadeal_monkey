part of 'banana_login_form_bloc.dart';

final class BananaLoginFormState extends Equatable {
  final String email;
  final String pw;
  final bool lock;
  final String validate;
  const BananaLoginFormState({
    this.email = '',
    this.pw = '',
    this.lock = true,
    this.validate = ''
  });

  BananaLoginFormState copyWith({
    String? email,
    String? pw,
    bool? lock,
    String? validate
  }) => BananaLoginFormState(
    email: email ?? this.email ,
    pw: pw ?? this.pw,
    lock: lock ?? this.lock,
    validate: validate ?? this.validate,
  );

  @override
  List<Object> get props => [email, pw, lock, validate];
}
