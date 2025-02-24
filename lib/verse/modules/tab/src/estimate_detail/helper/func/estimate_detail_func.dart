import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_deal.dart';
import 'package:intl/intl.dart';

class EstimateDetailFunc {
  const EstimateDetailFunc();

  String switchEstimateJoinTkIdx({
    required int deJoinTkIdx
  }){
    switch(deJoinTkIdx){
      case 1:
        return 'SK';
      case 2:
        return 'KT';
      case 3:
        return 'LG';
      case 4:
        return '7모바일';
      case 5:
        return 'M모바일';
      case 6:
        return 'U모바일';
      case 8:
        return 'Hello모바일 (KT망)';
      case 12:
        return 'Hello모바일 (LG망)';
      case 14:
        return '기타';
      default:
        return '협의';
    }
  }

  String switchEstimateSupType({
    required String deSupportType
  }){
    switch(deSupportType){
      case 'CHOICE':
        return '선택약정';
      case 'GONGSI':
        return '공시지원';
      default:
        return '협의';
    }
  }

  (String title, String content) switchEstimateDeContractPlan({
    required String deContractPlan
  }) => switch(deContractPlan){
    'SK_PREMIUM_PASS' => ('프리미엄패스', '가입'),
    'SK_PREMIUM_PASS_NONE' => ('프리미엄패스', '미가입'),
    'KT_SIMPLE_COURSE' => ('약정코스', '심플코스'),
    'KT_BASIC_COURSE' => ('약정코스', '베이직코스'),
    _ => ('약정플랜', '식스플랜')
  };

  String switchEstimateDeInstalmentMonth({
    required int deInstallmentMonth
  }) => deInstallmentMonth == 0 ? '현금구매' : '$deInstallmentMonth개월';

  String switchEstimatePrice({
    required int price
  }) => price == 0 ? '0원' : '${NumberFormat('###,###').format(price)}원';

  String switchEstimatePriceMinus({
    required int price
  }) => price == 0
          ? '0원'
          : price == 18
                ? '확인불가'
                : '-${NumberFormat('###,###').format(price)}원';

  bool resultIsColor(String value) => value.contains(',');


  String convertStatus(String dStatus){
    return switch(dStatus){
      'OPEN' => dealStatusOpen,
      'ACCEPT' => dealStatusAcp,
      _ => dealStatusEnd,
    };
  }

}