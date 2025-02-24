import 'package:common_cache/common_cache.dart';
import 'package:permission_handler/permission_handler.dart';

import 'const.dart';

class PermissionCallPart {
  final CommonCache commonCache;
  const PermissionCallPart({
    required this.commonCache,
  });

  List<Permission> _getPermissionList(){
    final List<Permission> result =
    switch(commonCache.mainCacheProvider.platForm){
      // androidNew || android34 ||  ios => androidNewList,
      androidOld => androidOldList,
      _ => androidNewList
    };
    // switch(deviceEntity.platForm){
    //   ConstString.ios => _ios,
    //   ConstString.android34 => _android34,
    //   ConstString.androidNew => _androidNew,
    //   ConstString.androidOld => _androidOld,
    //   _ => []
    // };
    return result;
  }

  Future<void> requestAll() async{
    try{
      await _getPermissionList().request();
    } catch(_){

    }
  }


}