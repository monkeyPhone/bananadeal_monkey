import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_4_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';

class Sign4BottomNavColumn extends StatelessWidget {
  const Sign4BottomNavColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignView4Controller>(
      builder: (controller){
        return Column(
          mainAxisAlignment:
          controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == ''
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(controller.addressInfo.value.results.juso.isEmpty && controller.res.value == '')
              const SizedBox(),
            if(controller.addressInfo.value.results.juso.isNotEmpty && controller.res.value == '' && controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == '')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () async{
                        await controller.countMinus(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: WidgetSize(context).sizedBox25,
                        color: controller.currentPage.value == 1
                            ? Style.greyButtonDisable
                            : Style.brown,
                      )
                  ),
                  Row(
                    children: [
                      Text('${controller.currentPage.value.toString()} ',
                        style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox20,
                          color: controller.currentPage.value == (int.parse(controller.addressInfo.value.results.common.totalCount)/20).ceil()
                              ? Style.brown
                              : Style.greyWrite,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '  /   ${(int.parse(controller.addressInfo.value.results.common.totalCount)/20).ceil()}',
                        style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox20,
                          color: Style.brown,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () async{
                        await controller.countPlus(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: WidgetSize(context).sizedBox25,
                        color: controller.currentPage.value >= int.parse(controller.addressInfo.value.results.common.totalCount)/20
                            ? Style.greyButtonDisable
                            : Style.brown,
                      )
                  )
                ],
              ),
            controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == ''
                ? SizedBox()
                : NeumorphicButtons(text: '다음', onPressed: (){controller.nextPage();})
          ],
        );
      },
    );
  }
}
