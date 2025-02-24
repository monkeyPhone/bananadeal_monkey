import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'body/etc_some_inquiry.dart';
import 'etc_some_inquiry_controller.dart';

class EtcSomeInQuiryView extends GetView<EtcSomeInquiryController> {
  const EtcSomeInQuiryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvoked: (bool didPop){
        if(didPop){
          return;
        }
        controller.leadingSome();
      },
      child: EtcSomeInquiry(),
    );
  }

}
