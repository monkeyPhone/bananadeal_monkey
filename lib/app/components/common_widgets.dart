import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../css/size.dart';
import '../css/style.dart';
import '../modules/src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';



class CommonWidgets{
  void customSnackbar(String text){
    Get.isSnackbarOpen
        ? null
        : Get.snackbar('', '',
      backgroundColor: Style.karajeck,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('알림', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w700, color: Style.white), textAlign: TextAlign.left,),
          SizedBox(height: WidgetSize(Get.context!).sizedBox12,)
        ],
      ),
      messageText: Text(text, style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400, color: Style.white),textAlign: TextAlign.left,),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

    );
  }

  void customSnackbarBottom(text){
    Get.isSnackbarOpen
        ? null
        : Get.snackbar('', '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Style.white,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('', style: TextStyle(fontSize: WidgetSize(context).sizedBox20, fontWeight: FontWeight.w700, color: Style.blackWrite), textAlign: TextAlign.left,),
          // SizedBox(height: WidgetSize(context).sizedBox12,)
        ],
      ),
      messageText: Text(text, style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w400, color: Style.blackWrite),textAlign: TextAlign.left,),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackStyle: SnackStyle.FLOATING,

    );
  }

  void customSnackbarE(text){
    Get.isSnackbarOpen
        ? null
        : Get.snackbar('', '',
      backgroundColor: Style.karajeck,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('에러', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w700, color: Style.white), textAlign: TextAlign.left,),
          SizedBox(height: WidgetSize(Get.context!).sizedBox12,)
        ],
      ),
      messageText: Text(text, style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400, color: Style.white),textAlign: TextAlign.left,),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

    );
  }


  void customSnackbarFailLogin({required int status,required String text}){
    Get.isSnackbarOpen
     ? null
     : Get.snackbar('', '',
      backgroundColor: Style.karajeck,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('에러코드 ${status}', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w700, color: Style.white), textAlign: TextAlign.left,),
          SizedBox(height: WidgetSize(Get.context!).sizedBox12,)
        ],
      ),
      messageText: Text(text+ '로그인 실패', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400, color: Style.white),textAlign: TextAlign.left,),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

    );
  }


  void customSnackbarTokenMessage(){
    Get.isSnackbarOpen
     ? null
     : Get.snackbar('', '',
      backgroundColor: Style.karajeck,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('토큰 만료', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w700, color: Style.white), textAlign: TextAlign.left,),
          SizedBox(height: WidgetSize(Get.context!).sizedBox12,)
        ],
      ),
      messageText: Text('로그인 설정 시간이 만료되었어요. 재로그인 부탁드릴게요!', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400, color: Style.white),textAlign: TextAlign.left,),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

    );
  }

  void customSnackbarTokenMessageTwhice(){
    Get.isSnackbarOpen
        ? null
        : Get.snackbar('', '',
      backgroundColor: Style.karajeck,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('중복 로그인', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w700, color: Style.white), textAlign: TextAlign.left,),
          SizedBox(height: WidgetSize(Get.context!).sizedBox12,)
        ],
      ),
      messageText: Text('중복 로그인이 되었어요. 재로그인 부탁드릴게요!', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400, color: Style.white),textAlign: TextAlign.left,),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

    );
  }
  void customSnackbarTokenMessageError(){
    Get.isSnackbarOpen
      ? null
      : Get.snackbar('', '',
      backgroundColor: Style.karajeck,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('알림', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w700, color: Style.white), textAlign: TextAlign.left,),
          SizedBox(height: WidgetSize(Get.context!).sizedBox12,)
        ],
      ),
      messageText: Text('로그인 정보 전송에 실패했어요. 재로그인 부탁드릴게요!', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400, color: Style.white),textAlign: TextAlign.left,),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

    );
  }


  void customSnackbarQuitMessage(){
    Get.isSnackbarOpen
        ? null
        : Get.snackbar('', '',
      backgroundColor: Style.karajeck,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('회원탈퇴', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w700, color: Style.white), textAlign: TextAlign.left,),
          SizedBox(height: WidgetSize(Get.context!).sizedBox12,)
        ],
      ),
      messageText: Text('계정이 삭제되었어요\n지금까지 이용해주셔서 감사드려요!', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400, color: Style.white),textAlign: TextAlign.left,),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

    );
  }

  void customSnackbarErrorMessage(String error){
    Get.isSnackbarOpen
      ? null
      : Get.snackbar('', '',
      backgroundColor: Style.karajeck,//Color(0xAA000000),
      titleText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('에러 발생', style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox20, fontWeight: FontWeight.w700, color: Style.white), textAlign: TextAlign.left,),
          SizedBox(height: WidgetSize(Get.context!).sizedBox12,)
        ],
      ),
      messageText: Text(
        '설정으로 들어가, 데이터 초기화를 시켜보세요!\n\n($error)',
        style: TextStyle(fontSize: WidgetSize(Get.context!).sizedBox18, fontWeight: FontWeight.w400, color: Style.white),textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
      ),
      borderRadius: WidgetSize(Get.context!).sizedBox14,
      margin: WidgetSize(Get.context!).paddingBodyWhole,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

    );
  }



  void customBlockDialog({ required BuildContext routerContext,
    required bool barrierDismissible, required String nickName, required int routeCase, required String smID,
    required GestureTapCallback conFirmOnTap, GestureTapCallback? cancleOnTap
  }){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          barrierDismissible: barrierDismissible,
          context: routerContext,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(Get.context!).sizedBox12))
                ),
                child: GetX<StoreDetailController>(
                    builder: (controller) {
                      return Container(
                        color: Colors.transparent,
                        constraints: BoxConstraints(
                            minWidth: WidgetSize(Get.context!).widthCommon,
                            maxWidth: WidgetSize(Get.context!).widthCommon,
                            minHeight: WidgetSize(Get.context!).widthDec,
                            maxHeight: WidgetSize(Get.context!).heightCommon
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              color: Colors.transparent,
                              padding: WidgetSize(Get.context!).paddingBodyWhole,
                              height: WidgetSize(Get.context!).sizedBox72,
                              child: Row(
                                children: [
                                  Text('차단 알림', style: TextStyle(color: Style.blackWrite, fontWeight: FontWeight.w700, fontSize: WidgetSize(Get.context!).sizedBox22),)
                                ],
                              ),
                            ),
                            Container(
                              height: WidgetSize(Get.context!).etc01,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Style.yellow,
                                          width: WidgetSize(Get.context!).sizedBox4
                                      )
                                  )
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: WidgetSize(Get.context!).sizedBox32, horizontal: WidgetSize(Get.context!).sizedBox24),
                              constraints: BoxConstraints(
                                minHeight: WidgetSize(Get.context!).sizedBox144,
                                maxHeight: WidgetSize(Get.context!).height1_2,
                              ),
                              child:
                              smID == ''
                                  ?
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("'$nickName'",
                                    style: TextStyle(color: Style.red, fontWeight: FontWeight.w700, fontSize: WidgetSize(Get.context!).sizedBox18),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('을(를) 차단하시겠어요?', style: TextStyle(
                                      fontSize: WidgetSize(Get.context!).sizedBox18,
                                      fontWeight: FontWeight.w700,
                                      color: Style.blackWrite
                                  ),
                                  ),
                                  SizedBox(height: WidgetSize(Get.context!).sizedBox8,),
                                  SizedBox(height: WidgetSize(Get.context!).sizedBox8,),
                                  Text('차단 이후, 해당 유저의 댓글이', style: TextStyle(
                                      fontSize: WidgetSize(Get.context!).sizedBox17,
                                      fontWeight: FontWeight.w400,
                                      color: Style.blackWrite
                                  ),
                                  ),
                                  Text('모두 블라인드 처리됩니다.', style: TextStyle(
                                      fontSize: WidgetSize(Get.context!).sizedBox17,
                                      fontWeight: FontWeight.w400,
                                      color: Style.blackWrite
                                  ),
                                  ),
                                ],
                              )
                                  :
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("'$nickName'",
                                    style: TextStyle(color: Style.red, fontWeight: FontWeight.w700, fontSize: WidgetSize(Get.context!).sizedBox20),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('을(를) 차단하시겠어요?', style: TextStyle(
                                      fontSize: WidgetSize(Get.context!).sizedBox18,
                                      fontWeight: FontWeight.w700,
                                      color: Style.blackWrite
                                  ),
                                  ),
                                  SizedBox(height: WidgetSize(Get.context!).sizedBox16,),

                                  Text('해당 매장은 목록에서 제외되며,', style: TextStyle(
                                      fontSize: WidgetSize(Get.context!).sizedBox18,
                                      fontWeight: FontWeight.w400,
                                      color: Style.blackWrite
                                  ),
                                  ),
                                  Text('차단 해제 이전까지', style: TextStyle(
                                      fontSize: WidgetSize(Get.context!).sizedBox18,
                                      fontWeight: FontWeight.w400,
                                      color: Style.blackWrite
                                  ),
                                  ),
                                  Text('초대장 및 채팅을 보낼 수 없습니다.', style: TextStyle(
                                      fontSize: WidgetSize(Get.context!).sizedBox18,
                                      fontWeight: FontWeight.w400,
                                      color: Style.blackWrite
                                  ),
                                  ),
                                  Text('진행중인 모든 딜과 채팅이 종료됩니다.', style: TextStyle(
                                      fontSize: WidgetSize(Get.context!).sizedBox18,
                                      fontWeight: FontWeight.w400,
                                      color: Style.blackWrite
                                  ),
                                  ),
                                  SizedBox(height: WidgetSize(Get.context!).sizedBox16,),
                                  routeCase == 0
                                      ?
                                  SizedBox()
                                      :
                                  Text(routeCase == 1 ? '(경고, 수락된 딜과 진행중인 채팅방이 있습니다)' : routeCase == 2 ? '(경고, 수락된 딜이 있습니다)'
                                      : routeCase == 3 ?  '(진행중인 채팅방이 있습니다)' : '',
                                    style: TextStyle(
                                        fontSize: WidgetSize(Get.context!).sizedBox16,
                                        fontWeight: FontWeight.w400,
                                        color: Style.red
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: WidgetSize(Get.context!).sizedBox72,
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: RippleDecorationButton(
                                          onTap: cancleOnTap ?? (){
                                            Get.back();
                                            },
                                          color: Style.greyD9D9D9,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(WidgetSize(Get.context!).sizedBox12)),
                                          widget: Center(
                                            child: Text(
                                              '취소',
                                              style: TextStyle(
                                                  color: Style.grey666666,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: WidgetSize(Get.context!).sizedBox20
                                              ),
                                            ),
                                          )
                                      )
                                  ),
                                  Expanded(
                                      child: RippleDecorationButton(
                                          onTap: controller.socketStatusChange.value == 0 ? conFirmOnTap : (){},
                                          color: Style.yellow,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(WidgetSize(Get.context!).sizedBox12)),
                                          widget: Center(
                                            child: Text(
                                              controller.socketStatusChange.value == 0 ? '차단하기' : '진행 중...',
                                              style: TextStyle(
                                                  color: Style.brown,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: WidgetSize(Get.context!).sizedBox20
                                              ),
                                            ),
                                          )
                                      )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              )
      );
    });
  }


  void customDialog({
    required BuildContext routerContext,
    bool? barrierDismissible, required String mainText,
    String? mainText2,
    String? cancleText, required String confirmText, required GestureTapCallback conFirmOnTap, GestureTapCallback? cancleOnTap,
    bool? isOne,
    (String, String)? caption,
  }){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: barrierDismissible ?? false,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(Get.context!).dialogCircular))
                ),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.transparent,
                        padding: WidgetSize(Get.context!).paddingBodyWhole,
                        height: WidgetSize(Get.context!).height60px,
                        child: Row(
                          children: [
                            Text('알림', style: TextStyle(color: Style.blackWrite, fontWeight: FontWeight.w700, fontSize: WidgetSize(Get.context!).sizedBox20),)
                          ],
                        ),
                      ),
                      Container(
                        height: WidgetSize(Get.context!).width001,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                bottom: BorderSide(
                                    color: Style.yellow,
                                    width: WidgetSize(Get.context!).sizedBox4
                                )
                            )
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: WidgetSize(Get.context!).height60px3n1, horizontal: WidgetSize(Get.context!).sizedBox16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            mainText2 != null
                              ?Column(
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    mainText,
                                    style: TextStyle(
                                        color: Style.blackWrite,
                                        fontWeight: FontWeight.w400,
                                        fontSize: WidgetSize(Get.context!).dialogString
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    mainText2,
                                    style: TextStyle(
                                        color: Style.blackWrite,
                                        fontWeight: FontWeight.w400,
                                        fontSize: WidgetSize(Get.context!).dialogString
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            )
                                :
                            Text(
                              mainText,
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(Get.context!).dialogString
                              ),
                              textAlign: TextAlign.center,
                            ),
                            caption != null
                              ?
                            Column(
                              children: [
                                SizedBox(
                                  height: WidgetSize(Get.context!).sizedBox16,
                                ),
                                Column(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        caption.$1,
                                        style: TextStyle(
                                            color: Style.blackWrite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: WidgetSize(Get.context!).sizedBox16
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        caption.$2,
                                        style: TextStyle(
                                            color: Style.blackWrite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: WidgetSize(Get.context!).sizedBox16
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ) : SizedBox(),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: WidgetSize(Get.context!).height60px,
                        child: isOne == true
                            ?  RippleDecorationButton(
                                  onTap: conFirmOnTap,
                                  color: Style.yellow,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(WidgetSize(Get.context!).dialogCircular),
                                    bottomRight: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                  ),
                                  widget: Center(
                                    child: Text(
                                      confirmText,
                                      style: TextStyle(
                                        color: Style.brown,
                                        fontWeight: FontWeight.w400,
                                        fontSize: WidgetSize(Get.context!).dialogString
                                      ),
                                    ),
                                  )
                               )
                            : Row(
                                children: [
                                  Expanded(
                                      child: RippleDecorationButton(
                                          onTap: cancleOnTap ?? (){ Get.back(); },
                                          color: Style.greyD9D9D9,
                                          borderRadius:  BorderRadius.only(
                                              bottomLeft: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                          ),
                                          widget: Center(
                                            child: Text(
                                              cancleText ?? '',
                                              style: TextStyle(
                                                  color: Style.grey666666,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: WidgetSize(Get.context!).dialogString
                                              ),
                                            ),
                                          )
                                      )

                            ),
                            Expanded(
                                child: RippleDecorationButton(
                                    onTap: conFirmOnTap,
                                    color:  Style.yellow,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(WidgetSize(Get.context!).dialogCircular)
                                    ),
                                    widget: Center(
                                      child: Text(
                                        confirmText,
                                        style: TextStyle(
                                            color: Style.brown,
                                            fontWeight: FontWeight.w400,
                                            fontSize: WidgetSize(Get.context!).dialogString
                                        ),
                                      ),
                                    )
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
      );
    });
  }


  void customDialogButton1({
    required BuildContext routerContext,
    required GestureTapCallback onTap,
    required String mainText,
    required String buttonText,
    bool? barrierDismissible
  }){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: barrierDismissible ?? false,
          builder: (BuildContext context) =>
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(Get.context!).sizedBox12))
                ),
                child: Container(
                  width: WidgetSize(Get.context!).widthCommon,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: WidgetSize(Get.context!).sizedBox45, horizontal: WidgetSize(Get.context!).sizedBox16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              mainText,
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: WidgetSize(Get.context!).sizedBox20
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: onTap,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: WidgetSize(Get.context!).sizedBox20),
                                  decoration: BoxDecoration(
                                      color: Style.yellow,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(WidgetSize(Get.context!).sizedBox12),
                                          bottomLeft: Radius.circular(WidgetSize(Get.context!).sizedBox12)
                                      )
                                  ),
                                  child: Center(
                                    child: Text(
                                      buttonText,
                                      style: TextStyle(
                                          color: Style.brown,
                                          fontWeight: FontWeight.w400,
                                          fontSize: WidgetSize(Get.context!).sizedBox20
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
      );
    });
  }

  void customAlertDialogSpecial({
    required BuildContext routerContext,
  }){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Dialog(
                  alignment: Alignment.topCenter,
                  backgroundColor: Style.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).dialogCircular))
                  ),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: WidgetSize(context).sizedBox12,
                        ),
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(
                            WidgetSize(context).sizedBox12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('안내',
                                style: TextStyle(
                                    color: Style.blackWrite,
                                    fontWeight: FontWeight.w700,
                                    fontSize: WidgetSize(Get.context!).sizedBox18),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            vertical: WidgetSize(Get.context!).sizedBox12,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: '팝업창이 나타나면',
                                    style: TextStyle(
                                        fontSize: WidgetSize(context).sizedBox17,
                                        fontWeight: FontWeight.w400,
                                        color: Style.blackWrite
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "\n'모두 허용'\n",
                                          style: TextStyle(
                                              fontSize: WidgetSize(context).sizedBox18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blue
                                          )
                                      ),
                                      TextSpan(
                                        text: "을 선택해주세요.",
                                        style: TextStyle(
                                            fontSize: WidgetSize(context).sizedBox17,
                                            fontWeight: FontWeight.w400,
                                            color: Style.blackWrite
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:  WidgetSize(Get.context!).sizedBox20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
      );
    });
  }

  void alertPermission34({
    required BuildContext routerContext,
    required GestureTapCallback refuse,
  }){
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          context: routerContext,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              Dialog(
                backgroundColor: Style.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).dialogCircular))
                ),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: WidgetSize(context).sizedBox20,
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: WidgetSize(context).sizedBox8,
                        ),
                        height: WidgetSize(context).height60px,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text('접근 권한 안내',
                                style: TextStyle(
                                    color: Style.blackWrite,
                                    fontWeight: FontWeight.w700,
                                    fontSize: WidgetSize(Get.context!).sizedBox19),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical: WidgetSize(Get.context!).sizedBox20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: '"사진 권한 요청" 팝업창이 나타나면',
                                  style: TextStyle(
                                      fontSize: WidgetSize(context).sizedBox18,
                                      fontWeight: FontWeight.w400,
                                      color: Style.blackWrite
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "\n\n'모두 허용'",
                                        style: TextStyle(
                                            fontSize: WidgetSize(context).sizedBox19,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.blue
                                        )
                                    ),
                                    TextSpan(
                                      text: "을 선택해주세요.",
                                      style: TextStyle(
                                          fontSize: WidgetSize(context).sizedBox18,
                                          fontWeight: FontWeight.w400,
                                          color: Style.blackWrite
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:  WidgetSize(Get.context!).sizedBox20,
                      ),
                      Container(
                        color: Colors.transparent,
                        height: WidgetSize(context).sizedBox57,
                        child: RippleDecorationButton(
                            onTap: refuse,
                            borderRadius:  BorderRadius.only(
                                bottomLeft: Radius.circular(WidgetSize(context).dialogCircular),
                                bottomRight: Radius.circular(WidgetSize(context).dialogCircular)
                            ),
                            border: Border(
                              top: BorderSide(
                                width: WidgetSize(context).sizedBox1_5,
                                color: Style.greyEAEAEA,
                              ),
                              right: BorderSide(
                                width: WidgetSize(context).sizedBox1_5,
                                color: Style.greyEAEAEA,
                              ),
                            ),
                            widget: Center(
                              child: Text( '확인',
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: WidgetSize(Get.context!).sizedBox17
                                ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              )
      );
    });
  }


}
