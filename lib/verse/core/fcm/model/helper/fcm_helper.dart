import 'dart:async';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/action/fcm_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_list_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart' as ConstImage;
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_noti.dart' as ConstNoti;
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class FcmHelper {
  final FcmAction action;

  const FcmHelper({
    required this.action
  });


  void clickTap(String payLoad) async{
    String selectedNotificationPayload = payLoad;

    NotiEntity pay = NotiEntity(idx: 1, title: '',
        msg:'', profile: '', type:  selectedNotificationPayload, name: '',
        time: '', img:  '', send: '', isRead: false
    );
    await action.notiCache.saveNoti(key: ConstNoti.notiRouteBack, value: notiEntityToJson(pay));
  }

  Future<void> saveCache(RemoteMessage message) async{
    // const String notiChat = CacheString.notiChat;
    const String logout = ConstNoti.notiLogOut;

    const String notiDeal = ConstNoti.notiDeal;
    const String notiEtc = ConstNoti.notiEtc;
    NotiListDto notiDealDto = await action.getNoti(notiDeal);
    NotiListDto notiEtcDto = await action.getNoti(notiEtc);




    switch(message.data['type']){
      case 'banana_deal':
        notiDealDto.data.add(NotiEntity(idx: message.hashCode, title: message.data['title'] ?? '',
            msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
            time: DateTimeConfig().now.toString(), img: message.data['img'] ?? '' , send: message.data['send'] ?? '', isRead: false
        ));
        await action.notiCache.saveNoti(
            key: notiDeal,
            value: notiListDtoToJson(notiDealDto)
        );
        // await SrcNotiController.to.receiveDealFront();
        break;
      case 'banana_push':
      // final NotiDto notiChatDto = NotiDto(idx: message.hashCode, title: message.data['title'] ?? '',
      //     msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
      //     time: DateTime.now().toString(), img: message.data['img'] ?? '', send: message.data['send'] ?? '', isRead: false
      // );
      // await _notiBox.saveNoti(
      //     key: notiChat,
      //     value: notiDtoToJson(notiChatDto)
      // );
      // await SrcNotiController.to.receiveChatFront();
        break;
    // case null:
    // case '':
      default:
        notiEtcDto.data.add(NotiEntity(idx: message.hashCode, title: message.data['title'] ?? '',
            msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
            time: DateTimeConfig().now.toString() , img: message.data['img'] ?? '', send: message.data['send'] ?? '', isRead: false
        ));
        await action.notiCache.saveNoti(
            key: notiEtc,
            value: notiListDtoToJson(notiEtcDto)
        );
        // await SrcNotiController.to.receiveEtcFront();

        if(message.data['name'] == 'logout')
        {
          await action.notiCache.saveNoti(
              key: logout,
              value: 'true'
          );
        }
        // try{
        //   if(AlertNotiController.to.initialized){
        //     // await AlertNotiController.to.clickNotiAlert();
        //   }
        // } catch(_){
        //
        // }
        break;

    // payEtc.data.add(NotiPayLoad(idx: message.hashCode, title: message.data['title'] ?? '',
    //     msg: message.data['msg'] ?? '', profile: message.data['profile'] ?? '', type: message.data['type'] ?? '', name: message.data['name'] ?? '',
    //     time: DateTime.now().toString() , img: message.data['img'] ?? '', send: message.data['send'] ?? ''
    // ));
    // await prefs.setString('groupEtcFront', payGroupToJson(payEtc));
    // await SrcNotiController.to.receiveEtcFront();
    // if(message.data['name'] == 'logout')
    // {
    //   await AuthController.to.tokenEnd(false);
    // }
    // break;
    }
  }

  void receiveMessage({
    required NotiVO message,
    required BuildContext context,
  }){
    const BrowserSnackbar snackbar = BrowserSnackbar();
    if (kDebugMode) {
      print('message: ${message.title} ${message.msg}');
    }
    const String logCheck = ConstNoti.notiStatus;
    Timer(const Duration(milliseconds: 50), () async {
      if(message.send == 'none'){
        if(message.type == 'banana_stop'){
          await action.notiCache.saveNoti(
              key: logCheck,
              value: 'true'
          );
        }
      }
      else{
        switch(message.type){
          case 'banana_deal':
            message.title!.contains('종료') || message.title!.contains('개통되었습니다.')
                ? null
                : snackbar.showSnackBarNoti(
              onPressed: () {
                // Get.back();
                // await SrcNotiController.to.moveToScreen(2);
              },
              // alert: '새로운 견적이 도착했어요.',
              duration: 5000,
              title: message.name ?? '',
              text: message.title!,
              url: message.title!.contains('참여')
                  ? ConstImage.dealParticipate
                  : message.title!.contains('수정')
                  ? ConstImage.dealChange
                  : ConstImage.dealEnd, context: context,
            );
          case 'banana_push':
          // BdBotNavController.to.pageIndex.value == 3
          //     ? null
          //     :
            message.msg!.contains('채팅을 종료했어요')
                ? null
                : snackbar.showSnackBarNoti(
              onPressed: () {
                // Get.back();
                // await SrcNotiController.to.moveToScreen(3);
              },
              // alert: '채팅 메시지가 도착했어요.',
              duration: 1000,
              title: message.name!,
              text: message.msg!.contains('UPLOAD/IMAGES') || message.msg!.contains('{"imageUrl":"UPLOAD')
                  ? '사진을 보냈습니다.'
                  : message.msg!, context: context,
            );

          case '':
          default :
            snackbar.showSnackBarNoti(
              onPressed: () {
                if(kDebugMode) {
                  print('알 수 없는 오류로 메시지 수신에 실패했습니다.');
                  }
                },
              // alert: '바나나 소식이 도착했어요.',
              duration: 900000000,
              title: message.title!,
              text: message.msg!,
              context: context,
            );
        // default :
        //   null;
        }

      }


    });
  }


}