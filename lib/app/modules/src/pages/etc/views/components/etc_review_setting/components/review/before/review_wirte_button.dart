import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/components/disable_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../components/common_widgets.dart';
import '../../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../src_components/controllers/src_info_controller.dart';
import '../../../../../../../../styles/image_data.dart';
import '../../../../../../controllers/etc_review_setting_controller.dart';

class ReviewWriteButton extends GetView<EtcReviewSettingController> {
  final String smMid;
  final int ruDiIdx;
  const ReviewWriteButton({
    required this.smMid,
    required this.ruDiIdx,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        onTap: (){
          Future.delayed(Duration.zero, (){
            showDialog<String>(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) =>
                    PopScope(
                      canPop: false,
                      onPopInvoked: (bool didPop) async{
                        if(didPop){
                          return;
                        }
                      },
                      child: Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox12))
                        ),
                        child: GestureDetector(
                          onTap: (){
                            controller.focus.unfocus();
                          },
                          child: Container(
                            color: Style.white,
                            width: WidgetSize(context).reviewDialog,
                            padding: EdgeInsets.only(
                              right: WidgetSize(context).sizedBox16,
                              left: WidgetSize(context).sizedBox16,
                              top: WidgetSize(context).sizedBox20,
                              bottom: WidgetSize(context).sizedBox15,
                            ),
                            child: Obx(
                                    () {
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('후기 쓰기', style: TextStyle(color: Style.blackWrite, fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox24),),
                                            RippleDecorationButton(
                                              onTap: (){
                                                controller.initSendReview();
                                              },
                                              widget: Icon(Icons.close, color: Style.blackWrite, size: WidgetSize(context).sizedBox30,),
                                            )
                                          ],
                                        ),

                                        SizedBox(
                                          height: WidgetSize(context).sizedBox30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List.generate(
                                              5, (index) =>
                                              Padding(
                                                padding: EdgeInsets.only(right: WidgetSize(context).sizedBox10),
                                                child: RippleImageButtonColors(
                                                  borderRadius: BorderRadius.circular(999),
                                                    onTap: (){
                                                      controller.reviewContact(index);
                                                    },
                                                    image:  !controller.pointCheck[index]
                                                        ? ImageData2(AppElement.iconStarN, WidgetSize(context).sizedBox32)
                                                        : ImageData2(AppElement.iconStar, WidgetSize(context).sizedBox32)
                                                ),
                                              )
                                          ),
                                        ),
                                        SizedBox(
                                            height: WidgetSize(context).sizedBox10
                                        ),
                                        SizedBox(
                                          height: WidgetSize(context).sizedBox20,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(controller.switchCasePointName(),
                                                style: TextStyle(
                                                    color: Style.brown,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: WidgetSize(context).sizedBox14
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: WidgetSize(context).sizedBox14
                                        ),
                                        TextField(
                                          onChanged: controller.inputReview,
                                          focusNode: controller.focus,
                                          style: TextStyle(fontSize: WidgetSize(context).sizedBox14, color: Style.blackWrite),
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 8,
                                          maxLength: 1000,
                                          cursorColor: Style.ultimateGrey,
                                          decoration: InputDecoration(
                                              counterStyle: TextStyle(fontSize: WidgetSize(context).sizedBox14, color: Style.grey999999,fontWeight: FontWeight.w400),
                                              hintStyle: TextStyle(fontSize: WidgetSize(context).sizedBox14, color: Style.grey999999),
                                              hintText: '상담 후기를 적어주세요.',
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.ultimateGrey)
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide:  BorderSide(width: WidgetSize(context).sizedBox1, color:
                                                  controller.reviewInput.value == ''
                                                      ? Style.greyCCCCCC
                                                      : Style.yellow
                                                  )
                                              )
                                          ),
                                        ),
                                        SizedBox(
                                            height: WidgetSize(context).sizedBox10
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: List.generate(3, (index) =>
                                                _imageArea(context: context, index: index)
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: WidgetSize(context).sizedBox15
                                        ),
                                        !controller.dataSend.value ?
                                        NeumorphicButtons(
                                            text: '후기 쓰기',
                                            onPressed: () async {
                                             switch(Get.isSnackbarOpen){
                                               case true:
                                                 Get.back();
                                               case false:
                                                 FocusScope.of(context).unfocus();
                                                 if (controller.reviewPoint.value == 0) {
                                                   controller.commonWidgets.customSnackbar(
                                                       '후기 별점은 필수 항목이에요!');
                                                 }
                                                 else if(controller.reviewInput.value == '' || !controller.regExpS(controller.reviewInput.value)){
                                                   controller.commonWidgets.customSnackbar(
                                                       '후기 입력은 필수 항목이에요!');
                                                 }
                                                 else{
                                                   await controller
                                                       .writeReview(
                                                       mName: SrcInfoController.to.infoM.value
                                                           .mName,
                                                       ruDiIdx: ruDiIdx,
                                                       userIdx: SrcInfoController.to.infoM.value
                                                           .mIdx,
                                                       smMid: smMid,
                                                       ruPoint: controller.reviewPoint.value,
                                                       ruContent: controller.reviewInput.value,
                                                       mPathImageEdit1: controller.imagePath[0] == null ? '' : controller.imagePath[0]!.path ,
                                                       mPathImageEdit2: controller.imagePath[1] == null ? '' : controller.imagePath[1]!.path ,
                                                       mPathImageEdit3: controller.imagePath[2] == null ? '' : controller.imagePath[2]!.path );
                                                 }

                                             }

                                            })
                                            :
                                        DisableButton(text: '후기 등록중')
                                      ],
                                    ),
                                  );
                                }
                            ),
                          ),
                        ),
                      ),
                    )
            );
          });
        },
        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox12),
        color: Style.yellow,
        borderRadius: BorderRadius.circular(999),
        widget: Text('후기 쓰기',style: TextStyle(fontSize: WidgetSize(context).sizedBox14, color:Style.brown, fontWeight: FontWeight.w400),
        )
    );
  }

  Widget _defaultImage(){
    return Center(
      child: SvgPicture.asset(
        AppElement.defaultImgIcon,
        fit: BoxFit.fitHeight,
        colorFilter: ColorFilter.mode(Style.greyCCCCCC, BlendMode.srcIn),
        // color: ,
      ),
    );
  }

  Widget _imageArea({
    required BuildContext context,
    required int index
  }) {
    return controller.imagePath[index] == null
        ?
    RippleDecorationButton(
        onTap: () {
          controller.focus.unfocus();
          controller.switchRouteCaseUpload(index);
        },
        margin: EdgeInsets.only(right: WidgetSize(context).sizedBox18),
        padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
        width: WidgetSize(context).sizedBox144,
        height: WidgetSize(context).sizedBox144/1.618,
        border: Border.all(
            width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC),
        widget: _defaultImage()
    ) :
    Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC),
      ),
      margin: EdgeInsets.only(right: WidgetSize(context).sizedBox16),
      child: RippleImageButton(
          image: SizedBox(
            width: WidgetSize(context).sizedBox144,
            height: WidgetSize(context).sizedBox144/1.618,
            child: Image.file(
              File(controller.imagePath[index]!.path), fit: BoxFit.cover,),
          ), onTap: (){
        FocusScope.of(context).unfocus();
        controller.switchRouteCaseDelete(context: context, index: index);
      }),
    );
  }
}
