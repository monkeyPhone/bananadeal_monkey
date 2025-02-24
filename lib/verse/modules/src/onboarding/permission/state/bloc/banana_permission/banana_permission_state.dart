part of 'banana_permission_bloc.dart';

final class BananaPermissionState extends Equatable {
  final PermissionEntity permissionEntity;
  final bool isRequest;
  final bool nextPage;

  const BananaPermissionState({
    this.permissionEntity = ModelConfig.permission,
    this.isRequest = false,
    this.nextPage = false,
  });

  BananaPermissionState copyWith({
    PermissionEntity? permissionEntity,
    bool? isRequest,
    bool? nextPage,
  }) => BananaPermissionState(
    permissionEntity: permissionEntity ?? this.permissionEntity,
    isRequest: isRequest ?? this.isRequest,
    nextPage: nextPage ?? this.nextPage,
  );

  @override
  List<Object> get props => [permissionEntity, isRequest, nextPage];

}
