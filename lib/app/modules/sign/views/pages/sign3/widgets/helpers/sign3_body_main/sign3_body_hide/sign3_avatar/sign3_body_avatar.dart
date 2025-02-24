import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_main/sign3_body_hide/sign3_avatar/sign3_image_card_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign3/widgets/helpers/sign3_body_main/sign3_body_hide/sign3_avatar/sign3_upload_card_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../controllers/sign_view_3_controller.dart';


class Sign3BodyAvatar extends GetView<SignView3Controller> {
  const Sign3BodyAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return  ObxValue((p0) =>
                p0[0] != null
                  ? Sign3ImageCardArea()
                  : Sign3UploadCardArea()
        , controller.imagePath  );
  }
}
