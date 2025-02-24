import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/models/auth_basic_api.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/post_reservation.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/reservation/dialog/reservation_alert_dialog.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/bdbot/bd_bot_nav_rapository.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const/const_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../css/size.dart';
import '../../../../../../managers/device_manager.dart';

class ReservationController extends GetxController{
  static ReservationController get to => Get.find();

  final BdBotNavRepository _bdBotNavRepository;
  final CommonWidgets commonWidgets;

  ReservationController({
    required BdBotNavRepository bdBotNavRepository,
    required this.commonWidgets
  }) : _bdBotNavRepository = bdBotNavRepository;

  RxString storeName = ''.obs;
  RxString storeStartTime = ''.obs;
  RxString storeEndTime = ''.obs;
  RxString dayPas = ''.obs;

  RxDouble deviceHeight = WidgetSize(Get.context!).height60px.obs;

  RxString reservationPeople = ''.obs;

  Rx<DateTime> reservationDay = DateTime(0).obs;
  Rx<DateTime> setTime = DateTime(0).obs;
  Rx<DateTime> reservationTime = DateTime(0).obs;

  RxBool confirm = false.obs;

  RxBool loading = false.obs;

  void setLoading(){
    loading.value = true;
    update();
  }


  void closeLoading(){
    loading.value = false;
    update();
    commonWidgets.customSnackbar('잠시 후, 다시 시도 해주세요.');
  }

  void setConfirm(bool value) {
    confirm.value = value;
    update();
  }

  void peopleUpdate(String people) {
    reservationPeople.value = people;
    update();
  }

  RxString reservationName = ''.obs;
  late TextEditingController nameController;
  void nameForm(val){
    reservationName.value = val;
    update();
    if (RegExp(r'[\uD800-\uDFFF\u2600-\u26FF\u2700-\u27BF]')
        .hasMatch(val)) {
      nameController.clear();
    }
  }

  RxString reservationPhone = ''.obs;
  late TextEditingController phoneController;
  void phoneForm(val){
    reservationPhone.value = val;
    update();
    if ((!RegExp(r"^[0-9.-]*$")
        .hasMatch(val)) && val.length > 1) {
      phoneController.clear();
    }
  }

  void setDateTime(DateTime time){
    reservationDay.value = time;
    update();
  }

  void setDateTimeTime(DateTime time){
    setTime.value = time;
    update();
  }

  void updateDateTimeTime(DateTime time){
    reservationTime.value = time;
    update();
  }

  Future<void> makeCache() async{
    DateTime reservationFullTime =
    reservationTime.value.hour == 0
        ? DateTime(reservationDay.value.year, reservationDay.value.month, reservationDay.value.day,)
        : DateTime(reservationDay.value.year, reservationDay.value.month, reservationDay.value.day, reservationTime.value.hour, reservationTime.value.minute);
    String timeString = reservationTime.value.hour <= 12 ? '오전' : '오후';

    String timeFormat = reservationTime.value.hour == 0
        ? DateFormat('yyyy년 MM월 dd일').format(reservationFullTime)
        : DateFormat('yyyy년 MM월 dd일 ${timeString} hh시 mm분').format(reservationFullTime);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final PostReservation reservation;
    reservation = PostReservation(
        rType: reservationPeople.value,
        rName: reservationName.value,
        rPhone: reservationPhone.value,
        rDay: reservationDay.value.year == 0 ? '미정' : timeFormat,
    );
    prefs.setString(InfoString.saveReservation, postReservationToJson(reservation));

  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments == null || Get.arguments == ''){
      Get.back();
    }
    else {
      storeName.value = '로딩중';
    }
    nameController = TextEditingController();
    phoneController = TextEditingController();
    deviceHeight.value = await DeviceManager.getDeviceHeight();
    AuthBagicApi3 store = await _bdBotNavRepository.getStoreDetailTime(Get.arguments);
    AuthBagicApi2 check = await _bdBotNavRepository.checkAccept(smMid: Get.arguments, mIdx: '${SrcInfoController.to.infoM.value.mIdx}');
    if(store.status != 200 || check.status != 200){
      Get.back();
    } else{
      switch(check.result.first){
        case 'Y' :
          ReservationAlertDialog().openAddressDialog();
        default :
          null;
      }
      storeName.value = store.result[0];
      storeStartTime.value = store.result[1];
      storeEndTime.value = store.result[2];
      update();
      List<String> dayList = store.result[3].split(',');
      if(dayList.where((element) => element == 'Y').length == 7){
        dayPas.value = '매일';
        update();
      }
      else if(dayList.where((element) => element == 'Y').length == 6 && dayList.last == 'N'){
        dayPas.value = '월~토';
        update();
      }
      else if(dayList.where((element) => element == 'Y').length == 5 && dayList[5] == 'N' && dayList[6] == 'N'){
        dayPas.value = '평일';
        update();
      }
      else if(dayList.where((element) => element == 'N').length == 5 && dayList[5] == 'Y' && dayList[6] == 'Y'){
        dayPas.value = '주말';
        update();
      }
      else{
        List<String> daylll = [];
        for(int i = 0; i < dayList.length; i++){
          if(dayList[i] == 'Y'){
            daylll.add(switch(i){
              0 => '월,',
              1 => '화,',
              2 => '수,',
              3 => '목,',
              4 => '금,',
              5 => '토,',
              6 => '일,',
              _ => ''
            });
          }
        }
        String joinString = daylll.join('');
        String newString = joinString.substring(0, joinString.length - 1);
        dayPas.value = newString;
        update();
      }
    }
  }

  @override
  void onClose(){
    // TODO: implement onClose
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }

}