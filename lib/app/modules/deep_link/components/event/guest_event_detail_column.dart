import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import '../../../../components/image_provider/image_provider_state.dart';
import '../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../css/app_basic_component/basic_app_bar_text.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../../../../routes/api_url.dart';
import '../../../../routes/const_element.dart';
import '../../controllers/deep_link_event_controller.dart';



class GuestEventDetailColumn extends GetView<DeepLinkEventController> {
  final int eventIdx;
  const GuestEventDetailColumn({
    super.key,
    required this.eventIdx});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BasicAppbar(
          title: BasicAppBarText20(
            text: controller.eventDetail.value.beTitle,
          ),
        ),
        Expanded(
            child: Obx(
                    () {
                  return Column(
                    children: [
                      Expanded(child:
                      Container(
                        width: WidgetSize(context).widthCommon,
                        color: Style.greyF4F4F4,
                        child: ListView(
                          physics: ClampingScrollPhysics(),
                          children: [
                            Column(
                              children: [
                                _imageArea(controller.eventDetail.value.bePathImg2, context),
                                _imageArea(controller.eventDetail.value.bePathImg3, context),
                                controller.eventDetail.value.beContent != ''
                                    ?
                                Padding(
                                  padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
                                  child:
                                  SizedBox(
                                    width: WidgetSize(context).widthCommon,
                                    child: HtmlWidget(
                                      controller.eventDetail.value.beContent,
                                      textStyle: TextStyle(
                                          fontSize: WidgetSize(context).sizedBox14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ) : SizedBox(),
                                SizedBox(height: WidgetSize(context).sizedBox32,),
                                _sharedButton(
                                    onTap: () async{
                                      await controller.shareEvent(eventIdx);
                                    },
                                  context: context
                                ),SizedBox(height: WidgetSize(context).sizedBox32,)
                              ],
                            ),
                          ],
                        ),
                      )),
                      SizedBox(
                        height: WidgetSize(context).extendsGap,
                      )
                    ],
                  );
                }
            )
        )
      ],
    );
  }

  Widget _imageArea(String imagePath, BuildContext context) {
    return
      imagePath != ''
          ?
      ImageProviderState(
          imageWidth:  WidgetSize(context).widthCommon,
          imageUrl: ApiConsole.imageBananaUrl+imagePath, errUrl: AppElement.defaultThumb,   aspectRatio: AppElement.caseNotice)
     : SizedBox();
  }

  Widget _sharedButton({required GestureTapCallback onTap, required BuildContext context}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).height60px,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(WidgetSize(context).heightCommon),
            border: Border.all(
                width: WidgetSize(context).sizedBox3,
                color: Style.yellow
            )
        ),
        child: Center(
          child: Text('이벤트 공유하기',
            style: TextStyle(
                fontSize: WidgetSize(context).sizedBox18,
                fontWeight: FontWeight.w400,
                color: Style.brown
            ),
          ),
        ),
      ),
    );
  }

}
