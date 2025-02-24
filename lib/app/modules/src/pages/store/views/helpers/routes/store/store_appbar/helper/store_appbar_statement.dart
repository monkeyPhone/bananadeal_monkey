import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../src_components/bottom_nav_bar/controllers/bd_bot_nav_store_controller.dart';
import '../../../../../../controllers/store_controller.dart';
import '../store_appbar.dart';

class StoreAppbarStatement extends StatelessWidget {
  const StoreAppbarStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BdBotNavStoreController>(
        builder: (bdC){
          return
            GetBuilder<StoreController>(
                builder: (controller) {
                  return StoreAppbar(
                    store: bdC.storeInfoSort,
                    storeInput: controller.storeInput.value,
                    inputStore: controller.inputStore,
                    storeText: controller.storeText,
                    rong: controller.rong.value,
                    buttonName: controller.buttonName,
                    currentButton: controller.currentButton.value,
                  );
                }
            );
        }
    );
  }
}
