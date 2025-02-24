import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/store/convert_store.dart';
import 'package:dio/dio.dart';
import '../../models/auth_basic_api.dart';
import '../../models/src/deal/estimate_store.dart';
import '../../models/store/store_detail_info.dart';
import '../../models/store/store_detail_review.dart';
import '../../models/store/store_list_info.dart';

class BdBotNavRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const BdBotNavRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'main',
    this.rp = 'BdBotNavRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;


  Future<StoreListInfo> getStoreListInvite({required int start, required int diIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/member/store/list/invite';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getStoreList',
        router505: router505,
        form: {
          "start": start,
          "DI_idx": diIdx
        }
    );

    final StoreListInfo store = StoreListInfo.fromJson(data);
    return store;
  }

  // TODO: check 수정해야 됨
  Future<StoreListInfo> getStoreList({required int start, required String mOrder, required String mAsc}) async {
    final String apiRoute = '$_bananaPrivateUrl/member/store/list';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getStoreList',
        router505: router505,
        form: {
          "start": start,
          "M_order": mOrder,
          "M_asc": mAsc
        }
    );

    final StoreListInfo store = StoreListInfo.fromJson(data);
    return store;
  }

  Future<StoreListInfo> getStoreListSearch({required int start, required String keyword}) async {
    final String apiRoute = '$_bananaPrivateUrl/member/store/list/search';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getStoreListSearch',
        router505: router505,
        form: {
          "start": start,
          "keyword": keyword,
        }
    );
    final StoreListInfo store = StoreListInfo.fromJson(data);
    return store;
  }

  Future<ConvertStore> convertID({required String smIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/member/store/me';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}convertID',
        router505: router505,
        form: {
          "SM_idx": smIdx,
        }
    );

    final ConvertStore api = ConvertStore.fromJson(data);
    return api;
  }


  Future<AuthBagicApi3> getStoreDetailTime(String smMid) async{
    final String apiRoute = '$_bananaPrivateUrl/member/store/detail/byid';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getStoreDetailTime',
        router505: 'storeDetail',
        form: {
          "SM_m_id": smMid,
          "select_value": 'SM_store_name,SM_time_start,SM_time_end,SM_consultation_time'
        }
    );
    final AuthBagicApi3 time = AuthBagicApi3.fromJson(data);
    if(time.status == 200){
      Map<String, dynamic> jsonData = time.result.first;
      return AuthBagicApi3(
          status: time.status,
          msg: time.msg,
          result: [jsonData['SM_store_name'], jsonData['SM_time_start'], jsonData['SM_time_end'], jsonData['SM_consultation_time']]
      );
    } else{
      return time;
    }

  }


  Future<StoreDetailInfo> getStoreDetail({required String smMid, required int mIdx}) async {
    final String apiRoute = '$_bananaPrivateUrl/member/store/detail';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getStoreDetail',
        router505: 'storeDetail',
        form: {
          "SM_m_id": smMid,
          "M_idx" : mIdx,
        }
    );

    final StoreDetailInfo store = StoreDetailInfo.fromJson(data);
    return store;
  }


  Future<StoreReview> getStoreDetailReview({required String smMid, required int mIdx, required int page, required int length}) async {
    final String apiRoute = '$_bananaPrivateUrl/review/store/detail';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getStoreDetailReview',
        router505: router505,
        form: {
          "SM_m_id": smMid,
          "M_idx" : mIdx,
          "start" : page,
          "end" : length,
        }
    );

    final StoreReview review = StoreReview.fromJson(data);
    return review;

  }


  Future<AuthBagicApi> userReportCreate({
    required int bruMidx, required String bruType,
    required String bruMidxPe, required String bruSmMid,
    required String bruTitle, required bruContent , required bruRuIdx,
    required String bruPathImageEdit1,  required String bruPathImageEdit2,  required String bruPathImageEdit3
  }) async{
    var multi1 = bruPathImageEdit1 != '' ?  MultipartFile.fromFileSync(File(bruPathImageEdit1).path,) : '';
    var multi2 = bruPathImageEdit2 != '' ?  MultipartFile.fromFileSync(File(bruPathImageEdit2).path,) : '';
    var multi3 = bruPathImageEdit3 != '' ?  MultipartFile.fromFileSync(File(bruPathImageEdit3).path,) : '';
    final String apiRoute = '$_bananaPrivateUrl/report/create';
    FormData formData = FormData.fromMap(
        {
          "BRU_m_idx": bruMidx,
          "BRU_type": bruType,
          "BRU_m_idx_pe": bruMidxPe,
          "BRU_ru_idx": bruRuIdx,
          "BRU_sm_m_id": bruSmMid,
          "BRU_title": bruTitle,
          "BRU_content": bruContent,
          "BRU_path_img1": multi1,
          "BRU_path_img2": multi2,
          "BRU_path_img3": multi3,
        }
    );
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}userReportCreate',
        router505: router505,
        formData: formData
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);

    return api;

  }


  Future<AuthBagicApi2> checkAccept({
    required String smMid,
    required String mIdx,
  }) async{
    final String apiRoute = '$_bananaPrivateUrl/deal/store/estimate';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}checkAccept',
        router505: 'storeDetail',
        form: {
          "SM_m_id": smMid,
          "M_idx": mIdx
        }
    );

    final AuthBagicApi2 api = AuthBagicApi2.fromJson(data);
    return api;
  }

}