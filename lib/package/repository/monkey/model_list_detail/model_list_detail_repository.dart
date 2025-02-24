import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_vo.dart';

abstract class ModelListDetailRepository {
  const ModelListDetailRepository();

  Stream<PhoneSpecDetailVO> streamSpecDetail({
    required String psIdx,
  });

}