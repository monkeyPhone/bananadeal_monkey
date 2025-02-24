import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/etc/favorite_list_pae.dart';
import 'package:dio/dio.dart';
import '../../models/auth_basic_api.dart';
import '../../models/etc/bookmark_model.dart';
import '../../models/etc/user_block.dart';
import '../../models/etc/user_review.dart';
import '../../models/store/user_block_review.dart';
import '../../models/store/user_declaration_review.dart';

class BookmarkRepository{

  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String router505;
  final String rp;

  const BookmarkRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    this.router505 = 'main',
    this.rp = 'BookmarkRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl;


  Future<FavoriteListPage> getFavoriteListPage({required int mIdx, required String latitude, required String longtitude, required int page}) async{
    final String apiRoute = '$_bananaPrivateUrl/favorites/list/page';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getFavoriteList',
        router505: router505,
        form:    {
          "F_m_idx": "$mIdx",
          "M_latitude": latitude,
          "M_longitude": longtitude,
          "limit" : 10,
          "page": page
        }
    );

    final FavoriteListPage bookmark = FavoriteListPage.fromJson(data);
    return bookmark;

  }

  Future<UserReview> getUserReviewList() async{
    final String apiRoute = '$_bananaPrivateUrl/review/list';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getUserReviewList',
        router505: router505,
        error: 'Y',
    );
    final UserReview reviewList = UserReview.fromJson(data);
    return reviewList;
  }

  Future<AuthBagicApi> sendUserReviewList({
    required String mName, required ruDiIdx, required int ruUserIdx, required ruSmMid,
    required int ruPoint, required String ruContent,
    required String mPathImageEdit1,  required String mPathImageEdit2,  required String mPathImageEdit3
  }) async{
    var file1 = File(mPathImageEdit1);
    var multi1 =   mPathImageEdit1 != '' ? MultipartFile.fromFileSync(file1.path,) : '';
    var file2 = File(mPathImageEdit2);
    var multi2 = mPathImageEdit2 != '' ? MultipartFile.fromFileSync(file2.path,) : '';
    var file3 = File(mPathImageEdit3);
    var multi3 = mPathImageEdit3 != '' ? MultipartFile.fromFileSync(file3.path,) : '';
    final String apiRoute = '$_bananaPrivateUrl/review/create';
    FormData formData = FormData.fromMap(
        {
          "M_name": mName,
          "RU_di_idx": ruDiIdx,
          "RU_user_idx": ruUserIdx,
          "RU_sm_m_id": ruSmMid,
          "RU_point": ruPoint,
          "RU_content": ruContent,
          "RU_path_img1": multi1,
          "RU_path_img2": multi2,
          "RU_path_img3":  multi3,
        }
    );
    final Map<String, dynamic> data = await _dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}sendUserReviewList',
      router505: router505,
      error: 'Y',
      formData: formData
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    return api;

  }

  Future<AuthBagicApi> updateUserReviewList({
    required int ruIdx, required int ruPoint, required String ruContent,
    required String pathImage1, required String pathImage2, required String pathImage3,
    required String mPathImageEdit1,  required String mPathImageEdit2,  required String mPathImageEdit3
  }) async{
    var multi1 =  pathImage1 == mPathImageEdit1 ? pathImage1 : mPathImageEdit1 != '' ? MultipartFile.fromFileSync(File(mPathImageEdit1).path,) : 'Y';
    var multi2 = pathImage2 == mPathImageEdit2 ? pathImage2 :  mPathImageEdit2 != '' ? MultipartFile.fromFileSync(File(mPathImageEdit2).path,) : 'Y';
    var multi3 = pathImage3 == mPathImageEdit3 ? pathImage3 : mPathImageEdit3 != '' ? MultipartFile.fromFileSync(File(mPathImageEdit3).path,) : 'Y';

    final String apiRoute = '$_bananaPrivateUrl/review/edit';
    FormData formData = FormData.fromMap(
        {
          "RU_idx": ruIdx,
          "RU_point": ruPoint,
          "RU_content": ruContent,
          "RU_path_img1": pathImage1,
          "RU_path_img2": pathImage2,
          "RU_path_img3": pathImage3,
          "RU_path_img1_edit": multi1,
          "RU_path_img2_edit": multi2,
          "RU_path_img3_edit": multi3,
        }
    );

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}updateUserReviewList',
        router505: router505,
        error: 'Y',
        formData: formData
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);

    return api;

  }


  Future<UserBlock> getUserBlockList(int mIdx) async{
    final String apiRoute = '$_bananaPrivateUrl/report/block/list';

    final Map<String, dynamic> data = await _dsm.getData(
      apiRoute: apiRoute,
      repo: '${rp}getUserBlockList',
      router505: router505,
      error: 'Y',
      form: {
        "BU_m_idx": mIdx,
      }
    );

    final UserBlock api = UserBlock.fromJson(data);

    return api;

  }

  Future<AuthBagicApi> userBlockDelete(int buIdx) async{
    final String apiRoute = '$_bananaPrivateUrl/report/block/delete';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}userBlockDelete',
        router505: router505,
        error: 'Y',
        form:      {
          "BU_idx": buIdx,
        }
    );

    final AuthBagicApi api = AuthBagicApi.fromJson(data);
    return api;
  }

  Future<AuthBagicApi2> userBlockCreate({required String buMidx, required String peIdx, required String smMid, required String diIdx}) async{
    final String apiRoute = '$_bananaPrivateUrl/report/block/create';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}userBlockCreate',
        router505: router505,
        form:  {
          "BU_m_idx": buMidx,
          "BU_m_idx_pe" : peIdx,
          "BU_sm_m_id" : smMid,
          "DI_idx" : diIdx
        }
    );

    final AuthBagicApi2 api = AuthBagicApi2.fromJson(data);

    return api;
  }

  Future<UserBlockReview> userPostBlockList(int buMidx) async{
    final String apiRoute =  '$_bananaPrivateUrl/report/block/list/user';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}userPostBlockList',
        router505: router505,
        form:  {
          "BU_m_idx": buMidx,
        }
    );

    final UserBlockReview api = UserBlockReview.fromJson(data);
    return api;

  }

  Future<UserDeclarationReview> userPostDeclarationList(int buMidx) async{
    final String apiRoute = '$_bananaPrivateUrl/report/list/user';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}userPostDeclarationList',
        router505: router505,
        form:  {
          "BRU_m_idx": buMidx,
        }
    );

    final UserDeclarationReview api = UserDeclarationReview.fromJson(data);

    return api;

  }



}