import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/device_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../models/rank/rank_list.dart';
import '../../../../repository/src/src_rank_repository.dart';
import '../../pages/widgets/rank_phone_page/rank_phone_controller.dart';
import '../../pages/widgets/rank_phone_page/rank_phone_view.dart';

class SrcRankController extends GetxController {
  static SrcRankController get to => Get.find();

  final SrcRankRepository _srcRankRepository;
  final CommonWidgets _commonWidgets;

  SrcRankController({
    required SrcRankRepository srcRankRepository,
    required CommonWidgets commonWidgets,
  }) : _srcRankRepository = srcRankRepository,
       _commonWidgets = commonWidgets;


  late ScrollController homeController;
  late ScrollController scrollController;

  Rx<RankList> totalList = RankList(status: 0, msg: '', result: <Rankinfo>[]).obs;
  RxList<Rankinfo> totalInfo = <Rankinfo>[].obs;


  RxList<Rankinfo> premiumInfo = <Rankinfo>[].obs;


  RxList<Rankinfo> highInfo = <Rankinfo>[].obs;


  RxList<Rankinfo> normalInfo = <Rankinfo>[].obs;


  RxList<Rankinfo> worthyInfo = <Rankinfo>[].obs;

  Future<RankList> getRank() async {
    RankList total = await _srcRankRepository.getRankInfo();
    if(total.status == 200)
    {
      if (kDebugMode) {
        print("in getRank : ${total.result.first.psModel}");
      }

      totalInfo.value = total.result;
    }
    update();
    return totalList.value = total;
  }


  Future<List<Rankinfo>> getRankGrade(int index) async {
    switch(index){
      case 1:
        RankList premium = await _srcRankRepository.getRankInfoGrade('PREMIUM');
        List<Rankinfo> info = premium.result;
        premiumInfo.value = info;
        update();
        return info;
      case 2:
        RankList high = await _srcRankRepository.getRankInfoGrade('HIGH');
        List<Rankinfo> info = high.result;
        highInfo.value = info;
        update();
        return info;
      case 3:
        RankList normal = await _srcRankRepository.getRankInfoGrade('NORMAL');
        List<Rankinfo> info = normal.result;
        normalInfo.value = info;
        update();
        return info;
      case 4:
        RankList worthy = await _srcRankRepository.getRankInfoGrade('WORTHY');
        List<Rankinfo> info = worthy.result;
        worthyInfo.value = info;
        update();
        return info;
      default:
        return <Rankinfo>[];
    }
  }

  void clickAllView() async{
    scrollController.hasClients ? scrollController.jumpTo(0.0) : null;
    await DeviceManager.overLayClients();
    Get.to(
            () => const RankPhoneView(), binding: BindingsBuilder(() {
      Get.put(RankPhoneController(
        commonWidgets: _commonWidgets
      ));
    }));
  }




  void _controllerClose(){
    scrollController.dispose();
    homeController.dispose();
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    homeController = ScrollController();
    scrollController = ScrollController();
    await getRank();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _controllerClose();
    super.onClose();
  }

}