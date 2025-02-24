import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/model_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';


abstract class ModelListRepository {
  const ModelListRepository();

  Stream <ModelListVO> initModelList(String tkIdx);


  Future<List<PhoneSpecDto>> getPhoneSpec({
    String? mkIdx,
    String? keyword,
  });

  Future<List<MobileDataDto>> getMobileData({
    required String tkIdx,
    String? keyword
  });
}