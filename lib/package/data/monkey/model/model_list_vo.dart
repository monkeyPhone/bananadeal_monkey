import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class ModelListVO {
  final StatusEnum statusEnum;
  final List<MakerKindDto> makerList;
  final SpecListVO specList;
  final List<MobileDataDto> mobileList;
  const ModelListVO({
    required this.statusEnum,
    required this.makerList,
    required this.specList,
    required this.mobileList
  });

}


class SpecListVO{
  final List<PhoneSpecDto> samsung;
  final List<PhoneSpecDto> apple;
  final List<PhoneSpecDto> etc;
  const SpecListVO({
    required this.samsung,
    required this.apple,
    required this.etc,
  });
}