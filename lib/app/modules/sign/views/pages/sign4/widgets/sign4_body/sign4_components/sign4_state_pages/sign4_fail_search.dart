import 'package:flutter/material.dart';

import '../../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class Sign4FailSearch extends StatelessWidget {
  final String errorMessage;
  const Sign4FailSearch({
    required this.errorMessage,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: WidgetSize(context).widthCommon,
          child: Column(
            children: [
              errorMessage != ''
                  ? Column(
                      children: [
                        RoadSearchTextResultBold(text: '앗, 검색 결과가 없어요!'),
                        RoadSearchTextResultBold(text: '이렇게 검색해보세요'),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search, size: WidgetSize(context).sizedBox30, color: Style.yellow,),
                            SizedBox(width: WidgetSize(context).sizedBox8,),
                            RoadSearchTextResultBold(text: '버튼을 눌러'),
                          ],
                        ),
                        SizedBox(height: WidgetSize(context).sizedBox2,),
                        RoadSearchTextResultBold(text: '검색을 진행해보세요'),
                      ],
                    ),
              SizedBox(height: WidgetSize(context).sizedBox17,),
              RoadSearchTextBrown(text: '도로명 + 건물주소'),
              RoadSearchTextBrown(text: '지역명(동/리) + 건물명'),
              RoadSearchTextBrown(text: '지역명(동/리) + 번지'),
              SizedBox(height: WidgetSize(context).sizedBox20,),
              RoadTextGrey14Px(text: '예) 세종대로 209, 세종로 77-6, 용산 한성아파트'),
            ],
          ),
        ),
      ),
    );
  }
}
