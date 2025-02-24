import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../../../css/size.dart';

class DetailSelectColor extends GetView<SearchPhoneDetailController> {
  final String piColorHax;
  final int index;
  const DetailSelectColor({
    required this.piColorHax,
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButtons2(
      borderRadius: WidgetSize(context).widthCommon,
      depth: WidgetSize(context).sizedBox2_5,
      boxColor: Color(
          piColorHax.contains('#')
              ? int.parse(piColorHax.replaceFirst(RegExp(r'#'), '0xFF'))
              : int.parse('0xFF${piColorHax}')
      ),
      text: '',
      onPressed: (){
        controller.clickColor(index);
      },
      width: WidgetSize(context).etc0135,
      height: WidgetSize(context).etc01325,
    );
  }
}
