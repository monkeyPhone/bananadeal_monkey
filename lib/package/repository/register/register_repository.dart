import 'package:banana_deal_by_monkeycompany/package/data/crop_image_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:image_picker/image_picker.dart';

abstract class RegisterRepository {
  const RegisterRepository();

  Stream<DataDto> streamCheckNick({
    required String nick
  });

  Stream<DataDto> streamUpdateInfo({
    required String thumb,
    required String nick,
    required String dong,
    required String road,
    required (double, double) nat,
  });


  Future<XFile?> getGallery();

  Future<XFile?> getCamera();

  Future<CropImageVO> cropImage({
    required UploadEnum caseUpload,
    required String selectImagePath,
  });

}