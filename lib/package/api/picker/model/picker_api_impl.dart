import 'package:banana_deal_by_monkeycompany/package/api/picker/model/action/picker_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/picker/picker_api.dart';
import 'package:image_picker/image_picker.dart';

class PickerApiImpl implements PickerApi {
  final PickerAction action;
  const PickerApiImpl({
    required this.action
  });

  @override
  Future<XFile?> getGallery()  async => await action.getGallery();

  @override
  Future<XFile?> getCamera() async => await action.getCamera();

}