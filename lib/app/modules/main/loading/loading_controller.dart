import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loading_controller_dialog.dart';

class LoadingController extends GetxController{
  static LoadingController get to => Get.find();



  RxBool isDialogOpen = false.obs;

  void updateDialog(bool result){
    isDialogOpen.value = result;
    update();
  }


  Future apiLoadings({required Future future, required String text}) async {
    updateDialog(true);
    Future.delayed(Duration.zero, (){
      showDialog<String>(
          barrierDismissible: false,
          context: Get.context!,
          builder: (BuildContext context) =>
              LoadingControllerDialog().dialog(text)
      );
    });
    try{
      final result = await future;
      updateDialog(false);
      return result;
    } catch(_){
      updateDialog(false);
      return null;
    }
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    // Timer(Duration(seconds: 12), (){
    //  Get.back();
    // });
    super.onInit();

  }

}