import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/components/disable_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../components/common_widgets.dart';
import '../../../css/size.dart';
import '../../../css/style.dart';
import '../../../routes/const_element.dart';
import '../../src/pages/store/pages/store_detail/controllers/store_detail_controller.dart';
import '../../src/src_components/controllers/src_info_controller.dart';

class DeclarationPage extends GetView<StoreDetailController> {
  final bool isOnly;
  final String type;
  final String ruIdx;
  final String nickName;
  final String text;
  final String userIdx;
  final String smId;
  const DeclarationPage({
    super.key,
    required this.isOnly,
    required this.type,
    required this.ruIdx,
    required this.nickName,
    required this.text,
    required this.userIdx,
    required this.smId,
  });

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
      canPop: false,
      onPopInvoked: (bool didPop, Object? result){
        if(didPop){
          return;
        }
        controller.initDeclaration();
        Get.back();
      },
      body: _DeclarationBody(
        isOnly: isOnly,
        type: type,
        ruIdx: ruIdx,
        nickName: nickName,
        text: text, userIdx: userIdx,
        smId: smId,
      ),
      bottomNavigationBar: _DeclarationNav(type: type, ruIdx: ruIdx, userIdx: userIdx, smId: smId,),
    );
  }
}



class _DeclarationBody extends StatelessWidget {
  final bool isOnly;
  final String type;
  final String ruIdx;
  final String nickName;
  final String text;
  final String userIdx;
  final String smId;

  const _DeclarationBody({
    super.key,
    required this.isOnly,
    required this.type,
    required this.ruIdx,
    required this.nickName,
    required this.text,
    required this.userIdx,
    required this.smId,

  });

  @override
  Widget build(BuildContext context) {
    return  GetX<StoreDetailController>(
        builder: (StoreDetailController controller) {
          Future modalOnTap() {
            return showModalBottomSheet(
                isDismissible: true,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    color: Style.white,
                    child: SafeArea(
                      child: SizedBox(
                        height: WidgetSize(context).etc0156*controller.items.length,
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: ListView(
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
                  );
                });
          }

          return GestureDetector(
            onTap: controller.focus.unfocus,
            child: Container(
              color: Style.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: WidgetSize(context).sizedBox16, bottom: WidgetSize(context).sizedBox24,
                          left: WidgetSize(context).sizedBox16, right: WidgetSize(context).sizedBox5),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('신고하기', style: TextStyle(
                                fontSize: WidgetSize(context).sizedBox28,
                                fontWeight: FontWeight.w700,
                                color: Style.blackWrite
                            ),
                            ),
                            RippleIconButton(
                                onTap: (){
                                  controller.initDeclaration();
                                  Get.back();
                                },
                                iconSize: WidgetSize(context).sizedBox45,
                                icon: Icons.close, iconColor:  Style.blackWrite)

                          ],
                        ),
                      ),
                    ),
                   Padding(
                     padding: WidgetSize(context).paddingBodyWhole,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("'$nickName'",
                               style: TextStyle(color: Style.red, fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox22),
                             ),
                             Text(text, style: TextStyle(
                                 fontSize: WidgetSize(context).sizedBox22,
                                 fontWeight: FontWeight.w700,
                                 color: Style.blackWrite
                             ),
                             ),
                           ],
                         ),
                         SizedBox(height: WidgetSize(context).sizedBox16,),
                         RippleDecorationButton(
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
                         SizedBox(height: WidgetSize(context).sizedBox16,),
                         TextField(
                           onChanged: controller.inputDeclaration,
                           focusNode: controller.focus,
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
                                    borderRadius:  BorderRadius.circular(WidgetSize(context).sizedBox8),
                                   borderSide: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.ultimateGrey)
                               ),
                               enabledBorder: OutlineInputBorder(
                                   borderRadius:  BorderRadius.circular(WidgetSize(context).sizedBox8),
                                   borderSide:  BorderSide(width: WidgetSize(context).sizedBox1, color:
                                   controller.declarationInput.value == ''
                                       ? Style.greyCCCCCC
                                       : Style.yellow
                                   )
                               )
                           ),
                         ),
                         SizedBox(height: WidgetSize(context).sizedBox16,),
                       ],
                     ),
                   ),
                    Padding(
                      padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(3, (index) =>
                          controller.imagePath[index] == null
                              ?  RippleDecorationButton(
                              onTap: (){
                                controller.focus.unfocus();
                                controller.switchRouteCaseUpload(index);
                              },
                              borderRadius:  BorderRadius.circular(WidgetSize(context).sizedBox8),
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
                          )

                              :
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(WidgetSize(context).sizedBox8),
                              color: Colors.transparent,
                            ),
                            margin: EdgeInsets.only(right: WidgetSize(context).sizedBox16),
                            child: RippleImageButton(
                              borderRadius:  BorderRadius.circular(WidgetSize(context).sizedBox8),
                              image: ClipRRect(
                                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
                                child: SizedBox(
                                  width: controller.imageSize,
                                  height: controller.imageSize,
                                  child: Image.file(File(controller.imagePath[index]!.path), fit: BoxFit.cover,),
                                ),
                              ),
                              onTap: (){
                                controller.focus.unfocus();
                                controller.switchRouteCaseDelete(context: context, index: index);
                              },
                            ),
                          )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: WidgetSize(context).sizedBox16,
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}



class _DeclarationNav extends StatelessWidget {
  final String type;
  final String ruIdx;
  final String userIdx;
  final String smId;
  const _DeclarationNav({super.key,
    required this.type,
    required this.ruIdx,
    required this.userIdx,
    required this.smId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.white,
      child: SafeArea(
        child: Container(
          height: AppElement.defaultBottomPadding,
          color: Style.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: WidgetSize(context).paddingBodyWhole,
                child:  GetX<StoreDetailController>(
                    builder: (controller) =>
                    controller.declarationLoading.value != 0
                        ?  controller.declarationLoading.value == 10
                        ? DisableButton(text: '이전 신고내용이 처리중입니다.')
                        : DisableButton(text: '잠시만 기다려주세요...')
                        : NeumorphicButtons(
                        text: '신고하기',
                        onPressed: () async{
                          if(Get.isSnackbarOpen){
                            Get.back();
                          }
                          else{
                            if(controller.dropdownValue.value == ''){
                              controller.commonWidgets.customSnackbar('신고 사유는 필수입력입니다.');
                            }
                            else{
                              await controller.postDeclaration(
                                bruMidx: SrcInfoController.to.infoM.value.mIdx,
                                bruType: type, bruMidxPe: userIdx, bruSmMid: smId, bruTitle: controller.dropdownValue.value,
                                bruRuidx: ruIdx,
                                bruContent: controller.declarationInput.value,
                                bruPathImageEdit1: controller.imagePath[0] == null ? '' : controller.imagePath[0]!.path,
                                bruPathImageEdit2: controller.imagePath[1] == null ? '' : controller.imagePath[1]!.path,
                                bruPathImageEdit3: controller.imagePath[2] == null ? '' : controller.imagePath[2]!.path,
                              );
                            }
                          }
                        }
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

