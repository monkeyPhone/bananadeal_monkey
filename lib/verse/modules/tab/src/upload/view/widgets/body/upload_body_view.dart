import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/view/widgets/body/photo_list/upload_photo_list_builder.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/view/widgets/body/preview/upload_body_preview_selector.dart';
import 'package:flutter/material.dart';

class UploadBodyView extends StatelessWidget {
  const UploadBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UploadBodyPreviewSelector(),
        Expanded(
            child: UploadPhotoListBuilder()
        )
      ],
    );
  }
}

