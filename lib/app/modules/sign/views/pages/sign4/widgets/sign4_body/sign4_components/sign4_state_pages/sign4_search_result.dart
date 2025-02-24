import 'package:banana_deal_by_monkeycompany/app/modules/sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_state_pages/sign4_state_page_widget/sign4_adress_list.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../components/text_class/text_class.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class Sign4SearchResult extends StatelessWidget {
  final String addressInput;
  final String totalCount;
  final int jusoLength;

  const Sign4SearchResult({
    required this.addressInput,
    required this.totalCount,
    required this.jusoLength,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RoadSearchTextResultBold(text: "'$addressInput'"),
            RoadSearchTextResultBold(text: " 검색 결과"),
            Text(
              "  ( $totalCount개 )",
              style: TextStyle(
                fontSize: WidgetSize(context).sizedBox16,
                color: Style.blackWrite,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(height: WidgetSize(context).sizedBox5,),
        Expanded(
          child:
          SingleChildScrollView(
            child: Sign4AddressList(),
          ),
        ),
      ],
    );
  }



}
