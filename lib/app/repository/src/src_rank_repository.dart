import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import '../../models/rank/rank_list.dart';


class SrcRankRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const SrcRankRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'src',
    this.rp = 'SrcRankRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;

  Future<RankList> getRankInfo() async {
    final String apiRoute = '$_bananaPrivateUrl/member/phone/ranklist';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getRankInfo',
        router505: router505,
    );

    final RankList rank = RankList.fromJson(data);

    return rank;
  }

  Future<RankList> getRankInfoGrade(grade) async {
    final String apiRoute = '$_bananaPrivateUrl/member/phone/ranklist/item';
    final Map<String, dynamic> data = await _dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}getRankInfoGrade',
      router505: router505,
      error: 'Y',
      form: {
        "LDCP_mobileGrade": "$grade"
      }
    );
    final RankList rank = RankList.fromJson(data);
    return rank;

  }

}