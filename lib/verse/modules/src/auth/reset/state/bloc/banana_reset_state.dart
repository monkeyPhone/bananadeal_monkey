part of 'banana_reset_bloc.dart';

final class BananaResetState extends Equatable {
  final DataDto dataDto;
  final OtpProgressEnum otpProgressEnum;
  final String validate;
  final String email;
  final String otp;
  final String originOtp;
  final int count;
  final String pw1;
  final String pw2;
  final bool lock1;
  final bool lock2;

  const BananaResetState({
    this.dataDto = ModelConfig.dataDto,
    this.otpProgressEnum = OtpProgressEnum.email,
    this.validate = '',
    this.email = '',
    this.otp = '',
    this.originOtp = '',
    this.count = 300,
    this.pw1 = '',
    this.pw2 = '',
    this.lock1 = true,
    this.lock2 = true,
  });

  BananaResetState copyWith({
    DataDto? dataDto,
    OtpProgressEnum? otpProgressEnum,
    String? email,
    String? validate,
    String? otp,
    String? originOtp,
    int? count,
    String? pw1,
    String? pw2,
    bool? lock1,
    bool? lock2,
  }) => BananaResetState(
    dataDto: dataDto ?? this.dataDto,
    otpProgressEnum: otpProgressEnum ?? this.otpProgressEnum,
    email: email ?? this.email,
    validate: validate ?? this.validate,
    otp: otp ?? this.otp,
    originOtp: originOtp ?? this.originOtp,
    count:  count ?? this.count,
    pw1: pw1 ?? this.pw1,
    pw2: pw2 ?? this.pw2,
    lock1: lock1 ?? this.lock1,
    lock2: lock2 ?? this.lock2,
  );

  @override
  List<Object> get props => [
    dataDto, otpProgressEnum, email, validate, otp, originOtp, count, pw1, pw2, lock1, lock2
  ];
}
