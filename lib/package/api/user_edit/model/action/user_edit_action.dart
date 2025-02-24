import 'dart:io';

import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class UserEditAction {
  const UserEditAction();

  final String _where = 'UserEditAction';

  Future<StatusEnum> updateUser({
    required Map<String, dynamic> dataMap,
    required DioRepository dio,
  }) async{

    final DataDto data = await dio.getDto(
        restApiEnum: RestApiEnum.user,
        endPoint: 'member/add/edit/custom',
        repositoryName: _where,
        form: dataMap
    );


    return data.statusEnum;
  }

  Future<StatusEnum> fetchThumbnail({
    required String eMail,
    required String originImage,
    required String imageUrl,
    required DioRepository dio,
  }) async{
    var multi1;
    switch(kIsWeb){
      case true:
        if(imageUrl != ''){
          final XFile image = XFile(imageUrl);
          final bytes = await image.readAsBytes();
          final MultipartFile file = MultipartFile.fromBytes(bytes, filename: "picture");
          multi1 = file;
        } else {
          multi1 = '';
        }
      case false:
        imageUrl == '' || imageUrl == 'delete'
            ? multi1 = ''
            : multi1 =  MultipartFile.fromFileSync(File(imageUrl).path);
    }


    Map<String, dynamic> form = {
      "M_email": eMail,
      "M_path_img": originImage,
      "M_path_img_edit": multi1,
    };
    final DataDto result = await dio.getDto(repositoryName: _where, restApiEnum: RestApiEnum.user, endPoint: 'member/edit/img', form: form);
    return result.statusEnum;
  }


  Future<StatusEnum> memberOut({
    required int currentIndex,
    required String answer,
    required DioRepository dio,
  }) async{
    final DataDto dto = await dio.getDto(
        repositoryName: _where,
        restApiEnum: RestApiEnum.user,
        endPoint: 'member/out',
        form: {
          "MO_reason": currentIndex,
          "MO_reason_content": answer,
        }
    );

    return dto.statusEnum;
  }


}