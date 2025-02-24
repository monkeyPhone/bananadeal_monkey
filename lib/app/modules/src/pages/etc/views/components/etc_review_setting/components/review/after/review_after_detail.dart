import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/controllers/etc_review_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../managers/image/image_dialog_manager.dart';
import '../../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../../routes/const_element.dart';

class ReviewAfterDetail extends StatelessWidget {
  final int index;
  const ReviewAfterDetail({super.key,
  required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EtcReviewSettingController>(
      builder: (controller)=>
          Container(
            width: WidgetSize(context).widthCommon,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(
                    bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD)
                )
            ),
            padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                switch(controller.afterReview[index].ruContent){
                  '' => const SizedBox(),
                  _  =>
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Re.',
                                style: TextStyle(
                                    fontSize: WidgetSize(context).sizedBox16,
                                    fontWeight: FontWeight.w600,
                                    color: Style.blackWrite
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: WidgetSize(context).sizedBox8,
                              ),
                              Expanded(
                                child: Text(controller.afterReview[index].ruContent,
                                  style: TextStyle(
                                      fontSize: WidgetSize(context).sizedBox15,
                                      fontWeight: FontWeight.w400,
                                      color: Style.blackWrite
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                },

                controller.afterReview[index].ruPathImg1 != '' || controller.afterReview[index].ruPathImg2 != '' || controller.afterReview[index].ruPathImg3 != ''
                    ?  Padding(
                  padding: EdgeInsets.only(top:WidgetSize(context).sizedBox16, bottom: WidgetSize(context).sizedBox8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _imageArea(controller.afterReview[index].ruPathImg1, context),
                        _imageArea(controller.afterReview[index].ruPathImg2, context),
                        _imageArea(controller.afterReview[index].ruPathImg3, context,)
                      ],
                    ),
                  ),
                )
                    :  controller.afterReview[index].raAnswer != ''
                    ?  controller.afterReview[index].ruContent != ''
                    ? SizedBox(height: WidgetSize(context).sizedBox12,)
                    :SizedBox()
                    : SizedBox(),
                switch(controller.afterReview[index].raAnswer ){
                  '' => const SizedBox(),
                  _  =>
                      Padding(
                        padding: EdgeInsets.only(
                            top: WidgetSize(context).sizedBox6_5,
                            bottom: WidgetSize(context).sizedBox6_5),
                        child: Container(
                          width: WidgetSize(context).widthCommon,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
                          ),
                          padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('사장님 댓글',
                                style: TextStyle(
                                    fontSize: WidgetSize(context).sizedBox15,
                                    fontWeight: FontWeight.w700,
                                    color: Style.blackWrite
                                ),
                              ),
                              SizedBox(
                                height: WidgetSize(context).sizedBox8,
                              ),
                              Text(controller.afterReview[index].raAnswer,
                                style: TextStyle(
                                    fontSize: WidgetSize(context).sizedBox15,
                                    fontWeight: FontWeight.w400,
                                    color: Style.blackWrite
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      )
                }
              ],
            ),
          )
      // switch(controller.buttonLength[index]){
      //   1 =>
      //       GestureDetector(
      //         onTap: (){
      //           controller.changeValue(index, 0);
      //         },
      //         child: Container(
      //           width: WidgetSize(context).widthCommon,
      //           decoration: BoxDecoration(
      //               color: Colors.grey.shade100,
      //               border: Border(
      //                   bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD)
      //               )
      //           ),
      //           padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox16),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               switch(controller.afterReview[index].ruContent){
      //                 '' => const SizedBox(),
      //                 _  =>
      //                     Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.start,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text('Re.',
      //                               style: TextStyle(
      //                                   fontSize: WidgetSize(context).sizedBox16,
      //                                   fontWeight: FontWeight.w600,
      //                                   color: Style.blackWrite
      //                               ),
      //                               textAlign: TextAlign.start,
      //                             ),
      //                             SizedBox(
      //                               width: WidgetSize(context).sizedBox8,
      //                             ),
      //                             Expanded(
      //                               child: Text(controller.afterReview[index].ruContent,
      //                                 style: TextStyle(
      //                                     fontSize: WidgetSize(context).sizedBox15,
      //                                     fontWeight: FontWeight.w400,
      //                                     color: Style.blackWrite
      //                                 ),
      //                                 textAlign: TextAlign.start,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     )
      //               },
      //
      //               controller.afterReview[index].ruPathImg1 != '' || controller.afterReview[index].ruPathImg2 != '' || controller.afterReview[index].ruPathImg3 != ''
      //                   ?  Padding(
      //                       padding: EdgeInsets.only(top:WidgetSize(context).sizedBox16, bottom: WidgetSize(context).sizedBox8),
      //                       child: SingleChildScrollView(
      //                         scrollDirection: Axis.horizontal,
      //                         child: Row(
      //                           children: [
      //                             _imageArea(controller.afterReview[index].ruPathImg1, context),
      //                             _imageArea(controller.afterReview[index].ruPathImg2, context),
      //                             _imageArea(controller.afterReview[index].ruPathImg3, context,)
      //                           ],
      //                         ),
      //                       ),
      //                      )
      //                   :  controller.afterReview[index].raAnswer != ''
      //                        ?  controller.afterReview[index].ruContent != ''
      //                              ? SizedBox(height: WidgetSize(context).sizedBox12,)
      //                              :SizedBox()
      //                        : SizedBox(),
      //               switch(controller.afterReview[index].raAnswer ){
      //                 '' => const SizedBox(),
      //                 _  =>
      //                     Padding(
      //                       padding: EdgeInsets.only(
      //                           top: WidgetSize(context).sizedBox6_5,
      //                           bottom: WidgetSize(context).sizedBox6_5),
      //                       child: Container(
      //                         width: WidgetSize(context).widthCommon,
      //                         decoration: BoxDecoration(
      //                             color: Colors.grey.shade300,
      //                             borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
      //                         ),
      //                         padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text('사장님 댓글',
      //                               style: TextStyle(
      //                                   fontSize: WidgetSize(context).sizedBox15,
      //                                   fontWeight: FontWeight.w700,
      //                                   color: Style.blackWrite
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               height: WidgetSize(context).sizedBox8,
      //                             ),
      //                             Text(controller.afterReview[index].raAnswer,
      //                               style: TextStyle(
      //                                   fontSize: WidgetSize(context).sizedBox15,
      //                                   fontWeight: FontWeight.w400,
      //                                   color: Style.blackWrite
      //                               ),
      //                               textAlign: TextAlign.start,
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     )
      //               }
      //             ],
      //           ),
      //         ),
      //       ),
      //   _ => RippleDecorationButton(
      //     onTap: (){
      //       controller.changeValue(index, 1);
      //     },
      //       border: Border(
      //           bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD)
      //       ),
      //     color: Colors.grey.shade50,
      //     widget:  SizedBox(
      //       height: WidgetSize(context).sizedBox45,
      //       width: WidgetSize(context).widthCommon,
      //       child: Center(
      //           child: Text('후기 확인')
      //       ),
      //     ),
      //   )
      //
      // },
    );
  }

  Widget _imageArea(String imagePath, BuildContext context) {
    return imagePath == ''
        ?
    SizedBox()
        : GestureDetector(
      onTap: (){
        ImageDialogManager().openImageDownLoad(routerContext: context, imageUrl: imagePath, isDownload: false);
      },
      child: Container(
          margin: EdgeInsets.only(right: WidgetSize(context).sizedBox24),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Style.greyD9D9D9, width: WidgetSize(context).sizedBox1)
          ),
          child: RippleImageButton(image: ImageProviders(
              imageWidth: WidgetSize(context).sizedBox144,
              imageHeight: WidgetSize(context).sizedBox144,
              imageUrl: ApiConsole.imageBananaUrl+imagePath,
              errUrl: AppElement.defaultThumb,
              imageLabel: AppElement.caseReview
          ),
            onTap: (){
              ImageDialogManager().openImageDownLoad(routerContext: context, imageUrl: imagePath, isDownload: false);
            },
          )
      ),
    );

  }

}
