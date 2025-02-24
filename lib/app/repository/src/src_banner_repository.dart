import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:dio/dio.dart';
import '../../models/src/banner/src_banner.dart';
import '../../models/src/banner/src_popup.dart';
import '../../routes/api_url.dart';
import '../../routes/error_handling.dart';


class SrcBannerRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const SrcBannerRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'src',
    this.rp = 'SrcBannerRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;


  Future<SrcBanner> getMainBanner() async {
    final String apiRoute = '$_bananaPrivateUrl/banner/list';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getMainBanner',
        router505: router505,
    );
    final SrcBanner api = SrcBanner.fromJson(data);
    return api;
  }

  Future<SrcPopup> getMainPopup() async {
    final String apiRoute = '$_bananaPrivateUrl/popup/list';
    final Map<String, dynamic> data = await _dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}getMainPopup',
      router505: router505,
    );
    final SrcPopup api = SrcPopup.fromJson(data);
    return api;
  }
}