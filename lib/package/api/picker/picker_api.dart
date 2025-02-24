import 'package:image_picker/image_picker.dart';

abstract class PickerApi {
  const PickerApi();

  Future<XFile?> getGallery();

  Future<XFile?> getCamera();

}