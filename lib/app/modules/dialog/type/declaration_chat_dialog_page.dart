import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/dialog/dialog_page.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../components/disable_button.dart';
import '../../../components/neumorphic_buttons.dart';
import '../../../components/widget_components/ripple_button/ripple_search_icon_button.dart';
import '../../../css/size.dart';
import '../../../css/style.dart';
import '../../src/pages/widgets/service/service_moduels/controllers/chat_declaration_controller.dart';
import '../../src/src_components/controllers/src_info_controller.dart';

class DeclarationChatPage extends StatelessWidget {
  const DeclarationChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogPage(
        onPopInvoked: (bool didPop, Object? result){
          if(didPop){
            return;
          }
          Get.back();
          },
        body: BasicCanvas(
          canPop: true,
          body: _DeclarationChatBody(),
          bottomNavigationBar: _DeclarationChatNav(),
        )
    );
  }
}


class _DeclarationChatNav extends StatelessWidget {
  const _DeclarationChatNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: GetX<ChatDeclarationController>(
          builder: (controller) =>
          SizedBox(
            height: controller.deviceHeight.value,
            child: Padding(
              padding: WidgetSize(context).paddingBodyWhole,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  controller.declarationNoti.value != 0
                      ?
                  DisableButton(text: '잠시만 기다려주세요...')
                      :
                  NeumorphicButtons(
                      text: '신고하기',
                      onPressed: () async{
                        if(Get.isSnackbarOpen){
                          Get.back();
                        } else{
                          if(controller.dropdownValue.value == ''){
                            controller.commonWidgets.customSnackbar('신고 이유 선택은 필수입니다.');
                          } else{
                            await controller.postDeclaration(
                              crIdx: controller.roomList.value.crIdx,
                              smName: controller.roomList.value.smStoreName,
                              bruMidx: SrcInfoController.to.infoM.value.mIdx,
                              bruRoomIdx: '${controller.roomList.value.crIdx}',
                              bruType: controller.type.value,
                              bruMidxPe: '${SrcInfoController.to.infoM.value.mIdx}', bruSmMid: controller.roomList.value.smMId,
                              bruTitle: controller.dropdownValue.value,
                              bruContent: controller.declarationInput.value, bruPathImageEdit1: controller.imagePath[0] == null ? '' : controller.imagePath[0]!.path,
                              bruPathImageEdit2: controller.imagePath[1] == null ? '' : controller.imagePath[1]!.path,
                              bruPathImageEdit3: controller.imagePath[2] == null ? '' : controller.imagePath[2]!.path,
                            );

                          }
                        }
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class _DeclarationChatBody extends StatelessWidget {
  const _DeclarationChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ChatDeclarationController>(
        builder: (controller) {
          Widget _dialogTopTextCancleIcon(){
            return Padding(
              padding: EdgeInsets.only(
                  top: WidgetSize(context).sizedBox16, bottom: WidgetSize(context).sizedBox24,
                  left: WidgetSize(context).sizedBox16, right: WidgetSize(context).sizedBox5),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('신고하기', style: TextStyle(
                        fontSize: WidgetSize(context).sizedBox28,
                        fontWeight: FontWeight.w700,
                        color: Style.blackWrite
                    ),
                    ),
                    RippleIconButton(
                        onTap: (){
                          Get.back();
                        },
                        iconSize: WidgetSize(context).sizedBox45,
                        icon: Icons.close, iconColor:  Style.blackWrite)
                  ],
                ),
              ),
            );
          }
          Widget _dialogNameArea(){
            return Padding(
              padding: EdgeInsets.only(
                  right: WidgetSize(context).sizedBox16,
                  left: WidgetSize(context).sizedBox16,
                  bottom: WidgetSize(context).sizedBox8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("'${controller.roomList.value.smStoreName}'",
                    style: TextStyle(color: Style.red, fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox22),
                  ),
                  Text('${controller.text.value}', style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox22,
                      fontWeight: FontWeight.w700,
                      color: Style.blackWrite
                  ),
                  ),
                ],
              ),
            );
          }

          Future modalOnTap() {
            final ScrollController _firstController = ScrollController();
            return showModalBottomSheet(
                isDismissible: true,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    color: Style.white,
                    child: SafeArea(
                      child: Container(
                        child: Container(
                          height: WidgetSize(context).etc0156*controller.items.length,
                          child: Scrollbar(
                            thumbVisibility: true,
                            controller: _firstController,
                            child: ListView(
                              controller: _firstController,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      controller.items.length,
                                          (index) =>
                                          RippleDecorationButton(
                                              onTap: () {
                                                controller.dropdownValue.value = controller.items[index];
                                                Navigator.pop(context);
                                              },
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: WidgetSize(context).width00025,
                                                      color: Style.greyDDDDDD
                                                  )
                                              ),
                                              height: WidgetSize(context).etc0156,
                                              widget: Center(
                                                  child: Text(
                                                    controller.items[index],
                                                    style: TextStyle(
                                                        color: Style.blackWrite,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: WidgetSize(context).sizedBox14),
                                                  )
                                              )
                                          )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }

          Widget _dialogModalSelectReason(){
            return Padding(
              padding: EdgeInsets.all(
                WidgetSize(context).sizedBox16
              ),
              child: RippleDecorationButton(
                  onTap: () async{
                    await modalOnTap();
                  },
                  borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
                  border: Border.all(width: WidgetSize(context).sizedBox1, color:
                  controller.dropdownValue.value == ''
                      ? Style.greyCCCCCC
                      : Style.yellow
                  ),
                  padding: EdgeInsets.only(left: WidgetSize(context).sizedBox10),
                  height: WidgetSize(context).height60px,
                  width: WidgetSize(context).widthCommon,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          controller.dropdownValue.value == ''
                              ? '신고하는 이유를 선택해주세요 (필수)'
                              :  controller.dropdownValue.value
                          , style: TextStyle(
                            color:
                            controller.dropdownValue.value == ''
                                ? Style.grey999999
                                : Style.blackWrite, fontSize: WidgetSize(context).sizedBox17, fontWeight: FontWeight.w400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Style.yellow, size: WidgetSize(context).sizedBox34,)
                    ],
                  )
              ),
            );
          }

          Widget _dialogTextField(){
            return Padding(
              padding: EdgeInsets.all(
                  WidgetSize(context).sizedBox16
              ),
              child: TextField(
                onChanged: controller.inputDeclaration,
                style: TextStyle(fontSize: WidgetSize(context).sizedBox17, color: Style.blackWrite, fontWeight: FontWeight.w400),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                maxLength: 5000,
                cursorColor: Style.ultimateGrey,
                decoration: InputDecoration(
                    counterStyle: TextStyle(fontSize: WidgetSize(context).sizedBox14, color: Style.grey999999,fontWeight: FontWeight.w400),
                    hintStyle: TextStyle(fontSize: WidgetSize(context).sizedBox17, color: Style.grey999999,fontWeight: FontWeight.w400),
                    hintText: '상세하게 적어주세요 (선택사항)',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.ultimateGrey)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(width: WidgetSize(context).sizedBox1, color:
                        controller.declarationInput.value == ''
                            ? Style.greyCCCCCC
                            : Style.yellow
                        )
                    )
                ),
              ),
            );
          }

          // Widget _defaultImage(){
          //   return Center(
          //     child: SvgPicture.asset(
          //       AppElement.defaultImgIcon,
          //       fit: BoxFit.fitHeight,
          //       colorFilter: ColorFilter.mode(Style.greyCCCCCC, BlendMode.srcIn),
          //       // color: ,
          //     ),
          //   );
          // }

          Widget _imageArea(int index) {
            return controller.imagePath[index] == null
                ?
            RippleDecorationButton(
                onTap: (){
                  controller.switchRouteCaseUpload(index);
                },
                margin: EdgeInsets.only(right: WidgetSize(context).sizedBox16),
                padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
                border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC),
                width: controller.imageSize,
                height: controller.imageSize,
                widget: Center(
                  child: SvgPicture.asset(
                    AppElement.defaultImgIcon,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Style.greyCCCCCC, BlendMode.srcIn),
                    // color: ,
                  ),
                )
            ) : Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(right: WidgetSize(context).sizedBox16),
              child: RippleImageButton(
                image: SizedBox(
                  width: controller.imageSize,
                  height: controller.imageSize,
                  child: Image.file(File(controller.imagePath[index]!.path), fit: BoxFit.cover,),
                ),
                onTap: (){
                  controller.switchRouteCaseDelete(context: context, index: index);
                },
              ),
            );

          }

          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Style.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _dialogTopTextCancleIcon(),
                    _dialogNameArea(),
                    _dialogModalSelectReason(),
                    _dialogTextField(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: WidgetSize(context).sizedBox16,
                          left: WidgetSize(context).sizedBox16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(3, (index) =>
                              _imageArea(index)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
