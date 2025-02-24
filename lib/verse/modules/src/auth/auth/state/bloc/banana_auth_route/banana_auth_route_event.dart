part of 'banana_auth_route_bloc.dart';


sealed class BananaAuthRouteEvent extends Equatable{
  const BananaAuthRouteEvent();

  @override
  List<Object> get props => [];
}

final class FetchProgress extends BananaAuthRouteEvent{
  final AuthProgressEnum authProgressEnum;
  const FetchProgress({
    required this.authProgressEnum,
  });
}


final class CloseSign extends BananaAuthRouteEvent{
  final BuildContext context;
  const CloseSign(this.context);
}


final class TabClick extends BananaAuthRouteEvent{
  final BuildContext context;
  final int index;
  const TabClick({
    required this.context,
    required this.index,
  });
}

final class BackSpace extends BananaAuthRouteEvent{
  final bool isCanPop;
  final BuildContext context;
  const BackSpace({
    required this.isCanPop,
    required this.context,
  });
}
