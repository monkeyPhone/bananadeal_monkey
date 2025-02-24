import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/store/store_list_info.dart';

class StoreProfileCardParticipate extends StatelessWidget {
  final List<Sinfo> store;
  final int index;
  final int rong;
  const StoreProfileCardParticipate({
    required this.store,
    required this.index,
    required this.rong,
    super.key});

  @override
  Widget build(BuildContext context) {
    return rong == 0 || rong == 1
        ?
    Text(
      '${(double.parse(store[index].participation)*100).ceil()}%'
      ,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: WidgetSize(context).sizedBox12,
          color: Style.greyTextButton
      ),
    )
        :
    const SizedBox();
  }
}
