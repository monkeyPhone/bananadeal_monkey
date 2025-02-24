import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../../components/image_provider/image_provider_state.dart';
import '../../../../../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../../../../../css/app_basic_component/basic_app_bar_text.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../models/src/banner/src_banner.dart';
import '../../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../../src_components/controllers/src_banner_controller.dart';

class BannerDetailPageView extends GetView<SrcBannerController> {
  final SrcBannerList currentBanner;
  const BannerDetailPageView({
    required this.currentBanner,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.detailScrollController = ScrollController();
    controller.transformationController = TransformationController();
    return BasicCanvas(
      canPop: false,
      onPopInvoked: (bool didPop, Object? result) async{
        if(didPop){
          return;
        }
        controller.closeBanner();
      },
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if(currentBanner.bmCategory == '공지')
                  BasicAppbar(
                      title: BasicAppBarText22(text: currentBanner.bmTitle),
                      leading: (){
                        controller.closeBanner();
                      },
                  ),
                if(currentBanner.bmCategory == '이미지')
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onDoubleTap: controller.resetInteractiveViewer,
                        child: InteractiveViewer(
                          transformationController: controller.transformationController,
                          maxScale: 2.5,
                          minScale: 0.8,
                          child: ImageProviderState(
                              imageWidth: WidgetSize(context).widthCommon,
                              imageUrl: ApiConsole.imageBananaUrl + currentBanner.bmImgPathImg,
                              errUrl: AppElement.defaultNotice,  aspectRatio: AppElement.caseNotice
                          ),
                          constrained: false,
                        ),
                      ),
                    ),
                  ),
                if(currentBanner.bmCategory == '공지')
                  Expanded(
                      child: Scrollbar(
                        controller: controller.detailScrollController,
                        thumbVisibility: true,
                        child: ListView(
                          controller: controller.detailScrollController,
                          physics: ClampingScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('',
                                    style: TextStyle(
                                        fontSize: WidgetSize(context).sizedBox16,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(DateFormat('yyyy년 MM월 dd일').format(currentBanner.bmRegdate.toLocal()),
                                    style: TextStyle(
                                        fontSize: WidgetSize(context).sizedBox16
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (currentBanner.bmNoticePathImg != '')
                              Column(
                                children: [
                                  SizedBox(
                                    height: WidgetSize(context).sizedBox7_5,
                                  ),
                                  GestureDetector(
                                      onTap: (){
                                        controller.openDialog(
                                          context: context,
                                            imageUrl: currentBanner.bmNoticePathImg
                                          );
                                        },
                                      child: ImageProviderState(
                                          imageWidth: WidgetSize(context).widthCommon,
                                          imageUrl: ApiConsole.imageBananaUrl + currentBanner.bmNoticePathImg,
                                          errUrl: AppElement.defaultNotice,  aspectRatio: AppElement.caseNotice
                                      )
                                  ),
                                ],
                              ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: WidgetSize(context).sizedBox16,
                                  vertical: WidgetSize(context).sizedBox20
                              ),
                              child: Text(currentBanner.bmNotice,
                                style: TextStyle(
                                    fontSize: WidgetSize(context).sizedBox16
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
              ],
            ),
            Positioned(
                top: WidgetSize(context).sizedBox8,
                right: WidgetSize(context).sizedBox8,
                child: currentBanner.bmCategory == '이미지'
                          ?  SizedBox(
                                height: WidgetSize(context).sizedBox45,
                                width: WidgetSize(context).sizedBox45,
                                child: FloatingActionButton(
                                          highlightElevation: 0,
                                          splashColor: Style.yellow,
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          onPressed: (){
                                            controller.closeBanner();
                                            },
                                          child: FittedBox(
                                            child: Padding(
                                              padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
                                              child: Icon(
                                                size: WidgetSize(context).sizedBox25,
                                                Icons.close,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                ),
                              )
                          : SizedBox()
            )
          ],
        ),
    );
  }
}
