import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../css/size.dart';
import '../../../change_map_controller.dart';

class ChangeMapResizedBox extends StatelessWidget {
  final BuildContext mediaContext;
  const ChangeMapResizedBox({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeMapController>(
      builder: (controller){
        return  SizedBox(height:
        controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == ''
            ?  (MediaQuery.of(mediaContext).viewInsets.bottom > 0 && MediaQuery.of(mediaContext).viewInsets.bottom >  WidgetSize(context).height041) || controller.extend.value
                  ?  0
                  : WidgetSize(context).sizedBox28
            : 0,
        );
      },
    );


     ;
  }
}
