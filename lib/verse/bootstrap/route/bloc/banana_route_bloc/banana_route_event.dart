part of 'banana_route_bloc.dart';

@immutable
sealed class BananaRouteEvent extends Equatable {
  const BananaRouteEvent();

  @override
  List<Object> get props => [];
}

final class RouteAdsAction extends BananaRouteEvent {
  const RouteAdsAction();
}

final class RoutePermissionAction extends BananaRouteEvent {
  const RoutePermissionAction();
}

final class RouteSplashAction extends BananaRouteEvent {
  const RouteSplashAction();
}

final class RouteAuthAction extends BananaRouteEvent {
  const RouteAuthAction();
}

final class RouteHomeAction extends BananaRouteEvent {
  final String token;
  const RouteHomeAction({
    required this.token
  });
}

final class RouteErrorAction extends BananaRouteEvent {
  const RouteErrorAction();
}


final class RouteInfoUpdateAction extends BananaRouteEvent {
  const RouteInfoUpdateAction();
}


final class RouteLogoutAction extends BananaRouteEvent {
  final bool how;
  const RouteLogoutAction({
    required this.how
  });
}

