import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/upload/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';

class PreviewHeader extends GetView<UploadController> {
  const PreviewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox15, vertical: WidgetSize(context).sizedBox10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(WidgetSize(context).sizedBox20),
                      topRight: Radius.circular(WidgetSize(context).sizedBox20)),
                ),
                isScrollControlled: true,
                builder: (_) => SafeArea(
                  child: SizedBox(
                    height: WidgetSize(context).height05,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: WidgetSize(context).sizedBox20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox10),
                                color: Colors.black54,
                              ),
                              width: WidgetSize(context).sizedBox32,
                              height: WidgetSize(context).sizedBox5,
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              controller: controller.preViewController,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: List.generate(
                                  controller.albums.length,
                                      (index) =>
                                      GestureDetector(
                                        onTap: () async{
                                          controller.initAlbums();
                                          await controller
                                              .changeAlbum(controller.albums[index]);
                                          controller.currentAlbums.value = controller.albums[index];
                                          Get.back();
                                        },
                                        child: Container(
                                          color: Style.white,
                                          padding: EdgeInsets.symmetric(
                                              vertical: WidgetSize(context).sizedBox24, horizontal: WidgetSize(context).sizedBox20),
                                          child: Text(
                                            controller.albums[index].name,
                                            style: TextStyle(
                                              fontSize: WidgetSize(context).sizedBox16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
              child: ObxValue(
                      (size)=> size.value == ''
                      ? Row(
                    children: [
                      ObxValue(
                              (text) => Text(
                            text.value,
                            style: TextStyle(
                              color: Style.blackWrite,
                              fontSize: WidgetSize(context).sizedBox16,
                            ),
                          ), controller.headerTitle
                      ),
                      Icon(Icons.arrow_drop_down, color: Style.blackWrite, size: WidgetSize(context).sizedBox24,),
                    ],
                  ) : ObxValue((can) => can.value
                      ? Text('파일 용량 (${controller.imageSize} MB)',
                    style:  TextStyle(
                      color: Style.blackWrite,
                      fontSize: WidgetSize(context).sizedBox16,
                    ),
                  )
                      : Text('용량 초과 (${controller.imageSize} MB)',
                    style:  TextStyle(
                      color: Style.red,
                      fontSize: WidgetSize(context).sizedBox16,
                    ),
                  )
                      , controller.canUpload)
                  ,controller.imageSize),
            ),
          ),
          Row(
            children: [
              ObxValue((crop) =>
              crop.value != ''
                  ?
              GestureDetector(
                  onTap: (){
                    controller.openDialog(
                       image:  Image.file(File(controller.croppedFilePath.value), fit: BoxFit.fitWidth,),
                      context: context
                    );
                  },
                  child: Text('미리보기', style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox16,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue
                  ),))
                  :
              ObxValue(
                      (can) => can.value
                  ? SizedBox()
                  : ObxValue((size) => size.value == '' ? SizedBox() : TextButton(
                          onPressed: (){
                            controller.initCrop();
                          }, child: Text('초기화', style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue
                      ),)), controller.imageSize)
                  , controller.canUpload)
                  , controller.croppedFilePath),
              SizedBox(width: WidgetSize(context).sizedBox8),
            ],
          ),
        ],
      ),
    );
  }
}


