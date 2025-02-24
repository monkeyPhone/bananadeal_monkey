import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/result_area_components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../change_map_controller.dart';


class FailSearch extends StatelessWidget {
  const FailSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: WidgetSize(context).widthCommon,
          child: GetBuilder<ChangeMapController>(
            builder: (controller){
              return Column(
                children: [
                  controller.addressInfo.value.results.common.errorMessage != ''
                      ?
                  Column(
                    children: const [
                      RoadTextBold( text: '앗, 검색 결과가 없어요!',),
                      RoadTextBold( text: '이렇게 검색해보세요',),
                    ],
                  )
                      :
                  controller.notice.value != ''
                      ?
                  Column(
                    children: [
                      RoadTextBold( text: controller.notice.value,),
                    ],
                  )
                      :
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: WidgetSize(context).sizedBox30, color: Style.yellow,),
                          SizedBox(width: WidgetSize(context).sizedBox8,),
                          const RoadTextBold( text: '버튼을 눌러',),
                        ],
                      ),
                      SizedBox(height: WidgetSize(context).sizedBox2,),
                      const RoadTextBold( text: '검색을 진행해보세요',),
                    ],
                  ),
                  SizedBox(height: WidgetSize(context).sizedBox17,),
                  const RoadTextBrown(text: '도로명 + 건물주소'),
                  const RoadTextBrown(text: '지역명(동/리) + 건물명'),
                  const RoadTextBrown(text: '지역명(동/리) + 번지'),
                  SizedBox(height: WidgetSize(context).sizedBox20,),
                  const RoadTextGrey14(text: '예) 세종대로 209, 세종로 77-6, 용산 한성아파트',)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
