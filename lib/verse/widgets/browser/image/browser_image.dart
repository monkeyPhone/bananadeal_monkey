import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/image/ui/browser_image_dialog_ui.dart';
import 'package:flutter/material.dart';

class BrowserImage {
  const BrowserImage();

  void openDialog({
    required BuildContext routerContext,
    required int currentIndex,
    required List<String> imageList,
    required bool isDownload,
    required String baseUrl
  }){
    Future.delayed(
        Duration.zero,
            (){
          if(routerContext.mounted){
            showDialog(
                barrierColor: Colors.black87,
                context: routerContext,
                barrierDismissible: false,
                builder: (BuildContext context) =>
                    BrowserImageDialogUi(
                      currentIndex: currentIndex,
                      imageList: imageList,
                      isDownload: isDownload,
                      baseUrl: baseUrl,
                    )
            );
          }
        }
    );
  }

}