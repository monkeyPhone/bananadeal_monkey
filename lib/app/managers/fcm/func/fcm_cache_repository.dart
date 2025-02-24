import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/fcm/paygroup.dart';
import '../../../models/fcm/payload.dart';
import 'chache_payro.dart';

class FcmCacheRepository {

  static Future<void> notiBackCache(RemoteMessage message) async{
    if(message.data['title'] != null)
    {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      PayGroup payDeal = await PayRo().groupDealBack();
      PayGroup payChat = await PayRo().groupChatBack();
      PayGroup payEtc = await PayRo().groupEtcBack();


      switch(message.data['type']){
        case 'banana_deal':
          payDeal.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString(), img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupDealBack', payGroupToJson(payDeal));
          break;
        case 'banana_push':
          payChat.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString(), img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupChatBack', payGroupToJson(payChat));
          break;
        case null:
          payEtc.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString(), img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupEtcBack', payGroupToJson(payEtc));
          break;
        case '':
          payEtc.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString(), img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupEtcBack', payGroupToJson(payEtc));
          break;
        default:
          payEtc.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString(), img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          if(message.data['type'] == 'banana_stop'){
            await prefs.setString('groupStop', payGroupToJson(payEtc));
          }
          break;
      }

    }
  }


}