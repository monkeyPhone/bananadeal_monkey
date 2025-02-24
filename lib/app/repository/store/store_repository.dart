import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/store/invite_store_idx.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../models/auth_basic_api.dart';

class StoreRepository{
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const StoreRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'main',
    this.rp = 'StoreRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;

  Future<AuthBagicApi> favoriteCreate({
      required int fMidx, required String fSmMid}) async {

    final String apiRoute = '$_bananaPrivateUrl/favorites/create';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}favoriteCreate',
        error: 'Y',
        router505: router505,
        form:   {
          "F_m_idx": '$fMidx',
          "F_sm_m_id": fSmMid,
        }
    );

    final AuthBagicApi create = AuthBagicApi.fromJson(data);
    return create;

  }

  Future<AuthBagicApi> favoriteDelete({
    required int fMidx, required String fSmMid}) async {

    final String apiRoute = '$_bananaPrivateUrl/favorites/delete';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}favoriteDelete',
        router505: router505,
        error: 'Y',
        form:   {
          "F_m_idx": '$fMidx',
          "F_sm_m_id": fSmMid,
        }
    );

    final AuthBagicApi create = AuthBagicApi.fromJson(data);
    return create;

  }

  Future<int> getImageSize(String imageUrl) async {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      final response = await dio.head(imageUrl);
      final contentLength = response.headers['content-length'];
      if (contentLength != null) {
        final sizeInBytes = int.parse(contentLength.first);
        return sizeInBytes;
      } else{
        return 0;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return 0;
    } finally{
      dio.close();
    }

  }

  Future<InviteStoreIdx> postStoreList({required int diIdx, required String smMid, required mName}) async {

    final String apiRoute = '$_bananaPrivateUrl/deal/invite/byidx';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}postStoreList',
        router505: router505,
        form: {
          "D_di_idx": diIdx,
          "D_sm_m_id": smMid,
          "M_name": "$mName"
        }
    );

    final InviteStoreIdx bagic = InviteStoreIdx.fromJson(data);
    return bagic;

  }

}