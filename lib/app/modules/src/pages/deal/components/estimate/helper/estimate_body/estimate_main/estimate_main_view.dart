import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/stack/estimate_main_desuggestion.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/stack/estimate_main_detail_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/stack/estimate_main_distance.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/stack/estimate_main_info_row/estimate_main_info_row.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/stack/estimate_main_info_row2/estimate_main_info_row2.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/helper/estimate_body/estimate_main/stack/estimate_main_storename.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/nav/deal/deal_estimate.dart';

class EstimateMainView extends StatelessWidget {
  final List<DealEstimateList> selectEstimate;
  final int selectEstimateLength;
  final int currentSort;
  final ScrollController scrollController;
  final bool isUpdate;
  const EstimateMainView({
    required this.selectEstimate,
    required this.selectEstimateLength,
    required this.currentSort,
    required this.isUpdate,
    required this.scrollController,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        itemCount: selectEstimateLength,
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox10),
            width: WidgetSize(context).widthCommon,
            height: WidgetSize(context).sizedBox134,
            decoration: BoxDecoration(
                color:  selectEstimate[index].dStatus == 'PARTICIPATE' || selectEstimate[index].dStatus == 'OPEN' || selectEstimate[index].dStatus == 'ACCEPT'
                    ? Style.white
                    : Colors.grey.shade300,
                border: Border(
                    bottom: BorderSide(
                        width: WidgetSize(context).sizedBox1,
                        color: Style.greyD7D7D7
                    )
                )
            ),
            child: Stack(
              children: [
                // Positioned(
                //     right: 0,
                //     child: EstimateMainStamp(
                //       selectEstimate: selectEstimate[index],
                //     )
                // ),
                Padding(
                  padding: WidgetSize(context).paddingBodyWhole,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: EstimateMainStorename(
                              selectEstimate: selectEstimate[index],
                            ),
                          ),
                          SizedBox(
                            width: WidgetSize(context).sizedBox5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox3),
                              color: Style.greyAAAAAA,
                            ),
                            padding: EdgeInsets.all(WidgetSize(context).sizedBox2),
                            child: EstimateMainDistance(
                              selectEstimate: selectEstimate[index],
                            ),
                          )
                        ],
                      ),
                      EstimateMainInfoRow(
                        selectEstimate: selectEstimate[index],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          EstimateMainInfoRow2(
                            selectEstimate: selectEstimate[index],
                              currentSort: currentSort
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox8),
                        height: WidgetSize(context).sizedBox28,
                        width: WidgetSize(context).sizedBox100*3,
                        color: Style.greyEAEAEA,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EstimateMainDesuggestion(selectEstimate: selectEstimate[index]),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: WidgetSize(context).sizedBox10_5,
                  bottom: 0,
                  child:  EstimateMainDetailButton(
                    selectEstimate: selectEstimate[index],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
