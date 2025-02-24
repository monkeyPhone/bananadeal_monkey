import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/widget_components/stack_loading_bar/basic_loading.dart';
import '../../../css/size.dart';
import '../../../css/style.dart';

class LoadingControllerDialog {
  Widget dialog(String text) =>
      PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, Object? result) {
            if(didPop){
              return;
            }
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BasicLoading(),
                  SizedBox(
                    height: WidgetSize(Get.context!).sizedBox20,
                  ),
                  Text(text,
                    style: TextStyle(
                        color: Style.progressBar,
                        fontSize: WidgetSize(Get.context!).sizedBox20,
                        fontWeight: FontWeight.w700
                    ),
                  )
                ],
              ),
            ),
          )
      );
}