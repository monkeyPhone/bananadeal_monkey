import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_body_main_area/detail_body_main_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_image_area_helper/detail_image_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body_helper/detail_select_color_helper/detail_select_color_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../models/deal/model_detail_data.dart';
import '../../../../../controllers/search_phone_controllers/search_phone_detail_controller.dart';

class DetailBodyStateMent extends StatelessWidget {
  const DetailBodyStateMent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPhoneDetailController>(
        builder: (controller) =>
            Column(
              children: [
                DetailImageArea(
                  currentColor: controller.currentColor.value,
                  itemCount: List<PhoneImg>.generate(controller.datas.value.phoneImg.length, (index) => controller.datas.value.phoneImg[index]).toList().length,
                  phoneImg: List<PhoneImg>.generate(controller.datas.value.phoneImg.length, (index) => controller.datas.value.phoneImg[index]).toList(),
                ),
                DetailSelectColorArea(
                  currentColor: controller.currentColor.value,
                  phoneImgLegth: List<PhoneImg>.generate(controller.datas.value.phoneImg.length, (index) => controller.datas.value.phoneImg[index]).toList().length,
                  phoneImg: List<PhoneImg>.generate(controller.datas.value.phoneImg.length, (index) => controller.datas.value.phoneImg[index]).toList(),
                ),
                DetailBodyMainArea(
                  currentPage: controller.currentPage.value,
                  phoneSpecDetail: controller.datas.value.phoneSpecDetail,
                  mk: controller.datas.value.phoneSpecDetail.mkIdx != '4'
                    ? controller.mkList.firstWhere((element) => element.mkIdx ==
                      controller.datas.value.phoneSpecDetail.mkIdx
                  ).mkName
                    : controller.mksList.value.mksName != ''
                        ? controller.mksList.value.mksName
                        : '기타',
                  design: controller.specDesign.value,
                  special: controller.specSpecial.value,
                  camera: controller.specCamera.value,
                ),
              ],
            )
    );;
  }
}
