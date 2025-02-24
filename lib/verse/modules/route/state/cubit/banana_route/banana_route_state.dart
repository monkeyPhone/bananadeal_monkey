part of 'banana_route_cubit.dart';

final class BananaRouteState extends Equatable{
  final RouterEnum appRouter;
  final UserVO userVO;


  const BananaRouteState({
    this.appRouter = RouterEnum.initial,
    this.userVO = ModelConfig.userVO,
  });

  BananaRouteState copyWith({
    RouterEnum? appRouter,
    UserVO? userVO,

  }) {
    return BananaRouteState(
      appRouter: appRouter ?? this.appRouter,
      userVO: userVO ?? this.userVO,
    );
  }

  @override
  List<Object> get props => [appRouter, userVO];

}
