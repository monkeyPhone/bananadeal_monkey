part of 'banana_auth_route_bloc.dart';


final class BananaAuthRouteState extends Equatable {
  final AuthProgressEnum authProgressEnum;

  const BananaAuthRouteState({
    this.authProgressEnum = AuthProgressEnum.login,
  });

  BananaAuthRouteState copyWith({
    AuthProgressEnum? authProgressEnum
  }) => BananaAuthRouteState(
      authProgressEnum: authProgressEnum ?? this.authProgressEnum
  );

  @override
  List<Object> get props => [authProgressEnum];
}
