import 'dart:io';

import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class UserRegAction {
  const UserRegAction();

  final String _where = 'UserRegApi_UserRegAction';

  Future<DataDto> checkNick({
    required DioRepository dio,
    required String nick
  }) async{

    final Map<String, dynamic> form = {
      "M_name": nick,
    };
    final DataDto result = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.guest,
        endPoint: 'check/name',
        form: form
    );

    return result;
  }


  Future<DataDto> updateInfo({
    required String thumb,
    required String nick,
    required String dong,
    required String road,
    required (double, double) nat,
    required DioRepository dio,
    required AuthCacheProvider provider,
  }) async {
    final int mIdx = await provider.getIdxHiveFuture();

    var multi1;
    switch(kIsWeb){
      case true:
        if(thumb != ''){
          final XFile image = XFile(thumb);
          final bytes = await image.readAsBytes();
          final MultipartFile file = MultipartFile.fromBytes(bytes, filename: "picture");
          multi1 = file;
        } else {
          multi1 = '';
        }
      case false:
        thumb != ''
            ? multi1 =  MultipartFile.fromFileSync(File(thumb).path)
            : multi1 = '';
    }


    Map<String, dynamic> form = {
      "M_idx": '$mIdx',
      "M_name": nick,
      "M_add": road,
      "M_add_dong": dong,
      "M_latitude": '${nat.$1}',
      "M_longitude": '${nat.$2}',
      "M_path_img": multi1
    };
    final DataDto result = await dio.getDto(repositoryName: _where, restApiEnum: RestApiEnum.guest, endPoint: 'info/edit', form: form);


    return result;
  }



}