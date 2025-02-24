import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite_deal_view.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/main/loading/loading_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_spec_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/service/service_moduels/controllers/chat_log_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/bdbot/bd_bot_nav_rapository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/deal/phone_spec_repository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/common_widgets.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/auth_basic_api.dart';
import '../../../../../../../../../models/deal/get_guyhap.dart';
import '../../../../../../../../../models/deal/model_name.dart';
import '../../../../../../../../../models/deal/walfare_list.dart';
import '../../../../../../../../../repository/deal/rate_plan_repository.dart';
import '../../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_chat_controller.dart';
import '../../../../../../../src_components/controllers/src_deal_controller.dart';
import '../../../../../../../src_components/controllers/src_info_controller.dart';
import '../../../../../controllers/search_phone_controllers/search_phone_telecom_controller.dart';
import '../../../../../controllers/search_rateplan_controllers/search_rateplan_controller.dart';
import '../../../../../views/pages/search_phone/search_phone.dart';
import '../../../../../views/pages/search_rateplan/search_rateplan.dart';
import '../../../../../../../../../repository/deal/make_deal_repository.dart';
import '../../make_deal_body/body3/body3_controller.dart';
import '../../make_deal_body/body4/body4_controller.dart';
import '../../make_deal_body/body5/body5_controller.dart';
import '../../make_deal_body/body6/body6_controller.dart';
import '../../make_deal_body/body7/body7_controller.dart';
import '../widgets/modal_action.dart';


class MakeDealController extends GetxController {
  static MakeDealController get to => Get.find();

  final BdBotNavRepository _bdBotNavRepository;
  final PhoneSpecRepository _phoneSpecRepository;
  final MakeDealRepository _makeDealRepository;
  final RatePlanRepository _ratePlanRepository;
  final CommonWidgets commonWidgets;


  MakeDealController({
    required BdBotNavRepository bdBotNavRepository,
    required PhoneSpecRepository phoneSpecRepository,
    required MakeDealRepository makeDealRepository,
    required RatePlanRepository ratePlanRepository,
    required this.commonWidgets,
  }) :  _bdBotNavRepository = bdBotNavRepository,
        _phoneSpecRepository = phoneSpecRepository,
        _makeDealRepository = makeDealRepository,
        _ratePlanRepository = ratePlanRepository;


  late FocusNode focus;
  late TextEditingController textField;

  RxString etc = ''.obs;



  void quitDeal(BuildContext context){
    commonWidgets.customDialog(
        routerContext: context,
        barrierDismissible: false, mainText: '딜 등록을 그만두시겠어요?\n진행사항은 저장되지 않아요.',
        cancleText: '취소', confirmText: '그만하기', conFirmOnTap: (){
      if(Get.isSnackbarOpen){
        Get.back();
      } else{
        Get.back();
        Get.back();
       }
      },
    );
  }

  void oneButtonClick(int page){
    if(page == 1)
    {
      joinerAge.value == '' ? null : currentStep.value++;
    }
    else{
      currentStep.value--;
    }
  }

  void emojiExpert(String input){

    String result = DeviceManager.emojiConvert(input);
    etc.value = result;
    textField.value = TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }

  void inputEtc(val) {
    etc.value = val;
  }

  RxList joinerPhoneRecList = [].obs;

  List selectAge(){
    switch(joinerAge.value)
    {
      case '성인':
        return ['','최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰', '어르신들을 위한 효도폰'];
      case '어르신':
        return ['','최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰', '어르신들을 위한 효도폰'];
      case '청소년':
        return ['','최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰', '학생을 위한 공부폰', '어린 아이들을 위한 어린이폰'];
      case '어린이':
        return ['','최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰', '학생을 위한 공부폰', '어린 아이들을 위한 어린이폰'];
      case '현역군인':
        return ['','최고의 스펙을 가진 프리미엄폰', '실속있는 가격의 보급폰'];
      default:
        return [];
    }
  }

  String recPhoneString(){
    if(joinerPhoneRec.value == '최고의 스펙을 가진 프리미엄폰')
    {
      return '프리미엄폰';
    }
    if(joinerPhoneRec.value == '실속있는 가격의 보급폰')
    {
      return '보급폰';
    }
    if(joinerPhoneRec.value == '어르신들을 위한 효도폰')
    {
      return '효도폰';
    }
    if(joinerPhoneRec.value == '학생을 위한 공부폰')
    {
      return '공부폰';
    }
    if(joinerPhoneRec.value == '어린 아이들을 위한 어린이폰')
    {
      return '어린이폰';
    }
    else{
      return 'x';
    }
  }

  String recRateString(){
    if(joinerRateRec.value == joinerRateRecList[1])
    {
      return '8만원 이상';
    }
    if(joinerRateRec.value == joinerRateRecList[2])
    {
      return '7만원대';
    }
    if(joinerRateRec.value == joinerRateRecList[3])
    {
      return '5~6만원';
    }
    if(joinerRateRec.value == joinerRateRecList[4])
    {
      return '5만원 미만';
    }
    else{
      return 'x';
    }
  }



  RxString stepModal1TextMax = AppElement.promotion1.obs;
  List stepModal1 = ['36개월', '24개월', '12개월', '현금구매', AppElement.promotion1];
  List stepModal12 = ['36개월', '24개월', '12개월', '현금구매', AppElement.promotion1];
  List stepModal11 = ['48개월', '36개월', '24개월', '12개월', '현금구매', AppElement.promotion1];
  List stepModal112 = ['48개월', '36개월', '24개월', '12개월', '현금구매',  AppElement.promotion1];
  RxString stepModal2TextSale = AppElement.promotion1.obs;
  List stepModal2 = ['공시지원 (단말기지원금)', '선택약정 (요금할인)', AppElement.promotion1];
  List stepModal22 = ['공시지원', '선택약정', AppElement.promotion1];
  RxString stepModal3Text = AppElement.promotion2.obs;
  List stepModal3 = ['온가족플랜', '온가족할인', '한가족할인', 'TV플러스', AppElement.promotion2];
  RxString stepModal4Text = AppElement.promotion2.obs;

  void initPromotion(){
    stepModal1TextMax.value = AppElement.promotion1;
    stepModal2TextSale.value = AppElement.promotion1;
    stepModal3Text.value = AppElement.promotion2;
    stepModal4Text.value = AppElement.promotion2;
    etc.value = '';
    textField.clear();
  }


  RxString joinCategory = ''.obs;

  //단말기
  RxString joinerPhone = ''.obs;
  RxString joinerPhoneModel = ''.obs;
  RxString joinerPhoneIdx = ''.obs;
  RxString joinerPhoneImg = ''.obs;
  RxString joinerPhoneMax = ''.obs;

  //통신사 cu => req
  RxString agencyCategory = ''.obs;

  //현재통신사
  RxString sellectAgency = ''.obs;
  RxString currentAgency = ''.obs;
  //변경통신사
  RxString requestAgency =  ''.obs;
  //나이
  RxString joinerAge = ''.obs;
  //요금제
  RxString joinerRateplan =  ''.obs;
  RxString joinerRateplanIdx = ''.obs;
  //최대 할부개월
  RxString maxInstallment = ''.obs;
  //통신사 할인
  RxString telSale = ''.obs;

  RxString agnecySale = ''.obs;
  RxString agencyCombination = ''.obs;
  RxString joinerWelfar = ''.obs;

  //단말기 추천 유형
  RxString joinerPhoneRec = ''.obs;


  //요금제 선택 유형
  RxString joinerRateRec = ''.obs;
  RxInt recRateCheck = 0.obs;


  List agency = ['SK','KT','LG','7모바일', 'M모바일', 'U모바일', 'Hello모바일 (KT망)', 'Hello모바일 (LG망)', '기타'];
  List agencyNum = [1,2,3,4,5,6,8,12,14];
  RxInt agencyN = 0.obs;
  RxInt currentAgencyN = 0.obs;
  RxInt requestAgencyN = 0.obs;


  List stepTopCenterTitle =
  ['', '개통하시는 분의 연령대는요?', '현재 이용하고 있는 통신사는요?', '개통을 원하는 통신사가 있나요?', '구매하고 싶은 단말기가 있나요?', '추천 받을 단말기를 선택해주세요.', '이용하고 싶은 요금제가 있나요?', '추천 받을 요금제를 선택해주세요.', '추가로 요청하실 내용이 있나요?', '아래 내용으로 딜을 만들게요.',];

  List check1Text =
  ['','', '없어요', '상관없어요', '단말기를 추천해주세요', '','요금제를 추천해주세요','',''];

  List check11Text =
  ['','', '', '', '(효도폰, 학생폰 등)', '','아무거나 상관없어요','',''];

  List check2Text =
  ['','', '현재 이용하고 있는 통신사가 있어요', '원하는 통신사가 있어요', '단말기를 직접 선택할래요', '','요금제를 직접 선택할래요','',''];

  List listButtonText =
  ['','', '통신사 선택하기', '통신사 선택하기', '단말기 선택하기', '','요금제 선택하기','',''];

  List joinerRateRecList =
  [
    '','8만원 이상의 사용량 무제한 요금제', '7만원대의 사용량이 많은 요금제', '5~6만원 대의 기본 요금제', '5만원 미만의 저렴한 요금제'
  ];

  RxInt currentStep = 1.obs;


  onTapTwoBack() {
    switch(currentStep.value){
      case 2:
      case 3:
      case 4:
      case 5:
        return currentStep.value--;
      case 6:
        if(joinerPhone.value != check1Text[4])
        {
          return currentStep.value = 4;
        }
        else{
          return currentStep.value--;
        }
      case 7:
        if(requestAgency.value == check1Text[3])
        {
          return currentStep.value = 4;
        }
        else{
          return currentStep.value--;
        }
      case 8:
        if(joinerRateplan.value != check1Text[6] )
        {
            if(requestAgency.value == check1Text[3]){
              return currentStep.value--;
            }else{
              return currentStep.value = 6;
            }
        }
        else{
          return currentStep.value--;
        }
      case 9:
      case 10:
        return currentStep.value--;
    }
  }

  twoButtonOntapNext() async{
    switch(currentStep.value){
      case 2:
        return currentAgency.value != '' && currentAgency.value != '1' ? currentStep.value++ : null;
      case 3:
        return requestAgency.value != '' && requestAgency.value != '1' ? currentStep.value++ : null;
      case 4:
        if(joinerPhone.value == '' || joinerPhone.value == '1')
        {
          return null;
        }
        else{
          if(joinerPhone.value != check1Text[currentStep.value])
          {

            joinerPhoneRec.value = '';
            if(requestAgency.value == check1Text[3])
            {
              return currentStep.value = 7;
            }
            else{
              return currentStep.value = 6;
            }
          }
          else{
            return currentStep.value++;
          }
        }
      case 5:
        if(joinerPhoneRec.value == '')
        {
          return null;
        }
        else{
          if(requestAgency.value == check1Text[3])
          {
            return currentStep.value = 7;
          }
          else{
            return currentStep.value++;
          }
        }
      case 6:
        if(joinerRateplan.value == '' || joinerRateplan.value == '1')
        {
          return null;
        }
        else{
          if(joinerRateplan.value != check1Text[currentStep.value])
          {
            joinerRateRec.value = '';
            recRateCheck.value = 0;
            return currentStep.value = 8;
          }
          else{
            return currentStep.value++;
          }
        }
      case 7:
        if(joinerRateRec.value == '' || joinerRateRec.value == '1')
        {
          return null;
        }
        else{
          return currentStep.value++;
        }
      case 8:
        createList();
        return currentStep.value++;
      case 9:
        return currentStep.value++;
      case 10:
        await postNewDeal();
        return 10;
    }
  }

  bool walfared(){
    return requestAgencyN.value == 1 || requestAgencyN.value == 2 || requestAgencyN.value == 3;
  }

  void createList(){
    emojiExpert(etc.value);
    currentAgency.value == check1Text[2]
        ? joinCategory.value = '신규가입'
        :  requestAgency.value == check1Text[3]  ? joinCategory.value = '통신사이동,기기변경' :
        currentAgency.value == requestAgency.value ? joinCategory.value = '기기변경'
        : joinCategory.value = '통신사이동';
      currentAgency.value == check1Text[2] && requestAgency.value == check1Text[3]
        ? agencyCategory.value = '신규'
        : currentAgency.value == check1Text[2] && requestAgency.value != check1Text[3]
        ? agencyCategory.value = '신규(${requestAgency.value})' :
    agencyCategory.value = '${currentAgency.value} -> ${requestAgency.value}';
    stepModal1TextMax.value == AppElement.promotion1
        ? maxInstallment.value = ''
        : stepModal1TextMax.value;
    stepModal2TextSale.value == AppElement.promotion1
        ? telSale.value = ''
        : telSaleCase();
  }
 // ['공시지원금 (단말기지원금)', '선택약정 (요금할인)', '어느 것이든 상관없어요.'];
  String telSaleCase(){
    switch(stepModal2TextSale.value){
      case '공시지원':
        return telSale.value = 'GONGSI';
      case '선택약정':
        return telSale.value = 'CHOICE';
      default:
        return telSale.value = '';
    }
  }

  void initBody2Controller(String checkText){
    currentAgency.value = checkText;
    currentAgencyN.value = 0;
  }

  void initBody3Controller(String checkText){
    requestAgency.value = checkText;
    requestAgencyN.value = 0;
  }

  Color twoButtonColor(){
    switch(currentStep.value){
      case 1:
        return joinerAge.value == '' ? Style.greyButtonDisable : Style.yellow;
      case 2:
        return currentAgency.value == '' || currentAgency.value == '1' ? Style.greyButtonDisable : Style.yellow;
      case 3:
        return requestAgency.value == '' || requestAgency.value == '1' ? Style.greyButtonDisable : Style.yellow;
      case 4:
        return joinerPhone.value == '' || joinerPhone.value == '1' ? Style.greyButtonDisable : Style.yellow;
      case 5:
        return joinerPhoneRec.value == '' ? Style.greyButtonDisable : Style.yellow;
      case 6:
        return joinerRateplan.value == '' || joinerRateplan.value == '1' ? Style.greyButtonDisable : Style.yellow;
      case 7:
        return joinerRateRec.value == '' ? Style.greyButtonDisable : Style.yellow;
      default:
        return Style.yellow;
    }
  }

  Rx<GuyhapData> guyhap = GuyhapData(result: '', list: []).obs;



  Future<void> getGuyhap({
    required BuildContext context,
    required int tkIdx
  }) async{
    GuyhapData data = await _ratePlanRepository.getGuyhapList(tkIdx);
   try{
     if(data.result == '101')
     {
       commonWidgets.customDialog(
         routerContext: context,
           mainText: '일시적인 오류로 서비스에 접속할 수 없어요.',
         confirmText: '확인',
         conFirmOnTap: Get.back,
         isOne: true
       );
       guyhap.value = GuyhapData(result: '', list: []);
       Body3Controller.to.check.value = 2;
       requestAgency.value = '';
       Navigator.pop(context);

     }
     else{
       if(data.result == 'N'){
         noGuyhap(context);
       } else{
         guyhap.value.list.clear();
         guyhap.value.result = data.result;
         guyhap.value.list.addAll(data.list.where((element) =>  element.gpIsMobile == 'Y'));
         stepModal3Text.value = AppElement.promotion2;
         guyhap.value.list.add(GuyhapDataList(gpIdx: '', tkIdxMobile: '', tkIdxCable: '', listPcIdx: '', gpOrder: '', gpProductName: AppElement.promotion2, gpListName: '', gpContent: '', gpExplain: '', gpGyeolhabIcon: '', gpIsMobile: '', gpIsCable: '', gpIsImpossibleNewGyeolhab: '', gpDiscountValue: '', gpDiscountType: '', gpRegiDate: '', gpEditDate: '', gpPromoIdx: '', gpPromoTitle: '', gpPromoPrice: ''));
         guyhap.value.list.toSet();
         Navigator.pop(context);
       }

     }
   }catch(_){
     commonWidgets.customSnackbar('일시적인 오류로 서비스에 접속할 수 없어요.');
     guyhap.value = GuyhapData(result: '', list: []);
     Body3Controller.to.check.value = 2;
     requestAgency.value = '';
     Navigator.pop(context);
   }
  }
  
  noGuyhap(context){
    stepModal3Text.value = AppElement.promotion2;
    guyhap.value = GuyhapData(result: '', list: []);
    Navigator.pop(context);
  }

  // Future<void> caseJoinerPhoneIdxUse({required int index, required BuildContext context}) async{
  //   ModelName model = await _ratePlanRepository.getPhoneModelName(tkIdx: MakeDealController.to.requestAgencyN,ps_idx: MakeDealController.to.joinerPhoneIdx);
  //   MakeDealController.to.joinerPhoneModel.value = model.list.first.mdModel;
  //   var data = await _ratePlanRepository.getRatePlanMobile(tkIdx: MakeDealController.to.requestAgencyN, mdModel: model.list.first.mdModel);
  //   if(data.list!.isNotEmpty) {
  //     await getGuyhap(context, agencyNum[index]);
  //     // index == 0 || index == 1 || index == 2 || index == 6
  //     //     ? getGuyhap(context, agencyNum[index]) : noGuyhap(context);
  //   }
  //   else{
  //     requestAgency.value = '';
  //     agencyN.value = 0;
  //     requestAgencyN.value = 0;
  //     CommonWidgets().customDialogButton1(onTap: (){Get.back();}, mainText: '죄송해요! 해당 모델은 선택할 수 없는 통신사입니다.', buttonText: '다른 통신사 선택하기');
  //   }
  // }

  Future<void> initNextStep({required int index, required BuildContext context}) async{
    Body6Controller.to.initBody6();
    Body7Controller.to.initBody7();

    if(MakeDealController.to.joinerPhone.value != MakeDealController.to.check1Text[4])
    {
      if(MakeDealController.to.checkString.value != '')
      {
        Body5Controller.to.initBody5();
        Body4Controller.to.check.value = 2;
        MakeDealController.to.joinerPhoneMax.value = '';

        try{
          ModelName model = await _ratePlanRepository.getPhoneModelName(tkIdx: agencyNum[index],ps_idx: MakeDealController.to.joinerPhoneIdx);
          var data = await _ratePlanRepository.getRatePlanMobile(tkIdx: MakeDealController.to.requestAgencyN, mdModel: model.list.first.mdModel);
          if(data.rateList!.isNotEmpty){
            MakeDealController.to.joinerPhoneMax.value = model.list.first.mdIsHalbuMonth48;
            await getGuyhap(context: context, tkIdx: agencyNum[index]);
          } else{
            Body3Controller.to.check.value = 0;
            requestAgency.value = '';
            agencyN.value = 0;
            requestAgencyN.value = 0;
            MakeDealController.to.joinerPhoneMax.value = '';
            commonWidgets.customDialog(
                routerContext: context,
                mainText: '죄송해요! 해당 단말기 모델은 선택할 수 없는 통신사입니다.',
                confirmText: '다른 통신사 선택하기',
                conFirmOnTap: Get.back,
                isOne: true
            );

          }
        } catch(e){
          Body3Controller.to.check.value = 0;
          requestAgency.value = '';
          agencyN.value = 0;
          requestAgencyN.value = 0;
          MakeDealController.to.joinerPhoneMax.value = '';
          commonWidgets.customDialog(
              routerContext: context,
              mainText: '죄송해요! 해당 단말기 모델은 선택할 수 없는 통신사입니다.',
              confirmText: '다른 통신사 선택하기',
              conFirmOnTap: Get.back,
              isOne: true
          );
        }
      }
      else{
        Body4Controller.to.initBody4();
        Body5Controller.to.initBody5();
        argumentInit();
        MakeDealController.to.joinerPhoneMax.value = '';
        commonWidgets.customSnackbar('조건이 초기화 되었어요.');
        await getGuyhap(context: context, tkIdx: agencyNum[index]);
      }
    }





  }

  Future<void> modalOnTap(BuildContext context) async{
    await ModalAction().modalOnTap(context);
  }


  void searchPhone1() async{
    await DeviceManager.overLayClients();
    Get.to(
            () => SearchPhone(
          routeCase: 0,
          agency: '신규',
          agencyNum: 0,
        ), binding: BindingsBuilder(() {
      Get.put(SearchPhoneSpecController(
          phoneSpecRepository: _phoneSpecRepository
      ));
    }));
  }

  void searchPhone2() async{
    await DeviceManager.overLayClients();
    Get.to(
            () => SearchPhone(
          routeCase: 1,
          agency: requestAgency.value,
          agencyNum: agencyN.value,
        ), binding: BindingsBuilder(() {
      Get.put(SearchPhoneTelecomController(phoneSpecRepository: _phoneSpecRepository, commonWidgets: commonWidgets));
    }));
  }

  void  searchPhone(){
      if(joinerPhone.value != check1Text[currentStep.value] && joinerPhone.value != '')
      {
        requestAgency.value == '상관없어요'
            ? searchPhone1()
            : searchPhone2();
      }
  }



  void searchRate2() async{
  await DeviceManager.overLayClients();
    Get.to(
            () => SearchRateplan(
          agencyNum: agencyN.value,
        ), arguments: '${agencyN.value}',binding: BindingsBuilder(() {
      Get.put(SearchRateplanController(
          ratePlanRepository: _ratePlanRepository
      ));
    }));
  }

  void searchRate(){
    if(joinerRateplan.value != check1Text[currentStep.value] && joinerRateplan.value != '')
    {
      requestAgency.value == '상관없어요'
          ? null
          : searchRate2();
    }
  }

  RxString checkString = ''.obs;

  RxString storeid = ''.obs;

  void argumentInit(){
    joinerPhoneIdx.value = '';
    joinerPhoneImg.value = '';
    joinerPhoneModel.value = '';
  }

  void clickRatePlanConfirm({
    required String ratePlan,
    required String ratePlanIdx
  }){
    joinerRateplan.value = ratePlan;
    joinerRateplanIdx.value = ratePlanIdx;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    focus = FocusNode();
    textField = TextEditingController();
    getWalfare();
    checkString.value = Get.arguments['phoneName'] ;
    joinerPhone.value = Get.arguments['phoneName'] ;
    joinerPhoneModel.value = Get.arguments['phoneModel'] ;
    joinerPhoneIdx.value = Get.arguments['phoneIdx'];
    joinerPhoneImg.value = Get.arguments['phoneImg'];
    storeid.value = Get.arguments['invite'];
  }

  Rx<WalfareList> walfare = WalfareList(result: '', list: <WalFare>[]).obs;
  RxList<WalFare> walList = <WalFare>[].obs;

  Future<WalfareList> getWalfare() async{
    var list = await _ratePlanRepository.getWalfareList();
    list.list.add(WalFare(pwIdx: '', pwName: AppElement.promotion2, pwDiscountText: '', pwWelfareText: '', pwOrder: '', pwRegidate: DateTime(0)));
    return walfare.value = list;
  }

  RxBool next = false.obs;

  Rx<AuthBagicApi> result = AuthBagicApi(status: 0, msg: '', result: []).obs;

  Rx<bool> waitPost = false.obs;

  void gotoInvite({
    required bool? isChat,
    required String storeId,
    required int diIdx
  }){
    Get.back();
    Get.to(
            () => InviteDealView(
              isClose: false,
            ), binding:
    BindingsBuilder(() {
      Get.put(InviteDealController(
          bdBotNavRepository: _bdBotNavRepository,
          commonWidgets: commonWidgets,
          makeDealRepository: _makeDealRepository,
        isChat: isChat, storeId: storeId, diIdx: diIdx,

      ));
    })
    );
  }

    Future<void> postNewDeal() async{
      if (kDebugMode) {
        print('hellow');
      }
      if(Get.isSnackbarOpen){
        Get.back();
      } else{
        waitPost.value = true;
        //TODO: 여기 확인해보기
        AuthBagicApi deal = await LoadingController.to.apiLoadings(
           future:  _makeDealRepository.postNewDeal(
               userIdx: SrcInfoController.to.infoM.value.mIdx, //유저 아이디 x
               joinType: joinCategory.value,
               currentAgency: currentAgencyN.value == 0 ? '' : currentAgencyN.value,
               requestAgency: requestAgencyN.value == 0 ? '' : requestAgencyN.value,
               joinerPhone: joinerPhone.value == check1Text[4] || joinerPhone.value == '' ? recPhoneString()  : joinerPhone.value,
               joinerPhoneModel: joinerPhone.value == check1Text[4] || joinerPhone.value == ''? '' :joinerPhoneModel.value,
               joinerPhoneIdx: joinerPhoneIdx.value,
               joinerRatePlan: joinerRateplan.value == check1Text[6] || joinerRateplan.value == '' ? recRateString() : joinerRateplan.value,
               joinerRatePlanIdx: joinerRateplan.value == check1Text[6] || joinerRateplan.value == '' ? '' :joinerRateplanIdx.value,
               ageType: joinerAge.value,
               maxInstallment: stepModal1TextMax.value == AppElement.promotion1 || stepModal1TextMax.value == ''  ? -1  : stepModal1TextMax.value,
               guyHap: stepModal3Text.value == AppElement.promotion2 ? '' : stepModal3Text.value,
               welfare: stepModal4Text.value  == AppElement.promotion2 ? '' : stepModal4Text.value,
               sup: telSale.value,
               etc: etc.value,
           ),
          text: Style.postDealMent
        );

        if(deal.status == 200 && deal.result.isNotEmpty) {
          await SrcDealController.to.getDealDataPage(SrcInfoController.to.infoM.value.mIdx);
          result.value = deal;
          if(storeid.value != '')
          {
              try{
               if(ChatLogController.to.initialized){
                 await BdBotNavChatController.to.notiUpdate();
                 gotoInvite(
                   isChat: true,
                   storeId: storeid.value,
                   diIdx: deal.result[0],
                 );
               }
              } catch(_){
                await BdBotNavChatController.to.notiUpdate();
                gotoInvite(
                  isChat: null,
                  storeId: storeid.value,
                  diIdx: deal.result[0],
                );
              }
          }
          else{
            gotoInvite(
              isChat: null,
              storeId: '',
              diIdx: deal.result[0],
            );
          }
        } else {
          if(deal.status < 500){
            commonWidgets.customSnackbar('이미 딜이 존재합니다');
          }
          else{
            commonWidgets.customSnackbar('잠시 후, 다시 시도해주세요.');
          }
        }
      }
  }

  void _controllerClose(){
      focus.dispose();
      textField.dispose();
  }




   @override
  void onClose() {
    // TODO: implement onClose
     _controllerClose();
    super.onClose();
  }

}