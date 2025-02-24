import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/managers/ios_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/app_pages.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../components/common_dialog/common_widgets_2.dart';
import '../../../../components/common_widgets.dart';
import '../../../../managers/permission/permission_handler_manager.dart';
import '../../../../models/auth/auth_info.dart';
import '../../../../models/auth/init_list.dart';
import '../../../../models/auth/noti_confirm.dart';
import '../../../../models/auth_basic_api.dart';
import '../../../../repository/etc/etc_etc_repository.dart';
import '../../../../repository/src/src_info_repository.dart';
import '../../../main/auth/auth_controller.dart';



class SrcInfoController extends GetxController{
  static SrcInfoController get to => Get.find();

  final PermissionHandlerManager _permissionHandlerManager;
  final SrcInfoRepository _srcInfoRepository;
  final EtcEtcRepository _etcEtcRepository;
  final CommonWidgets _commonWidgets;
  final CommonWidgets2 _commonWidgets2;


  SrcInfoController({
    required PermissionHandlerManager permissionHandlerManager,
    required SrcInfoRepository srcInfoRepository,
    required EtcEtcRepository etcEtcRepository,
    required CommonWidgets commonWidgets,
    required CommonWidgets2 commonWidgets2,

  }) : _permissionHandlerManager = permissionHandlerManager,
        _srcInfoRepository = srcInfoRepository,
        _etcEtcRepository = etcEtcRepository,
        _commonWidgets = commonWidgets,
        _commonWidgets2 = commonWidgets2;

  RxBool notiValue = false.obs;

  Rx<AuthInfo> updateInfo = AuthInfo(status: 0, msg: '',
      result: []).obs;

  RxString fcmToken = ''.obs;
  RxString mIsUsed = ''.obs;

  Rx<InfoMember> infoM =  InfoMember(
      mIdx: 0, mEmail: '', mJoinType: '', mName: '', mAdd: '',
      mLatitude: '', mLongitude: '', mAddDong: '', mPathImg: '',
      mIsUsed: '',  mPauseDuration: '', mPauseReason: '',
      mRegdate: '', mSearchRange: 0, mAppPush: '', mGwanggoPush: '', mChatPush: '', mUuid: '', mModel: '', mMpPush: '', mEditDateMp: '', ).obs;


  Rx<AuthInfo> authMemberInit = AuthInfo(status: 0, msg: '',
      result: [
        InfoMember(
            mIdx: 0, mEmail: '', mJoinType: '', mName: '', mAdd: '',
            mLatitude: '', mLongitude: '', mAddDong: '', mPathImg: '',
            mIsUsed: '',  mPauseDuration: '', mPauseReason: '',
            mRegdate: '', mSearchRange: 0, mAppPush: '', mGwanggoPush: '', mChatPush: '', mUuid: '', mModel: '', mMpPush: '',  mEditDateMp: '',),
      ]).obs;

  RxString mAddDong = ''.obs;
  RxString mAdd = ''.obs;

  // Future<AuthInfo> statusCheck() async{
  //   try{
  //
  //     AuthController.to.changeStatus('ok');
  //
  //
  //     AuthInfo init = await _srcInfoRepository.getUserInfo();
  //     if(init.status == 200)
  //     {
  //       final SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setInt('m_idx', init.result.first.mIdx);
  //
  //       InfoMember info = init.result.first;
  //       infoM.value = info;
  //       mAddDong.value = info.mAddDong;
  //       mAdd.value = info.mAdd;
  //       try{
  //         await BdBotNavChatController.to.reloadRoom(init.result.first.mIdx);
  //       }catch(e){
  //         log('reload error $e');
  //       }
  //       try{
  //         await SrcDealController.to.getDealData(init.result.first.mIdx);
  //       }catch(e){
  //         log('deal error $e');
  //       }
  //
  //       String? fcmToken = await FirebaseMessaging.instance.getToken(
  //           // vapidKey: "AAAAJ1ahSw8:APA91bFmD-hiFRgET-wOut7U49YWCn-icuXKyoEEIW5yWF2Y-MumOcPiP5CaokG-zbdhIOLV1MRgoENLevznu6aCiE8-aqR15zN1ceSHxKE1shxU3DViDriqVfL2d1rnq2EgC0chDkDuEJjmsKnjEuNT0fkaLkQ2oA"
  //       );
  //       log('its fcmToken $fcmToken');
  //       if(fcmToken == null || fcmToken == ''){
  //         await AuthController.to.logout('srcInfoController fail uuid token');
  //       }
  //
  //       if(info.mUuid == '' || (info.mUuid != '' && info.mUuid != fcmToken))
  //       {
  //         try{
  //           AuthBagicApi row = await _srcInfoRepository.memberUUID(uuid: fcmToken!);
  //           log('its row status ${row.status}');
  //           if(row.status == 200){
  //             infoM.value.mUuid = fcmToken.toString();
  //           }else{
  //             log('========= >>>>  uuid fail');
  //             await AuthController.to.logout('srcInfoController fail uuid');
  //           }
  //         } catch(e){
  //           log('new error $e');
  //         }
  //       }
  //       String model = await _getDeviceInfo();
  //       log('its row model $model');
  //       if(info.mModel == '' || info.mModel != model)
  //       {
  //         AuthBagicApi row = await _srcInfoRepository.memberModel(model: model);
  //         if(row.status == 200){
  //           infoM.value.mModel = model;
  //         }
  //         else{
  //           AuthController.to.logout('srcInfoController fail model');
  //           _commonWidgets.customSnackbar('장치관리 설정 실패');
  //         }
  //       }
  //       if(GetPlatform.isIOS){
  //         final noti = await _permissionHandlerManager.checkPermission(PermissionHandlerManager.noti);
  //         if(noti == PermissionHandlerManager.granted){
  //           notiValue.value = false;
  //           update();
  //         } else{
  //           notiValue.value = true;
  //           update();
  //         }
  //       }
  //       if(info.mMpPush == '' || info.mSpPush == '' || info.mEditDateSp == '' || info.mEditDateMp == ''){
  //         log('gogogogo pushsetting dialog');
  //         await openSystem(Get.context!);
  //       }
  //
  //     } else{
  //       await AuthController.to.logout('srcInfoController fail init');
  //     }
  //
  //
  //     fcmToken.value = infoM.value.mUuid;
  //     mIsUsed.value = infoM.value.mIsUsed;
  //     update();
  //     if(init.result.first.mName == ''){
  //       final SharedPreferences prefs = await SharedPreferences.getInstance();
  //       final String? mEmail = prefs.getString('m_email');
  //       if(mEmail == null){
  //         await prefs.setString('m_email', infoM.value.mEmail);
  //       }
  //       await prefs.setInt('m_idx', init.result.first.mIdx);
  //       Get.offAllNamed(Routes.SIGNADD,);
  //     }
  //
  //     return authMemberInit.value = init;
  //   } catch(e) {
  //     log(e.toString());
  //     await AuthController.to.logout('srcInfoController fail catch err');
  //     return authMemberInit.value = AuthInfo(status: 0, msg: '', result: []);
  //   }
  // }


  Future<AuthInfo> statusCheckRe() async{
    try{

      AuthController.to.changeStatus('ok');
      AuthInfo init = await _srcInfoRepository.getUserInfo();
      if(init.status == 200)
      {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        if(init.result.first.mName == ''){
          final String? mEmail = prefs.getString('m_email');
          if(mEmail == null){
            await prefs.setString('m_email', init.result.first.mEmail);
          }
          await prefs.setInt('m_idx', init.result.first.mIdx);
          Get.offAllNamed(Routes.SIGNADD,);
        }
        else{
          await prefs.setInt('m_idx', init.result.first.mIdx);
        }
        InfoMember info = init.result.first;
        infoM.value = info;
        mAddDong.value = info.mAddDong;
        mAdd.value = info.mAdd;
        update();
        try{
          await SrcDealController.to.getDealDataInits(init.result.first.mIdx);
        }catch(_){

        }

        try{
          String? apns = defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform ==  TargetPlatform.macOS
              ? await FirebaseMessaging.instance.getAPNSToken()
              : null ;
          String? fcmToken =  await FirebaseMessaging.instance.getToken();
          if(fcmToken == null || fcmToken == ''){
            await AuthController.to.logout('srcInfoController fail uuid token');
          }

          if(info.mUuid == '' || (info.mUuid != '' && info.mUuid != fcmToken))
          {
            AuthBagicApi row = await _srcInfoRepository.memberUUID(uuid: fcmToken!);
            if(row.status == 200){
              infoM.value.mUuid = fcmToken.toString();
            }else{
              await AuthController.to.logout('srcInfoController fail uuid');
            }
          }
        } catch(_){
          await AuthController.to.logout('srcInfoController fail uuid token');
        }
        try{
          String model = await _getDeviceInfo();
          if(info.mModel == '' || info.mModel != model)
          {
            AuthBagicApi row = await _srcInfoRepository.memberModel(model: model);
            if(row.status == 200){
              infoM.value.mModel = model;
            }
            else{
              AuthController.to.logout('srcInfoController fail model');
              _commonWidgets.customSnackbar('장치관리 설정 실패');
            }
          }
          if(GetPlatform.isIOS){
            final noti = await _permissionHandlerManager.checkPermission(PermissionHandlerManager.noti);
            if(noti == PermissionHandlerManager.granted){
              notiValue.value = false;
              update();
            } else{
              notiValue.value = true;
              update();
            }
          }
        } catch(_){
          AuthController.to.logout('srcInfoController fail model');
        }
        if(info.mName != ''){
          if(info.mMpPush == '' || info.mEditDateMp == ''){
            await openAd(Get.context!);
          }
        }

      } else{
        await AuthController.to.logout('srcInfoController fail init');
      }


      fcmToken.value = infoM.value.mUuid;
      mIsUsed.value = infoM.value.mIsUsed;
      update();
      return authMemberInit.value = init;
    } catch(_) {
      await AuthController.to.logout('srcInfoController fail catch err');
      return authMemberInit.value = AuthInfo(status: 0, msg: '', result: []);
    }
  }


  Future<String> _getDeviceInfo() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(GetPlatform.isIOS)
    {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return IosManager.convertIoSName(iosInfo.utsname.machine).toString();
    }
    else if(GetPlatform.isAndroid)
    {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model.toString();
    }
    else{
      return '';
    }
  }


  Future<AuthInfo> updateUserInfo() async {
    var info = await _srcInfoRepository.getUserInfo();

    if(info.status == 200)
    {
      mIsUsed.value = info.result[0].mIsUsed;
      mAdd.value = info.result[0].mAdd;
      mAddDong.value = info.result[0].mAddDong;
      infoM.value = info.result[0];
      authMemberInit.value.result[0] = info.result[0];
    }
    update();
    return updateInfo.value = info;
  }

  void getMyInfoUpdate(AuthInfo info){
    infoM.value = info.result.first;
    update();
  }




  void openDialogConfirm({
    required BuildContext routerContext,
    required String title,
    required String content,
    String? date,
    String? result,
    required bool isBox,
    required bool isOneButton,
    required GestureTapCallback confirm,
    GestureTapCallback? refuse,
  }) {
    _commonWidgets2.basicNotiDialog(
        routerContext: routerContext,
        title: title,
        content: content,
        date: date ?? '',
        result: result ?? '',
        isBox: isBox,
        confirm: confirm,
        isOneButton: isOneButton,
        refuse: refuse ?? (){Get.back();}
    );
  }


  String formatDate() {
    String allTime = DateFormat("yyyy년 MM월 dd일").format(DateTimeConfig().now);
    return allTime;
  }

  Future<void> openAd(BuildContext context) async{
    final String date = formatDate();
    final NotiConfirm confirm = await AuthController.to.notiConfirmRead();

    openDialogConfirm(
        isOneButton: false,
        routerContext: context,
        title: confirm.mpTitle,
        content: confirm.mpContent,
        isBox: false,
        refuse: () async{
          await AuthController.to.notiConfirmUpdate(mpPush: 'N', mpDate: date);
          Get.back();
          openDialogConfirm(
              isOneButton: true,
              routerContext: context,
              title:  '광고성 정보 수신 처리 결과',
              date: date,
              result: '',
              content: '수신거부 처리 완료',
              isBox: true,
              confirm: (){},
              refuse: () async{
                final NotiConfirm confirm = await AuthController.to.notiConfirmRead();
                await _etcEtcRepository.getPushStatus(
                    appPush: 'Y',
                    gwanggoPush: 'Y',
                    chatPush: 'Y',
                    mpPush: confirm.mpPush,
                    mPeditDate: confirm.mpDate,
                );
                await statusCheckRe();
                Get.back();
              }
          );
        },
        confirm: () async{
          await AuthController.to.notiConfirmUpdate(mpPush: 'Y', mpDate: date);
          Get.back();
          openDialogConfirm(
              isOneButton: true,
              routerContext: context,
              title:  '광고성 정보 수신 처리 결과',
              date: date,
              result: '',
              content: '수신동의 처리 완료',
              isBox: true,
              confirm: (){},
              refuse: () async{
                final NotiConfirm confirm = await AuthController.to.notiConfirmRead();
                await _etcEtcRepository.getPushStatus(
                    appPush: 'Y',
                    gwanggoPush: 'Y',
                    chatPush: 'Y',
                    mpPush: confirm.mpPush,
                    mPeditDate: confirm.mpDate,
                );
                await statusCheckRe();
                Get.back();
              }
          );
        });

  }




  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    await statusCheckRe();
    PhotoManager.clearFileCache();
  }

}