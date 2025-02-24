import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal_body/body4/body4_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/common_widgets.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';
import '../../make_deal/controllers/make_deal_controller.dart';


class StepModalProMotion1 extends GetView<MakeDealController> {
  const StepModalProMotion1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () => Column(
              children: [
                Expanded(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: WidgetSize(context).sizedBox8,),
                              MediaQuery.of(context).viewInsets.bottom > 0
                                     ? SizedBox()
                                      :
                              Column(
                                children: [
                                  SizedBox(
                                    width: WidgetSize(context).widthCommon,
                                    height: WidgetSize(context).width0307,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _modalButton(
                                            context: context,
                                            button: 1,
                                            borderColor: controller.stepModal1TextMax.value == AppElement.promotion1
                                                ? Style.grey999999
                                                : Style.yellow,
                                            buttonText: '할부개월',
                                            resultText:  controller.stepModal1TextMax.value,
                                            textColor: controller.stepModal1TextMax.value == AppElement.promotion1
                                                ? Style.greyWrite
                                                : Style.brown,
                                            textColor2: controller.stepModal1TextMax.value == AppElement.promotion1
                                                ? Style.grey999999
                                                : Style.karajeck),
                                        SizedBox(width: WidgetSize(context).sizedBox16,),
                                        _modalButton(
                                            context: context,
                                            button: 2,
                                            borderColor: controller.stepModal2TextSale.value == AppElement.promotion1
                                                ? Style.grey999999
                                                : Style.yellow,
                                            buttonText: '통신사 할인',
                                            resultText:  controller.stepModal2TextSale.value,
                                            textColor:  controller.stepModal2TextSale.value == AppElement.promotion1
                                                ? Style.greyWrite
                                                : Style.brown,
                                            textColor2:  controller.stepModal2TextSale.value == AppElement.promotion1
                                                ? Style.grey999999
                                                : Style.karajeck),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: WidgetSize(context).sizedBox16,
                                  ),
                                  MakeDealController.to.requestAgencyN.value == 0
                                      ? SizedBox()
                                      : SizedBox(
                                    width: WidgetSize(context).widthCommon,
                                    height: WidgetSize(context).width0307,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _modalButton(
                                              context: context,
                                              button: 3,
                                              borderColor: controller.stepModal3Text.value == AppElement.promotion2
                                                ? Style.grey999999
                                                : Style.yellow,
                                            buttonText: '결합',
                                            resultText:  MakeDealController.to.guyhap.value.list.isEmpty
                                                ? '없음'
                                                :  controller.stepModal3Text.value,
                                            textColor: controller.stepModal3Text.value == AppElement.promotion2
                                                ? Style.greyWrite
                                                : Style.brown,
                                            textColor2:   controller.stepModal3Text.value == AppElement.promotion2
                                                ? Style.grey999999
                                                : Style.karajeck,
                                        ),
                                            SizedBox(width: WidgetSize(context).sizedBox16,),
                                        _modalButton(
                                            context: context,
                                            button: 4,
                                            borderColor: controller.stepModal4Text.value == AppElement.promotion2
                                                ? Style.grey999999
                                                : Style.yellow,
                                            buttonText: '복지',
                                            resultText: controller.stepModal4Text.value,
                                            textColor: controller.stepModal4Text.value == AppElement.promotion2
                                                ? Style.greyWrite
                                                : Style.brown,
                                            textColor2: controller.stepModal4Text.value == AppElement.promotion2
                                                ? Style.grey999999
                                                : Style.karajeck)

                                                                              ],
                                                                            ),
                                      ),
                                ],
                              ),
                              _recogForm(context)
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
                SizedBox(height: WidgetSize(context).extendsGap,)
              ],
            )
    );
  }

  Widget _recogForm(context){
    return Container(
      color: Style.white,
      padding: EdgeInsets.only(
        top:
        MediaQuery.of(context).viewInsets.bottom > 0
            ? 0
            : WidgetSize(context).sizedBox24,
        ),
      width: WidgetSize(context).widthCommon,
      height: MediaQuery.of(context).viewInsets.bottom > 0
              ? WidgetSize(context).sizedBox225
              : WidgetSize(context).sizedBox0_68,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: WidgetSize(context).sizedBox4
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '기타 요청사항',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Style.blackWrite,
                      fontSize: WidgetSize(context).sizedBox18),
                ),
                RippleDecorationButton(
                    onTap: () {
                      controller.textField.clear();
                      controller.etc.value = '';
                    },
                    widget: Icon(
                      Icons.restore_from_trash,
                      size: WidgetSize(context).sizedBox26,
                      color: Colors.blue,
                    )
                ),

              ],
            ),
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox12,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
              child: TextField(
                controller: controller.textField,
                onChanged: controller.inputEtc,
                focusNode: controller.focus,
                style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox18, color: Style.blackWrite),
                keyboardType:
                TextInputType.multiline, //TextInputType.multiline,
                maxLines: 8,
                maxLength: 1000,
                cursorColor: Style.ultimateGrey,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(WidgetSize(context).sizedBox16),
                    counterText: '',
                    hintStyle: TextStyle(
                        fontSize: WidgetSize(context).sizedBox18,
                        color: Style.grey999999),
                    hintText: '상세하게 적어주세요 \n예시) 파란색 휴대폰이면 좋겠어요',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                        borderSide: BorderSide(
                            width: WidgetSize(context).sizedBox1,
                            color: Style.ultimateGrey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
                        borderSide: BorderSide(
                            width: WidgetSize(context).sizedBox1,
                            color: Style.greyCCCCCC))),
              ),
            ),
          ),
          MediaQuery.of(context).viewInsets.bottom > 0
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        controller.focus.unfocus();
                      },
                      child: Text('작성 완료',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                            fontSize: WidgetSize(context).sizedBox17
                        ),
                      ),
                    )
                  ],
                  )
              : SizedBox()
        ],
      ),
    );
  }

  Widget _modalButton({
    required BuildContext context, required int button, required Color borderColor,
    required String buttonText, required String resultText, required Color textColor, required Color textColor2
}) {
    return Expanded(
      child: RippleDecorationButton(
          onLongPress: (){
            switch(button){
              case 1:
                MakeDealController.to.stepModal1TextMax.value = AppElement.promotion1;
                break;
              case 2:
                MakeDealController.to.stepModal2TextSale.value = AppElement.promotion1;
                break;
              case 3:
                MakeDealController.to.stepModal3Text.value = AppElement.promotion2;
                break;
              case 4:
                MakeDealController.to.stepModal4Text.value = AppElement.promotion2;
                break;
            }
          },
          onTap:  () {
            button == 3 && MakeDealController.to.guyhap.value.list.isEmpty
                ? controller.commonWidgets.customSnackbar('해당 통신사는 결합 상품이 없어요.')
                : button == 4 && !MakeDealController.to.walfared()
                ? controller.commonWidgets.customSnackbar('해당 통신사는 복지 상품이 없어요.')
                :
            showModalBottomSheet(
              // isDismissible: false,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  final ScrollController _firstController = ScrollController();
                  return Container(
                    color: Style.white,
                    child: SafeArea(
                      child: Container(
                        color: Style.white,
                        constraints: BoxConstraints(
                          minHeight: WidgetSize(context).sizedBox128,
                          maxHeight: WidgetSize(context).etcH048,
                          minWidth: WidgetSize(context).widthCommon,
                        ),
                        child: Scrollbar(
                          controller: _firstController,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: _firstController,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(
                                      button == 1
                                          ? MakeDealController.to.requestAgency.value == '상관없어요' ? controller.stepModal112.length
                                          : controller.joinerPhoneMax.value == 'Y' || controller.joinerPhone.value == Body4Controller.to.checkText[1] ? controller.stepModal11.length : controller.stepModal1.length
                                          : button == 2
                                          ? controller.stepModal2.length
                                          : button == 3
                                          ? MakeDealController.to.guyhap.value.list.length
                                          : button == 4
                                          ? controller.walfare.value.list.length
                                          : 0,
                                          (index) =>
                                          RippleDecorationButton(
                                              onTap: () {
                                                if (button == 1) {
                                                  print(controller.joinerPhone.value);
                                                  MakeDealController.to.requestAgency.value == '상관없어요'
                                                      ? controller.stepModal1TextMax.value = controller.stepModal112[index]
                                                      : controller.joinerPhoneMax.value == 'Y' || controller.joinerPhone.value == Body4Controller.to.checkText[1]
                                                      ?  controller.stepModal1TextMax.value = controller.stepModal112[index]
                                                      : controller.stepModal1TextMax.value = controller.stepModal12[index];
                                                  Navigator.pop(context);
                                                }
                                                if (button == 2) {
                                                  controller.stepModal2TextSale.value = controller.stepModal22[index];
                                                  Navigator.pop(context);
                                                }
                                                if (button == 3) {
                                                  controller.stepModal3Text.value = MakeDealController.to.guyhap.value.list[index].gpProductName ?? AppElement.promotion2;
                                                  Navigator.pop(context);
                                                }
                                                if (button == 4) {
                                                  controller.stepModal4Text.value = controller.walfare.value.list[index].pwName == '해당되지 않아요'
                                                      ? AppElement.promotion2
                                                      : controller.walfare.value.list[index].pwName;
                                                  Navigator.pop(context);
                                                }
                                              },
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: WidgetSize(context).width00025,
                                                      color: Style.greyDDDDDD)
                                              ),
                                              height: WidgetSize(context).etc0156,
                                              widget: Center(
                                                  child: Text(
                                                    button == 1
                                                        ? MakeDealController.to.requestAgency.value == '상관없어요' ? controller.stepModal112[index] : controller.joinerPhoneMax.value == 'Y' ||  controller.joinerPhone.value == Body4Controller.to.checkText[1] ? controller.stepModal11[index] :controller.stepModal1[index]
                                                        : button == 2
                                                        ? controller.stepModal2[index]
                                                        : button == 3
                                                        ? MakeDealController.to.guyhap.value.list[index].gpProductName
                                                        : button == 4
                                                        ? controller.walfare.value.list[index].pwName
                                                        : '',
                                                    style: TextStyle(
                                                        color: Style.blackWrite,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: WidgetSize(context).sizedBox14
                                                    ),
                                                  )
                                              )
                                          )
                                  ).toList(),
                                  Container(
                                    height:  MediaQuery.of(context).viewInsets.bottom,
                                    color: Style.white,
                                  )
                                ]
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            );
          },
          border: Border.all(width: WidgetSize(context).sizedBox2, color: borderColor),
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox18,
                    fontWeight: FontWeight.bold,
                    color: textColor2),
              ),
              SizedBox(
                height: WidgetSize(context).sizedBox8,
              ),
              Text(
                resultText,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: WidgetSize(context).sizedBox20),
                maxLines: 2,
                textAlign: TextAlign.center,
              )
            ],
          )
      ),
    );


    //   GestureDetector(
    //   onLongPress: (){
    //     switch(button){
    //       case 1:
    //         MakeDealController.to.stepModal1TextMax.value = '';
    //         break;
    //       case 2:
    //         MakeDealController.to.stepModal2TextSale.value = '';
    //         break;
    //       case 3:
    //         MakeDealController.to.stepModal3Text.value = '';
    //         break;
    //       case 4:
    //         MakeDealController.to.stepModal4Text.value = '';
    //         break;
    //     }
    //   },
    //   onTap: () {
    //     button == 3 && MakeDealController.to.guyhap.value.list.isEmpty
    //         ? CommonWidgets().customSnackbar('해당 통신사는 결합 상품이 없어요.')
    //         : button == 4 && MakeDealController.to.walfared() == false
    //             ? CommonWidgets().customSnackbar('해당 통신사는 복지 상품이 없어요.')
    //             :
    //         showModalBottomSheet(
    //       // isDismissible: false,
    //               context: context,
    //               isScrollControlled: true,
    //               builder: (context) {
    //                 final ScrollController _firstController = ScrollController();
    //                 return Container(
    //                   color: Style.white,
    //                   child: SafeArea(
    //                     child: Container(
    //                       padding: EdgeInsets.only(
    //                           bottom: MediaQuery.of(context).viewInsets.bottom),
    //                       child: Container(
    //                         constraints: BoxConstraints(
    //                     minHeight: WidgetSize(context).sizedBox128,
    //                     maxHeight: WidgetSize(context).etcH048,
    //                     minWidth: WidgetSize(context).widthCommon,
    //                   ),
    //                   child: Scrollbar(
    //                     controller: _firstController,
    //                     thumbVisibility: true,
    //                     child: SingleChildScrollView(
    //                       controller: _firstController,
    //                       child: Column(
    //                         mainAxisSize: MainAxisSize.min,
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: List.generate(
    //                             button == 1
    //                                 ? MakeDealController.to.requestAgency.value == '상관없어요' ? controller.stepModal112.length
    //                                 : controller.joinerPhoneMax.value == 'Y' || controller.joinerPhone.value == Body4Controller.to.checkText[1] ? controller.stepModal11.length : controller.stepModal1.length
    //                                 : button == 2
    //                                 ? controller.stepModal2.length
    //                                 : button == 3
    //                                 ? MakeDealController.to.guyhap.value.list.length
    //                                 : button == 4
    //                                 ? controller.walfare.value.list.length
    //                                 : 0,
    //                                 (index) =>
    //                                     InkWell(
    //                                       onTap: () {
    //                                         if (button == 1) {
    //                                           print(controller.joinerPhone.value);
    //                                           MakeDealController.to.requestAgency.value == '상관없어요'
    //                                               ? controller.stepModal1TextMax.value = controller.stepModal112[index]
    //                                                     : controller.joinerPhoneMax.value == 'Y' || controller.joinerPhone.value == Body4Controller.to.checkText[1]
    //                                                         ?  controller.stepModal1TextMax.value = controller.stepModal112[index]
    //                                                         : controller.stepModal1TextMax.value = controller.stepModal12[index];
    //                                           Navigator.pop(context);
    //                                         }
    //                                         if (button == 2) {
    //                                           controller.stepModal2TextSale.value = controller.stepModal22[index];
    //                                           Navigator.pop(context);
    //                                         }
    //                                         if (button == 3) {
    //                                           controller.stepModal3Text.value = MakeDealController.to.guyhap.value.list[index].gpProductName ?? '';
    //                                           Navigator.pop(context);
    //                                         }
    //                                         if (button == 4) {
    //                                           controller.stepModal4Text.value = controller.walfare.value.list[index].pwName == '해당되지 않아요'
    //                                                                                 ? AppElement.promotion2
    //                                                                                 : controller.walfare.value.list[index].pwName;
    //                                           Navigator.pop(context);
    //                                         }
    //                                         },
    //                                       child: Container(
    //                                         height: WidgetSize(context).etc0156,
    //                                         decoration: BoxDecoration(
    //                                           border: Border(
    //                                               bottom: BorderSide(
    //                                                   width: WidgetSize(context).width00025,
    //                                                   color: Style.greyDDDDDD)
    //                                           ),
    //                                         ),
    //                                         child: Center(
    //                                             child: Text(
    //                                               button == 1
    //                                                   ? MakeDealController.to.requestAgency.value == '상관없어요' ? controller.stepModal112[index] : controller.joinerPhoneMax.value == 'Y' ||  controller.joinerPhone.value == Body4Controller.to.checkText[1] ? controller.stepModal11[index] :controller.stepModal1[index]
    //                                                   : button == 2
    //                                                       ? controller.stepModal2[index]
    //                                                       : button == 3
    //                                                           ? MakeDealController.to.guyhap.value.list[index].gpProductName
    //                                                           : button == 4
    //                                                               ? controller.walfare.value.list[index].pwName
    //                                                               : '',
    //                                               style: TextStyle(
    //                                                   color: Style.blackWrite,
    //                                                   fontWeight: FontWeight.w400,
    //                                                   fontSize: WidgetSize(context).sizedBox14
    //                                               ),
    //                                             )
    //                                         ),
    //                                       ),
    //                                     )
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         }
    //         );
    //     },
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox10_5),
    //     width: WidgetSize(context).sign2authE,
    //     height: WidgetSize(context).width0307,
    //     decoration: BoxDecoration(
    //         border: Border.all(width: WidgetSize(context).sizedBox2, color: borderColor),
    //         borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           buttonText,
    //           style: TextStyle(
    //               fontSize: WidgetSize(context).sizedBox18,
    //               fontWeight: FontWeight.bold,
    //               color: textColor2),
    //         ),
    //         SizedBox(
    //           height: WidgetSize(context).sizedBox8,
    //         ),
    //         Text(
    //           resultText,
    //           style: TextStyle(
    //               color: textColor,
    //               fontWeight: FontWeight.w700,
    //               fontSize: WidgetSize(context).sizedBox20),
    //           maxLines: 2,
    //           textAlign: TextAlign.center,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

}
//프로모션 조정하기 리스트 만드는중 결합해야됨. => 최대 할부개월 까지.