import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/app_push_status.dart';
import '../../../models/fcm/paygroup.dart';
import '../../../models/fcm/payload.dart';
import '../../../repository/app_repository.dart';

class PayRo{

  // static final AppReopsitory _appRepository = AppReopsitory(dsm: DioServiceManager(options: ApiConsole().options), bananaOpenUrl: ApiConsole.bananaOpenUrl);

  // static Future<AppPushStatus> getPushStatus() async{
  //
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final int? mIdx = prefs.getInt('m_idx');
  //   if(mIdx != null){
  //     String? cachePush = prefs.getString('cach_push');
  //     if(cachePush == null){
  //       final AppPushStatus push = await _appRepository.getPush(mIdx);
  //       await prefs.setString('cach_push', appPushStatusToJson(push));
  //       return push;
  //     }else{
  //       return appPushStatusFromJson(prefs.getString('cach_push')!);
  //     }
  //   }
  //   else{
  //     return AppPushStatus(status: 200, msg: '', result: <AppPushStatusList>[AppPushStatusList(mAppPush: 'Y', mGwanggoPush: 'Y', mChatPush: 'Y')]);
  //   }
  // }

  Future<NotiPayLoad> groupRoute() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('groupRouteBack') == null)
    {
      return NotiPayLoad(idx: 0, title: '', msg: '', profile: '', type: '', name: '', time: '', img: '', send: '');
    }
    else{
      NotiPayLoad pay = notiPayLoadFromJson(prefs.getString('groupRouteBack')!);
      return pay;
    }
  }

  Future<PayGroup> groupDealBack() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('groupDealBack') == null)
    {
      return PayGroup(data: <NotiPayLoad>[]);
    }
    else{
      PayGroup pay = payGroupFromJson(prefs.getString('groupDealBack')!);
      return pay;
    }
  }

  Future<PayGroup> groupChatBack() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('groupChatBack') == null)
    {
      return PayGroup(data: <NotiPayLoad>[]);
    }
    else{
      PayGroup pay = payGroupFromJson(prefs.getString('groupChatBack')!);
      return pay;
    }
  }

  Future<PayGroup> groupEtcBack() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('groupEtcBack') == null)
    {
      return PayGroup(data: <NotiPayLoad>[]);
    }
    else{
      PayGroup pay = payGroupFromJson(prefs.getString('groupEtcBack')!);
      return pay;
    }
  }

  Future<PayGroup> groupDealFront() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('groupDealFront') == null)
    {
      return PayGroup(data: <NotiPayLoad>[]);
    }
    else{
      PayGroup pay = payGroupFromJson(prefs.getString('groupDealFront')!);
      return pay;
    }
  }

  Future<PayGroup> groupChatFront() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('groupChatFront') == null)
    {
      return PayGroup(data: <NotiPayLoad>[]);
    }
    else{
      PayGroup pay = payGroupFromJson(prefs.getString('groupChatFront')!);
      return pay;
    }
  }

  Future<PayGroup> groupEtcFront() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('groupEtcFront') == null)
    {
      return PayGroup(data: <NotiPayLoad>[]);
    }
    else{
      PayGroup pay = payGroupFromJson(prefs.getString('groupEtcFront')!);
      return pay;
    }
  }
}