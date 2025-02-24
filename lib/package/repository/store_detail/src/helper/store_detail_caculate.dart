import 'package:banana_deal_by_monkeycompany/package/data/store/store_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/function/common_function.dart';

class StoreDetailCalculate{
  const StoreDetailCalculate();

  List<(String, String)> calculateEvent(StoreDetailVO result) {
    final List<String> events = [
      result.smEvent1,
      result.smEvent2,
      result.smEvent3,
    ];
    final List<String> icons = [
      result.smIconEvent1,
      result.smIconEvent2,
      result.smIconEvent3,
    ];

    return List.generate(
        events.length,
            (index) => (icons[index], events[index])
    ).where((record) => record.$1.isNotEmpty && record.$2.isNotEmpty).toList();
  }

  List<String> calculateImage(StoreDetailVO result){
    final List<String> imagePath = [
      result.smPathImg0,
      result.smPathImg1,
      result.smPathImg2,
      result.smPathImg3,
      result.smPathImg4,
      result.smPathImg5];
    final List<String> imageList = imagePath.where((e) => e.isNotEmpty).map((e)=>e).toList();
    return imageList;
  }


  (bool ,bool, String) calculateTime({
    required StoreDetailVO result,
    required CommonFunction function
  })
  => function.calculateTime(
      smTimeStart: result.smTimeStart,
      smTimeEnd: result.smTimeEnd,
      smConsultationTime: result.smConsultationTime
  );

}