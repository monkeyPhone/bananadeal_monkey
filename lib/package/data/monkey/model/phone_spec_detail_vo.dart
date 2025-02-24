import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class PhoneSpecDetailVO {
  final StatusEnum statusEnum;
  final PhoneSpecDetailEntity entity;
  final PsSpec spec;
  final String maker;
  const PhoneSpecDetailVO({
    required this.statusEnum,
    required this.entity,
    required this.spec,
    required this.maker
  });
}

class PsSpec {
  final String design;
  final String special;
  final String camera;
  const PsSpec({
    required this.design,
    required this.special,
    required this.camera,
  });
}