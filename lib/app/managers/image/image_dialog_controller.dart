import 'dart:async';
import 'package:banana_deal_by_monkeycompany/app/modules/main/auth/auth_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:saver_gallery/saver_gallery.dart';



class ImageDialogController extends GetxController with GetSingleTickerProviderStateMixin{


  RxBool loading = false.obs;
  RxString progressString = ''.obs;

  late final AnimationController _controllerReset;
  late final TransformationController transformationController;
  Animation<Matrix4>? _animationReset;

  void _onAnimateReset() {
    transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
      begin: transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset!.addListener(_onAnimateReset);
    _controllerReset.forward();
  }


  Future<void> downloadNetworkImage(String url) async {
    Dio dio = Dio();
    try{
      final response = await dio.get(
          url,
          options: Options(responseType: ResponseType.bytes),
          onReceiveProgress: (rec, total) {
            loading.value = true;
            progressString.value = "${((rec / total) * 100).toStringAsFixed(0)}%";
            update();
          }
      );
      await SaverGallery.saveImage(
          Uint8List.fromList(response.data), fileName: url, skipIfExists: false);
    } catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      AuthController.commonWidgets.customSnackbar('이미지 다운로드에 실패했습니다.');
      loading.value = false;
      progressString.value = '';
      update();
    } finally {
      dio.close();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    transformationController = TransformationController();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debounce(progressString, (_) {
      if (progressString.value == "100%") {
        loading.value = false;
        progressString.value = '';
        update();
        AuthController.commonWidgets.customSnackbar('이미지 다운로드가 완료되었습니다.');
      }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerReset.dispose();
  }


}