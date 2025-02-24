import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../css/size.dart';
import '../../../../../../css/style.dart';
import '../../../../styles/image_data.dart';
import '../upload_controller.dart';

class UploadAppBar extends StatelessWidget {
  final String router;
  const UploadAppBar({
    required this.router,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<UploadController>(
      builder: (ucC) {
        ucC.uploadRoute.value = router;
        return ucC.permissionState == 'limited'
          ?  ucC.uploaded.value == ''
                ? BasicAppbar(
                    leading: (){
                      Get.back();
                    },
                    title: Text(
                      '이미지 업로드',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: WidgetSize(context).sizedBox24,
                        color: Colors.black,
                      ),
                    ),
                    actions: Row(
                      children: [
                        ucC.sizeError.value != ''
                          ? SizedBox()
                          : ucC.croppedFilePath.value == ''
                              ? Row(
                                children: [
                                  _ImageButton(
                                     onTap: () async{
                                       await ucC.getLimitedImage();
                                      },
                                    padding: WidgetSize(context).sizedBox5,
                                    child: Icon(Icons.add_a_photo, color: Colors.blue,),
                                   )
                                  ],
                                )
                            : const SizedBox(),
                        ucC.sizeError.value == ''
                            ? SizedBox()
                            : ucC.croppedFilePath.value == ''
                                  ? _ImageButton(
                                      onTap: () async{
                                        await ucC.cropImage(router.contains('chat') ? 'chat' : router.contains('sign') || router.contains('etc') ? 'profile' : 'etc', context);
                                      },
                                      padding: WidgetSize(context).sizedBox30,
                                      child: Image.asset(AppElement.checkImage, color: Style.yellow,),
                                    )

                                  : _ImageButton(
                                      onTap: () {
                                        ucC.initCrop();
                                        },
                                      padding: WidgetSize(context).sizedBox6_5,
                                      child: ImageData3(AppElement.iconTrashOff, color: Colors.red,
                                          ),
                                      )

                        ],
                      ),
                    )

             :  const _EndWidgets()

          : ucC.uploaded.value == ''
              ? BasicAppbar(
                  title: Text(
                    '이미지 업로드',
                    style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: WidgetSize(context).sizedBox24,
                    color: Colors.black,
                    ),
                  ),
        actions: ucC.sizeError.value == ''
            ? SizedBox()
            : ucC.croppedFilePath.value == ''
            ?
        _ImageButton(
          onTap: () async{
            await ucC.cropImage(router.contains('chat') ? 'chat' : router.contains('sign') || router.contains('etc') ? 'profile' : 'etc', context);
          },
          padding: WidgetSize(context).sizedBox30,
          child: Image.asset(AppElement.checkImage),
        )

            : _ImageButton(
          onTap: () {
            ucC.initCrop();},
          padding: WidgetSize(context).sizedBox6_5,
          child: ImageData3(AppElement.iconTrashOff, color: Colors.red,),
              ),
      )

          : const _EndWidgets();
      },
    );
  }
}


class _ImageButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;
  final double padding;
  const _ImageButton({
    required this.onTap,
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: WidgetSize(context).sizedBox48,
          width: WidgetSize(context).sizedBox48,
          child: FittedBox(
              child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: child
              )
          )
      ),
    );
  }
}


class _EndWidgets extends StatelessWidget {
  const _EndWidgets();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).height60px,
      width: WidgetSize(context).widthCommon,
      child: Padding(
        padding: WidgetSize(context).paddingBodyWhole,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '잠시만 기다려주세요.',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: WidgetSize(context).sizedBox22,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


