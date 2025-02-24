import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/result_area_components/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../../css/size.dart';

class ChangeDefaultView extends StatelessWidget {
  const ChangeDefaultView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: WidgetSize(context).widthCommon,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RoadTextBold(text: '이렇게 검색해보세요'),
            SizedBox(height: WidgetSize(context).sizedBox17,),
            const RoadTextBrown(text: '도로명 + 건물주소'),
            const RoadTextBrown(text: '지역명(동/리) + 건물명'),
            const RoadTextBrown(text: '지역명(동/리) + 번지'),
            SizedBox(height: WidgetSize(context).sizedBox20,),
            const RoadTextGrey14(text: '예) 세종대로 209, 세종로 77-6, 용산 한성아파트'),

          ],
        ),
      ),
    );
  }
}
