import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_review_setting/components/review/after/review_after_detail.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_review_setting/components/review/after/review_update_button.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../managers/image/image_dialog_manager.dart';
import '../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../routes/const_element.dart';
import '../../../../../../controllers/etc_review_setting_controller.dart';

class ReviewAfterList extends GetView<EtcReviewSettingController> {
  const ReviewAfterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller.scrollController2,
      thumbVisibility: true,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: controller.afterReview.length,
          controller: controller.scrollController2,
          itemBuilder: (BuildContext context, int index){
            DateTime form =
            controller.afterReview[index].ruRegdate == null
                ?
            DateTimeConfig().now
                :
            controller.afterReview[index].ruRegdate!.toLocal();
            var allTime = DateFormat("yyyy.MM.dd").format(form);
            return _reViewAfterContainer(index, allTime, context);
          }),
    );
  }

  Widget _reViewAfterContainer(int index, allTime, BuildContext context){
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox12, horizontal: WidgetSize(context).sizedBox12),
            width: WidgetSize(context).widthCommon,
            height: WidgetSize(context).sizedBox136,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD)
                )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _thumbNailAfter(index, context),
                SizedBox(width: WidgetSize(context).sizedBox12,),
                _cardCenterAfter(index, allTime, controller.afterReview[index].ruPoint, context),
                ReviewUpdateButton(
                    ruIdx: controller.afterReview[index].ruIdx, ruPoint: controller.afterReview[index].ruPoint,
                    ruContent: controller.afterReview[index].ruContent, image1: controller.afterReview[index].ruPathImg1,
                    image2: controller.afterReview[index].ruPathImg2, image3: controller.afterReview[index].ruPathImg3)
              ],
            )
        ),
        controller.afterReview[index].ruContent != '' || (controller.afterReview[index].ruPathImg1 != '' || controller.afterReview[index].ruPathImg2 != '' || controller.afterReview[index].ruPathImg3 != '')
        || controller.afterReview[index].raAnswer != ''
            ? ReviewAfterDetail(index: index,)
            : const SizedBox()
      ],
    );
  }




  Widget _thumbNailAfter(int index, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
      ),
      elevation: WidgetSize(context).sizedBox1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.greyD9D9D9),
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
            child: ImageProviders(
                imageWidth: WidgetSize(context).sizedBox96,
                imageHeight: WidgetSize(context).sizedBox96,
                imageUrl: ApiConsole.imageBananaUrl+controller.afterReview[index].smPathImg0,
                errUrl: AppElement.defaultStore,
                imageLabel: AppElement.caseThumb
            )

        ),
      ),
    );
  }

  Widget _cardCenterAfter(int index, allTime, int? score, BuildContext context){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text:
                    controller.afterReview[index].smStoreName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: WidgetSize(context).sizedBox20,
                    ),
                  ),
                ),
                SizedBox(height: WidgetSize(context).sizedBox2,),
                Text('$allTime',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: WidgetSize(context).sizedBox14,
                      color: Style.grey999999
                  ),
                ),
                SizedBox(height: WidgetSize(context).sizedBox2,),
                score == null ? SizedBox() : Row(
                  children: [
                    Icon(Icons.star,color: Style.yellow, size: WidgetSize(context).sizedBox18,),
                    Text('$score', style: TextStyle(
                        fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400
                    ),),
                  ],
                ),
              ],
            ),


            Text('${controller.afterReview[index].dePsName}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: WidgetSize(context).sizedBox16,
                  color: Style.grey999999
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

}
