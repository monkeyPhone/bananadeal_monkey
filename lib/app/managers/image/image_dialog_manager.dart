import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/image/image_dialog_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../components/image_provider/image_provider_state.dart';
import '../../css/size.dart';
import '../../css/style.dart';
import '../../routes/const_element.dart';

class ImageDialogManager {
  void openImageDownLoad({
    String? baseUrl,
    required String imageUrl,
    required BuildContext routerContext, required bool isDownload, List<String>? imageList}){
    Future.delayed(Duration.zero, (){
      if(routerContext.mounted){
        showDialog<String>(
            context: routerContext,
            barrierDismissible: !isDownload,
            builder: (BuildContext context) =>
                GetBuilder<ImageDialogController>(
                    init: ImageDialogController(),
                    builder: (controller) =>
                        GestureDetector(
                          onTap: (){
                            !isDownload
                                ? Get.back()
                                : null;
                          },
                          child: SizedBox(
                            height: WidgetSize(context).heightCommon,
                            width: WidgetSize(context).widthCommon,
                            child: Column(
                              children: [
                                isDownload
                                    ?
                                SizedBox(
                                    width: WidgetSize(context).widthCommon,
                                    height: WidgetSize(context).height60px,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RippleDecorationButton(
                                          onTap: Get.back,
                                          padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
                                          borderRadius: BorderRadius.circular(999),
                                          color: Colors.transparent,
                                          widget:  !controller.loading.value
                                              ? Center(
                                              child: FaIcon(
                                                FontAwesomeIcons.xmark,
                                                color: Style.yellow,
                                                size: WidgetSize(context).sizedBox34,
                                              )
                                          )
                                              : const SizedBox(),
                                        )
                                      ],
                                    )
                                ) :  SizedBox(height: WidgetSize(context).sizedBox16,),

                                Expanded(
                                  child: GestureDetector(
                                      onDoubleTap: controller.animateResetInitialize,
                                      child: LayoutBuilder(
                                        builder: (BuildContext context, BoxConstraints constraints) {
                                          double expandedWidth = constraints.maxWidth;
                                          double expandedHeight = constraints.maxHeight;
                                          return InteractiveViewer(
                                              transformationController: controller.transformationController,
                                              maxScale: 2.5,
                                              minScale: 0.8,
                                              constrained: true,
                                              child: ClipRRect(
                                                  child: ImageProviderState(
                                                      imageWidth: expandedWidth,
                                                      imageHeight:expandedHeight,
                                                      imageUrl: '${baseUrl ?? ApiConsole.imageBananaUrl}$imageUrl',
                                                      errUrl: AppElement.defaultImg,  aspectRatio: AppElement.caseDialog
                                                  )
                                              )
                                          );
                                        },
                                      )
                                  ),
                                ),
                                SizedBox(
                                  height: WidgetSize(context).sizedBox16,
                                ),
                                !isDownload
                                    ? SizedBox()
                                    :
                                SizedBox(
                                    width: WidgetSize(context).widthCommon,
                                    height: AppElement.defaultBottomPadding,
                                    child:  !controller.loading.value
                                        ? Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RippleDecorationButton(
                                            onTap: () async{
                                              await controller.downloadNetworkImage('${baseUrl ?? ApiConsole.imageBananaUrl}$imageUrl');
                                            },
                                            margin: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
                                            width: WidgetSize(context).widthCommon,
                                            height: WidgetSize(context).height60px,
                                            padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
                                            borderRadius: BorderRadius.circular(999),
                                            color: Style.yellow,
                                            widget: Center(
                                              child:  FaIcon(
                                                FontAwesomeIcons.download,
                                                color: Style.brown,
                                                size: WidgetSize(context).sizedBox24,
                                              ),
                                            )
                                        ),
                                      ],
                                    )

                                        : Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height:WidgetSize(context).height60px,
                                          margin: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
                                          padding: EdgeInsets.all(WidgetSize(context).sizedBox12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(999),
                                              color: Style.yellow
                                          ),
                                          child: Center(
                                              child: Text(controller.progressString.value,
                                                style: TextStyle(
                                                    fontSize: WidgetSize(context).sizedBox18,
                                                    color: Style.brown,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              )

                                          ),
                                        ),
                                      ],
                                    )
                                ),

                              ],
                            ),
                          ),
                        )
                )
        );
      }
    }

    );

  }


}