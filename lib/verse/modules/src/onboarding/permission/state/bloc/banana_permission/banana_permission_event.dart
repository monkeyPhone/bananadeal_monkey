part of 'banana_permission_bloc.dart';

sealed class BananaPermissionEvent extends Equatable{
  const BananaPermissionEvent();

  @override
  List<Object> get props => [];

}

final class PermissionFetched extends BananaPermissionEvent{
  const PermissionFetched();
}

final class PermissionRequestAll extends BananaPermissionEvent{
  const PermissionRequestAll();
}


