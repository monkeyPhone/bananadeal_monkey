import 'package:banana_deal_by_monkeycompany/package/api/picker/picker_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/upload/upload_api.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_reg/user_reg_api.dart';
import 'package:banana_deal_by_monkeycompany/package/data/crop_image_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/register/register_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:image_picker/image_picker.dart';

class RegisterRepositoryImpl extends RegisterRepository{
  final UserRegApi api;
  final UploadApi uploadApi;
  final PickerApi pickerApi;
  final DioRepository dio;
  final AuthCacheProvider provider;
  const RegisterRepositoryImpl({
    required this.api,
    required this.uploadApi,
    required this.pickerApi,
    required this.dio,
    required this.provider
  });

  @override
  Stream<DataDto> streamCheckNick({
    required String nick
  }) => Stream.fromFuture(api.checkNick(nick: nick, dio: dio));

  @override
  Stream<DataDto> streamUpdateInfo({
    required String thumb,
    required String nick,
    required String dong,
    required String road,
    required (double, double) nat,
  }) => Stream.fromFuture(api.updateInfo(thumb: thumb, nick: nick, dong: dong, road: road, nat: nat, dio: dio, provider: provider));


  @override
  Future<XFile?> getGallery()  async => await pickerApi.getGallery();

  @override
  Future<XFile?> getCamera() async => await pickerApi.getCamera();

  @override
  Future<CropImageVO> cropImage({
    required UploadEnum caseUpload,
    required String selectImagePath,
  }) async => await uploadApi.cropImage(caseUpload: caseUpload, selectImagePath: selectImagePath);

}