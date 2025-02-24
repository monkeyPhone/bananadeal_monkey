import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_inquiry/inquiry_send/inquiry_send_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';

class InquirySendBodyButtonArea extends GetView<InquirySendController> {
  const InquirySendBodyButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: WidgetSize(context).sizedBox16
      ),
      child: Card(
        elevation: WidgetSize(context).sizedBox1,
        child: RippleDecorationButton(
          onTap: (){
            controller.moveToQuestion();
          },
          padding: EdgeInsets.only(
              left: WidgetSize(context).sizedBox12,
              right: WidgetSize(context).sizedBox8
          ),
          color: Style.greyF4F4F4,
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).sizedBox75,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: WidgetSize(context).sizedBox8,
                    ),
                    Text('잠깐!', style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox18, color: Style.blackWrite),),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text:
                              '문의를 작성하기 전에 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: WidgetSize(context).sizedBox16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '자주하는 질문',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Style.red,
                                    fontSize: WidgetSize(context).sizedBox16,
                                  ),
                                ),
                                TextSpan(
                                  text: '도 확인해보세요!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: WidgetSize(context).sizedBox16,
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: WidgetSize(context).sizedBox8,
              ),
              Icon(Icons.arrow_forward_ios, color: Style.grey999999, size: WidgetSize(context).sizedBox22,)
            ],
          ),
        ),
      ),
    );
  }
}
