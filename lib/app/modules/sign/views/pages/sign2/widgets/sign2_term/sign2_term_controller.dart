import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign2/widgets/sign2_term/sign2_term_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../components/widget_components/ripple_button/ripple_search_icon_button.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../managers/device_manager.dart';
import '../../../../../../../models/etc/terms.dart';
import '../../../../../../../repository/etc/etc_etc_repository.dart';

class Sign2TermController extends GetxController {

  final EtcEtcRepository _etcEtcRepository;
  final CommonWidgets _commonWidgets;

  Sign2TermController({
    required EtcEtcRepository etcEtcRepository,
    required CommonWidgets commonWidgets,
  }) : _etcEtcRepository = etcEtcRepository,
       _commonWidgets = commonWidgets ;

  late final ScrollController scrollController1;
  late final ScrollController scrollController2;
  late final ScrollController scrollController3;

  Rx<Terms> signTerms = Terms(status: 0, msg: '', result: []).obs;
  RxDouble deviceHeight = WidgetSize(Get.context!).height60px.obs;

  RxBool allCheck = false.obs;
  RxBool service = false.obs;
  RxBool terms = false.obs;
  RxBool location = false.obs;


  Future<Terms> getTermsSign() async{
    Terms api = await _etcEtcRepository.getTerms();

    if(api.status == 200)
    {
      return signTerms.value = api;
    }
    else{
      closeTerms();
      if(api.status < 500){
        _commonWidgets.customSnackbar('잠시 후 다시 시도해주세요.');
      }
      return signTerms.value = Terms(status: 0, msg: '', result: []);
    }
  }

  void closeTerms(){
    SignView2Controller.to.currentTap.value = 0;
    SignView2Controller.to.changeTap1();
    Get.back();
  }

  bool checkValue(int index) {
    switch(index){
      case 0:
        return allCheck.value;
      case 1:
        return service.value;
      case 2:
        return terms.value;
      case 3:
        return location.value;
      default:
        return false;
    }
  }

  void clickCheck(BuildContext context, int index){
    switch(index){
      case 0:
        clickAllCheck(context, index);
      case 1:
        clickService(context, index);
      case 2:
        clickTerms(context, index);
      case 3:
        clickLocation(context, index);
      default:
        null;
    }
  }


  void clickAllCheck(BuildContext context, int index) {
    allCheck.value =! allCheck.value;
    if(allCheck.value){
      clickDialog(routerContext: context, index: index);
    }
    switch(allCheck.value){
      case true:
        service.value = true;
        terms.value = true;
        location.value = true;
      case false:
        service.value = false;
        terms.value = false;
        location.value = false;
    }
  }

  void clickService(BuildContext context, int index){
    service.value =! service.value;
    if(service.value){
      clickDialog(routerContext: context, index: index);
    }
    if(service.value && terms.value && location.value){
      allCheck.value = true;
    } else {
      allCheck.value = false;
    }
  }

  void clickTerms(BuildContext context, int index){
    terms.value =! terms.value;
    if(terms.value){
      clickDialog(routerContext: context, index: index);
    }
    if(service.value && terms.value && location.value){
      allCheck.value = true;
    } else {
      allCheck.value = false;
    }
  }

  void clickLocation(BuildContext context, int index){
    location.value =! location.value;
    if(location.value){
      clickDialog(routerContext: context, index: index);
    }
    if(service.value && terms.value && location.value ){
      allCheck.value = true;
    } else {
      allCheck.value = false;
    }
  }

  void clickDialog({
    required BuildContext routerContext,
    required int index,
  }){
    Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: true,
            builder: (BuildContext context) =>
                PopScope(
                  canPop: false,
                  child: Dialog(
                    backgroundColor: Style.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox12))
                    ),
                    child: SizedBox(
                      width: WidgetSize(context).widthCommon,
                      height: WidgetSize(context).heightCommon,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: WidgetSize(context).sizedBox12,
                                left:WidgetSize(context).sizedBox12,
                                right:WidgetSize(context).sizedBox3,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    switch(index){
                                      0 => '전체 이용약관',
                                      1 => '서비스 이용약관',
                                      2 => '개인정보 취급동의',
                                      3 => '위치기반 서비스 이용동의',
                                      _ => ''
                                    },
                                    style:TextStyle(
                                        fontSize: WidgetSize(context).sizedBox21,
                                        fontWeight: FontWeight.w700,
                                        color: Style.blackWrite
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: index == 0
                                  ? Sign2TermDialog(
                                text1: signTerms.value.result.first.tService,
                                text2: signTerms.value.result.first.tPrivacy,
                                text3: signTerms.value.result.first.tLocation,
                                sController1: scrollController1,
                                sController2: scrollController2,
                                sController3: scrollController3,
                              )
                                  :
                              Container(
                                padding: EdgeInsets.only(
                                  top: WidgetSize(context).sizedBox8,
                                  bottom: WidgetSize(context).sizedBox8,
                                ),
                                margin: EdgeInsets.only(
                                    top: WidgetSize(context).sizedBox12,
                                    bottom: WidgetSize(context).sizedBox12,
                                    right: WidgetSize(context).sizedBox12,
                                    left: WidgetSize(context).sizedBox12
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox5),
                                    border: Border.all(
                                        width: WidgetSize(context).sizedBox1_5,
                                        color: Style.greyDDDDDD
                                    )
                                ),
                                child: Scrollbar(
                                  thumbVisibility: true,
                                  child: ListView(
                                    padding: EdgeInsets.only(
                                      right: WidgetSize(context).sizedBox10,
                                      left: WidgetSize(context).sizedBox8,
                                    ),
                                    physics: const ClampingScrollPhysics(),
                                    children: [
                                      Sign2TermDialogC(
                                        text: switch(index){
                                          1 => signTerms.value.result.first.tService,
                                          2 => signTerms.value.result.first.tPrivacy,
                                          3 => signTerms.value.result.first.tLocation,
                                          _ => ''
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              )
                          ),
                          RippleDecorationButton(
                              height: WidgetSize(context).sizedBox52,
                              width: WidgetSize(context).sizedBox52*2.5,
                              onTap: (){
                                switch(index){
                                  case 0:
                                    Get.back();
                                    Get.back();
                                  default:
                                    Get.back();
                                }

                              },
                              borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox16),
                              color: Style.yellow,
                              widget: Center(
                                child: Text( switch(index){
                                  0 => '전체동의',
                                  _ => '동의'
                                },
                                  style: TextStyle(
                                    fontSize: WidgetSize(context).sizedBox17,
                                    fontWeight: FontWeight.w600,
                                    color: Style.brown,

                                  ),
                                ),
                              )
                          ),
                          SizedBox(
                            height: WidgetSize(context).sizedBox12,
                          )
                        ],
                      ),
                    ),
                  ),
                )
        );
      }
    });
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    deviceHeight.value = await DeviceManager.getDeviceHeight();
    scrollController1 = ScrollController();
    scrollController2 = ScrollController();
    scrollController3 = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController1.dispose();
    scrollController2.dispose();
    scrollController3.dispose();
  }

}