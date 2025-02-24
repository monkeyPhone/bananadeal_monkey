import 'package:common_cache/common_cache.dart';
import 'package:models/models.dart';
import 'package:permission_api/src/impl/part/permission_call_part.dart';
import 'package:permission_api/src/impl/part/permission_denied_check_part.dart';
import 'package:permission_api/src/impl/part/permission_make_dialog_list_part.dart';
import 'package:permission_api/src/impl/part/permission_route_check_part.dart';
import 'package:permission_handler/permission_handler.dart';
import '../permission_api.dart';

class PermissionApiImpl implements PermissionApi {
  final CommonCache commonCache;
  final PermissionCallPart _callPart;
  final PermissionDeniedCheckPart _deniedCheckPart;
  final PermissionMakeDialogListPart _makeDialogListPart;
  final PermissionRouteCheckPart _routeCheckPart;
  PermissionApiImpl({
    required this.commonCache,
  }) :  _callPart = PermissionCallPart(commonCache: commonCache),
        _deniedCheckPart = PermissionDeniedCheckPart(commonCache: commonCache),
        _makeDialogListPart = PermissionMakeDialogListPart(commonCache: commonCache),
        _routeCheckPart = PermissionRouteCheckPart(commonCache: commonCache);

  Future<PermissionStatus> _checkPermission(Permission permission) async {
    try{
      final PermissionStatus status = await permission.status;
      return status;
    }catch(_){
      return PermissionStatus.denied;
    }
  }

  Future<List<PermissionStatus>> _requestPermissions() async {
    final List<PermissionStatus> results = await Future.wait([
      _checkPermission(Permission.photos),
      _checkPermission(Permission.location),
      _checkPermission(Permission.camera),
      _checkPermission(Permission.notification),
      _checkPermission(Permission.storage),
    ]);

   return results;

    // 권한 상태 확인 후 추가 처리
  }

  @override
  Future<bool> getPermissionDataRoute() async{
    final List<PermissionStatus> list =  await _requestPermissions();

    final bool result = _routeCheckPart.nextPage(
       statusList: list
    );

    return result;
  }

  @override
  Future<PermissionDto> getPermissionData() async{
    final List<PermissionStatus> list =  await _requestPermissions();
    final bool isNext = _routeCheckPart.nextPage(
        statusList: list
    );
    final bool setBool = _deniedCheckPart.deniedCheck(
       statusList: list
    );

    final PermissionEntity entity = PermissionEntity(
        permissionList: _makeDialogListPart.makeList(
            statusList: list
        ),

        photo: list[0] == PermissionStatus.granted || list[0] == PermissionStatus.limited,
        location: list[1] == PermissionStatus.granted,
        camera: list[2] == PermissionStatus.granted,
        notification: list[3] == PermissionStatus.granted,
        storage: list[4] == PermissionStatus.granted,
        isSettings: setBool,
        isIos: commonCache.mainCacheProvider.isIos
    );

    final PermissionDto dto = PermissionDto(
        isNext: isNext,
        entity: entity
    );

    return dto;
  }

  @override
  Future<void> requestAll() async =>
      await _callPart.requestAll();

  

}