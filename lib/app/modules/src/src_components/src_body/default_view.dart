import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/image_provider/asset_image_box.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../../../../routes/const_element.dart';
import '../../pages/etc/controllers/etc_controller.dart';
import '../controllers/src_info_controller.dart';

class DefaultSrcView extends GetView<SrcInfoController> {
  const DefaultSrcView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageBox(imageHeight: WidgetSize(context).sizedBox120, imageWidth: WidgetSize(context).sizedBox148, imageUrl: AppElement.defaultList),
        SizedBox(height: WidgetSize(context).height60px,),
        _pauseRow(text1: '닉네임: ', text2: controller.infoM.value.mName, context: context),
        _pauseRow(text1: '정지상태: ', text2: controller.infoM.value.mIsUsed, color: Colors.red, context: context),
        _pauseRow(text1: '정지사유: ', text2: controller.infoM.value.mPauseReason, context: context),
        _pauseRow(text1: '정지기간: ', text2:  '${SrcInfoController.to.infoM.value.mPauseDuration}', context: context),
        SizedBox(
          height: WidgetSize(context).sizedBox20,
        ),
        RippleDecorationButton(
            onTap: () async{
              await EtcController.to.etcBanCall();
            },
            padding: EdgeInsets.all(WidgetSize(context).sizedBox10),
            widget:Text('새로고침', style: TextStyle(fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox20, color: Colors.blue),)
        ),
      ],
    );
  }

  Widget _pauseRow({required String text1, required String text2, Color? color, required BuildContext context}){
    return Column(
      children: [
        SizedBox(
          height: WidgetSize(context).sizedBox16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1, style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox22, color: Style.blackWrite),),
            Text(text2, style: TextStyle(fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox22, color: color ?? Style.blackWrite),)
          ],
        ),
      ],
    );
  }

}



