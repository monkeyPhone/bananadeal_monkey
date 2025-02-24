import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_4_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'active_address_list.dart';

class Sign4AddressList extends StatelessWidget {
  const Sign4AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SignView4Controller>(
      builder: (controller){
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                  controller.addressInfo.value.results.juso.length,
                      (index) => ActiveAddressList(
                    jibun: controller.addressInfo.value.results.juso[index].jibunAddr,
                    road: controller.addressInfo.value.results.juso[index].roadAddr,
                    onTap: () async{
                      if(!controller.dialogState.value){
                        controller.dialogState.value = true;
                        await controller.makePlaceMarks(
                          controller.addressInfo.value.results.juso[index].roadAddrPart1,
                          controller.addressInfo.value.results.juso[index].engAddr,
                          controller.addressInfo.value.results.juso[index].jibunAddr,
                          index,
                        );
                      }
                    },
                  )
              )
            ]
        );
      },
    );
  }
}
