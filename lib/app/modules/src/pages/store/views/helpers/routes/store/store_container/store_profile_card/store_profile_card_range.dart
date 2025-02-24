import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/store/store_list_info.dart';



class StoreProfileCardRange extends StatelessWidget {
  final List<Sinfo> store;
  final int index;
  const StoreProfileCardRange({
    required this.store,
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox2_5, vertical: WidgetSize(context).sizedBox1_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox6_5),
          color: Style.ultimateGrey,
        ),
        child: Text(
          store[index].smRange < 1.0
              ?
          '${(store[index].smRange*1000).roundToDouble().toInt()}m'
              :
          '${(store[index].smRange).toStringAsFixed(1)}km',
          style: TextStyle(
            fontSize: WidgetSize(context).sizedBox14,
            fontWeight: FontWeight.w400,
            color: Style.white,
          ),
        )


    );
  }
}
