import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/range_change_view/range_address_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/range_change_view/range_scroll_list.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/range_change_view/range_title_container.dart';
import 'package:flutter/material.dart';


class RangeChageView extends StatelessWidget {
  const RangeChageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeTitleContainer(text: '선택된 주소'),
        RangeAddressArea(),
        RangeTitleContainer(text: '매장 검색 범위'),
        Expanded(
          child: RangeScrollList()
        )

      ],
    );
  }


}



