import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../routes/const_element.dart';
import '../../../../../../controllers/etc_review_setting_controller.dart';
import 'review_wirte_button.dart';

class ReviewBeforeList extends GetView<EtcReviewSettingController> {
  const ReviewBeforeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
        return Scrollbar(
          controller: controller.scrollController1,
          thumbVisibility: true,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox12),
              physics: ClampingScrollPhysics(),
              itemCount: controller.beforeReview.length,
              controller: controller.scrollController1,
              itemBuilder: (BuildContext context, int index){
                DateTime form =
                controller.beforeReview[index].dhRegdate == null
                    ?
                DateTimeConfig().now
                    :
                controller.beforeReview[index].dhRegdate!.toLocal();
                var allTime = DateFormat("yyyy.MM.dd").format(form);
                return _reViewBeforeContainer(index, allTime, context);
              }),
        );
      }
    );
  }

  Widget _reViewBeforeContainer(int index, allTime, BuildContext context){
    return Container(
        padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox12),
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
            _thumbNailBefore(index, context),
            SizedBox(width: WidgetSize(context).sizedBox12,),
            _cardCenterBefore(index, allTime, context),
            ReviewWriteButton(smMid: controller.beforeReview[index].smMid, ruDiIdx: controller.beforeReview[index].diIdx,)
          ],
        )
    );
  }

  Widget _thumbNailBefore(int index, BuildContext context) {
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
                imageUrl: ApiConsole.imageBananaUrl+controller.beforeReview[index].smPathImg0,
                errUrl: AppElement.defaultThumb,
                imageLabel: AppElement.caseThumb
            )
        ),
      ),
    );
  }

  Widget _cardCenterBefore(int index, allTime, BuildContext context){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text:
                    controller.beforeReview[index].smStoreName,
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
              ],
            ),

            Text('${controller.beforeReview[index].dePsName}',
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
