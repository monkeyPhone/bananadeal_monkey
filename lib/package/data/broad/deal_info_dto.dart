import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class DealInfoDto{
  final StatusEnum statusEnum;
  final List<dynamic> myDealDetail;
  final List<dynamic> estimate1;
  final List<dynamic> estimate2;
  const DealInfoDto({
    required this.statusEnum,
    required this.myDealDetail,
    required this.estimate1,
    required this.estimate2,
  });


}