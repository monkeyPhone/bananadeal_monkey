import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_estimate.dart';
import 'package:banana_deal_by_monkeycompany/app/models/src/deal/estimate_status.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/estimate/estimate_repository.dart';
import 'package:get/get.dart';

class SrcEstimateController extends GetxController {
  static SrcEstimateController get to => Get.find();

  final SrcEstimateRepository  srcEstimateRepository;

  SrcEstimateController({
    required this.srcEstimateRepository,
  });

  RxList<DealEstimateList> estimate0 = <DealEstimateList>[].obs;
  RxList<DealEstimateList> estimate1 = <DealEstimateList>[].obs;
  RxList<DealEstimateList> estimate2 = <DealEstimateList>[].obs;
  RxInt estimateSort = 0.obs;
  RxBool isError = false.obs;


  void dealOctListReset(){
    estimate0.value = <DealEstimateList>[];
    estimate1.value = <DealEstimateList>[];
    estimate2.value = <DealEstimateList>[];
    estimateSort.value = 0;
    update();
  }

  void sortEstimateList(int index) {
    estimateSort.value = index;
    update();
  }

  String getStatus(List<EstimateStatusList> list) {
    if(list.isNotEmpty){
      if(list.where((e) => e.dStatus == 'OPEN').isNotEmpty){
        return 'OPEN';
      } else{
        if(list.where((e) => e.dStatus == 'ACCEPT').isNotEmpty){
          return 'ACCEPT';
        }
        else{
          if(list.where((e) => e.dStatus == 'PARTICIPATE').isNotEmpty){
            return 'PARTICIPATE';
          }
          else{
            if(list.where((e) => e.dStatus == 'NEW').isNotEmpty){
              return 'NEW';
            } else{
              if(list.where((e) => e.dStatus == 'END').isNotEmpty){
                return 'END';
              }
              else{
                return 'ERROR';
              }
            }
          }
        }
      }
    } else{
      return '';
    }
  }

  Future<bool> makeEstimate({
    required int diIdx,
  }) async{
    final (int , List<DealEstimateList>) est0 = await _getDealEstimate(diIdx: diIdx, order: 0);
    final (int , List<DealEstimateList>) est1 = await _getDealEstimate(diIdx: diIdx, order: 1);
    final (int , List<DealEstimateList>) est2 = await _getDealEstimate(diIdx: diIdx, order: 2);

    final bool status = est0.$1 != 200 || est1.$1 != 200 || est2.$1 != 200;
    if(!status){
      estimate0.value = est0.$2;
      estimate1.value = est1.$2;
      estimate2.value = est2.$2;
      update();
    }else{
      dealOctListReset();
    }
    isError.value = status;
    update();
    return status;
  }

  Future<(int status, List<DealEstimateList> list)> _getDealEstimate({
    required int diIdx,
    required int order,
  }) async{
    final DealEstimate deal = await srcEstimateRepository.getDealEstimate(
      diIdx: diIdx,
      start: 0,
      order: order,
      length: 5,
  );
    final (int, List<DealEstimateList>) result = (deal.status, deal.result);
  return result;
}


}