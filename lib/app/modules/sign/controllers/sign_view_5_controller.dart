import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/common_widgets.dart';
import '../../../components/future_loading_overlay.dart';
import '../../../models/auth_basic_api.dart';
import '../../../repository/sign/sign_5_repository.dart';
import '../../../routes/app_pages.dart';
import '../views/pages/sign5/sign_view_5.dart';



class SignView5Controller extends GetxController {
  static SignView5Controller get to => Get.find();

  final Repo5 _repo5 = const RegisterManager().getRepo5();

  final CommonWidgets _commonWidgets;


  SignView5Controller({

    required CommonWidgets commonWidgets,

  }) :
        _commonWidgets = commonWidgets;

  RxString thumbnail = ''.obs;
  RxString nickname = ''.obs;

  RxString addr = ''.obs;
  RxString dong = ''.obs;
  RxString latitude = ''.obs;
  RxString longtitude = ''.obs;



  void otherPageProfileUpdate({
    required String name, required String image
}) {
    nickname.value = name;
    thumbnail.value = image;
    update();
  }


  void otherPageAdressUpdate({
    required String addrs,
    required String dongs,
    required String latitudes,
    required String longtitudes,
  }){
    addr.value = addrs;
    dong.value = dongs;
    latitude.value = latitudes;
    longtitude.value = longtitudes;
    update();
  }

  void nextPage(){
    if(nickname.value != '' && addr.value != '' && dong.value != '' && latitude.value != '' && longtitude.value != ''){
      Get.to(() => const SignView5());
    } else {
      _commonWidgets.customSnackbar('누락된 입력정보가 있습니다.');
    }
  }

  Rx<AuthBagicApi> message = AuthBagicApi(status: 0, msg: '', result: []).obs;


  Future<AuthBagicApi> getMessage() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? mIdx = prefs.getInt('m_idx');
    AuthBagicApi data = await showFutureLoadingOverlay<dynamic>(
      context: Get.context!,
      future: _repo5.uploadImage(
          image: thumbnail.value,
          mIdx: '${mIdx!}', nick: nickname.value, add: addr.value, dong: dong.value, latitude: latitude.value, longitude: longtitude.value),
      expanded: true,
    );
    message.value = data;
    update();
    if(data.status == 200)
      {
        Get.offAllNamed(Routes.SRC);
      }
    else{
      _commonWidgets.customSnackbar('등록에 실패하였습니다. 잠시후 다시 시도해주세요.');
    }

    return data;
}



}
