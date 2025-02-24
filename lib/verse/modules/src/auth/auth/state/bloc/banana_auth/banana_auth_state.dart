part of 'banana_auth_bloc.dart';

final class BananaAuthState extends Equatable {
  final DataDto dataDto;
  final String checkLogin;

  const BananaAuthState({
    this.dataDto = ModelConfig.dataDto,
    this.checkLogin = '',
  });

  BananaAuthState copyWith({
    DataDto? dataDto,
    String? checkLogin,
  }) => BananaAuthState(
    dataDto: dataDto ?? this.dataDto,
    checkLogin: checkLogin ?? this.checkLogin,
  );


  @override
  List<Object> get props => [dataDto, checkLogin];
}