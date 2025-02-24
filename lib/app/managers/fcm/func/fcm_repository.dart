import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/managers/fcm/dialog/fcm_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/components/alert_page/widgets/alert_noti_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/fcm/paygroup.dart';
import '../../../models/fcm/payload.dart';
import '../../../modules/main/auth/auth_controller.dart';
import '../../../modules/src/src_components/controllers/src_noti_controller.dart';
import '../../../routes/const_element.dart';
import 'chache_payro.dart';

class FcmRepository {

  final _messageStreamController = BehaviorSubject<RemoteMessage>();
  final FcmDialog _fcmDialog = FcmDialog();

  void _saveCache(RemoteMessage message){
    Timer(Duration(milliseconds: 50), () async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      PayGroup payDeal = await PayRo().groupDealFront();
      PayGroup payChat = await PayRo().groupChatFront();
      PayGroup payEtc = await PayRo().groupEtcFront();

      switch(message.data['type']){
        case 'banana_deal':
          payDeal.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString(), img: message.data['img'] ?? '' , send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupDealFront', payGroupToJson(payDeal));
          await SrcNotiController.to.receiveDealFront();
          break;
        case 'banana_push':
          payChat.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString(), img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupChatFront', payGroupToJson(payChat));
          await SrcNotiController.to.receiveChatFront();
          break;
        case null:
          payEtc.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString() , img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupEtcFront', payGroupToJson(payEtc));
          await SrcNotiController.to.receiveEtcFront();
          break;
        case '':
          payEtc.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString() , img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupEtcFront', payGroupToJson(payEtc));
          await SrcNotiController.to.receiveEtcFront();

          if(message.data['name'] == 'logout')
          {
            await AuthController.to.tokenEnd(false);
          }
          try{
            if(AlertNotiController.to.initialized){
              await AlertNotiController.to.clickNotiAlert();
            }
          } catch(_){

          }
          break;
        default:
          payEtc.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
              msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
              time: DateTimeConfig().now.toString() , img: message.data['img'] ?? '', send: message.data['send'] ?? ''
          ));
          await prefs.setString('groupEtcFront', payGroupToJson(payEtc));
          await SrcNotiController.to.receiveEtcFront();
          if(message.data['name'] == 'logout')
          {
            await AuthController.to.tokenEnd(false);
          }
          break;
      }

    });
  }

  void _sendMessage(RemoteMessage message){
    Timer(const Duration(milliseconds: 50), () async {
      if(Get.isDialogOpen == false){
        if(AuthController.to.tokken.value != ''){
          if(message.data['send'] == 'none'){
            if(message.data['type'] == 'banana_stop'){
              await SrcInfoController.to.statusCheckRe();
            }
          }
          else{
            switch(message.data['type']){
              case 'banana_deal':
                message.data['title'].contains('종료')
                    ?   _fcmDialog.customSnackbarPush(
                  onTap: () async{
                    Get.back();
                  },
                  alert: '종료 알림',
                  duration: 15,
                  title:  message.data['title'],
                  text: message.data['msg'],
                  url: AppElement.dealEnd,
                )
                    :  message.data['title'] == '개통되었습니다.'
                          ? _fcmDialog.customSnackbarPush(
                              onTap: () async{
                                Get.back();
                               await SrcNotiController.to.moveToScreen(2);
                            },
                             alert: '새로운 견적이 도착했어요.',
                              duration: 15,
                            title: '바나나딜 알림',
                             text: '개통이 완료되었습니다.',
                            url: AppElement.dealParticipate,
                            )
                           :
                _fcmDialog.customSnackbarPush(
                  onTap: () async{
                    Get.back();
                    await SrcNotiController.to.moveToScreen(2);
                  },
                  alert: '새로운 견적이 도착했어요.',
                  duration: 15,
                  title: message.data['name'] ?? '',
                  text: message.data['title'],
                  url: message.data['title'].contains('참여')
                      ? AppElement.dealParticipate
                      : message.data['title'].contains('수정')
                      ? AppElement.dealChange
                      : AppElement.dealChange,
                );
              case 'banana_push':
                BdBotNavController.to.pageIndex.value == 3
                    ? null
                      :  message.data['msg'].contains('채팅을 종료했어요')
                          ? null
                          : _fcmDialog.customSnackbarPush(
                                onTap: () async{
                          Get.back();
                          await SrcNotiController.to.moveToScreen(3);
                          },
                  alert: '채팅 메시지가 도착했어요.',
                  duration: 2,
                  title: message.data['name'],
                  text: message.data['msg'].contains('{"imageUrl":"UPLOAD') || message.data['msg'].contains('UPLOAD/IMAGES')
                      ? '사진을 보냈습니다.'
                      : message.data['msg'],
                );

              case '':
                _fcmDialog.customSnackbarPush(
                  onTap: () async{
                    Get.back();
                    await SrcNotiController.to.moveToScreen(0);
                  },
                  alert: '바나나 소식이 도착했어요.',
                  duration: 10,
                  title: message.data['title'],
                  text: message.data['msg'],

                );
              default :
                null;
            }
          }

        }
      }
    });
  }


  void fcmForeGround(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _messageStreamController.sink.add(message);
      _saveCache(message);
      _sendMessage(message);
    });
  }

  void close(){
      _messageStreamController.close();
  }

}