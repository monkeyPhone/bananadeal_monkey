import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';

List<RankAllVO> convertRankAllVO(List<dynamic>? data) {
  if (data == null || data.isEmpty) {
    return [];
  }
  return data.map((item) => RankAllVO.fromJson(item as Map<String, dynamic>)).toList();
}


class RankAllVO {
  final List<RankVO> all;
  final List<RankVO> premium;
  final List<RankVO> high;
  final List<RankVO> normal;
  final List<RankVO> worthy;
  const RankAllVO({
    required this.all,
    required this.premium,
    required this.high,
    required this.normal,
    required this.worthy
  });

  factory RankAllVO.fromJson(Map<String, dynamic> json) => RankAllVO(
    all: List<RankVO>.from(json["all"].map((x) => RankVO.fromJson(x))),
    premium: List<RankVO>.from(json["premium"].map((x) => RankVO.fromJson(x))),
    high: List<RankVO>.from(json["high"].map((x) => RankVO.fromJson(x))),
    normal: List<RankVO>.from(json["normal"].map((x) => RankVO.fromJson(x))),
    worthy: List<RankVO>.from(json["worthy"].map((x) => RankVO.fromJson(x))),
  );

}