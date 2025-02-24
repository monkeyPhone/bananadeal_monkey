import 'package:banana_deal_by_monkeycompany/app/components/future_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../components/custom_tap_bar.dart';
import '../../../../../../../components/loading.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../controllers/etc_review_setting_controller.dart';
import 'components/review/after/review_after_list.dart';
import 'components/review/before/review_before_list.dart';

class EtcReviewSettingView extends GetView<EtcReviewSettingController> {
  const EtcReviewSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            BasicAppbar(title: Text(
              '후기 관리',
              style: TextStyle(
                  color: Style.blackWrite,
                  fontSize: WidgetSize(context).sizedBox24,
                  fontWeight: FontWeight.w700
              ),
            )),
            GetX<EtcReviewSettingController>(
              builder: (review) {
                return CustomTapBar(tabController: review.tabController, tap1: '작성 필요(${review.beforeReview.length})', tap2: '작성 완료(${review.afterReview.length})',);
              }
            ),
            Expanded(
                child: ObxValue((p0) =>
                !p0.value
                    ? FutureBuilderWidget(
                          future: controller.getReviewList(),
                          nextWidget: ObxValue((p0) =>
                          !p0.value
                              ? Obx(
                                  (){
                                    return
                                      controller.userReview.value.result.last.smMid == ''
                                          ? Loading2(text: '잠시만 기다려주세요',)
                                          : controller.currentTap.value == 0
                                              ? controller.beforeReview.isNotEmpty ?  ReviewBeforeList() : DefaultView(text1: '작성 가능한 후기가 없어요.', text2: '',)
                                              : controller.afterReview.isNotEmpty ? ReviewAfterList() : DefaultView(text1: '작성 가능한 후기가 없어요.', text2: '',);
                                  }
                                  )
                              : DefaultView(text1: '등록된 리뷰가 없어요.', text2: ' ',)
                              , controller.no)
                      )
                    : Loading2(
                        text: '후기 목록 수정중이에요.',
                )
                    , controller.write)
            )
          ],
        ),
        bottomNavigationBar: SafeArea(child: SizedBox()));

  }
}
