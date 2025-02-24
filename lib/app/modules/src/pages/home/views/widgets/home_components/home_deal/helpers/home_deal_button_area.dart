import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../src_components/controllers/src_deal_controller.dart';
import '../../../../../../../src_components/controllers/src_route_controller.dart';
import 'nb1.dart';
import 'nb3.dart';

class HomeDealButtonArea extends StatelessWidget {
  const HomeDealButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // SizedBox();


      GetBuilder<SrcDealController>(
        builder: (srcD) {
          return GetBuilder<SrcEstimateController>(
              builder: (srcE){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16, vertical: WidgetSize(context).sizedBox24),
                  child: srcD.currentDealList.isEmpty
                      ? Nb1(onPressed: () async{
                          await SrcRouteController.to.makeDeal(
                        context: context,
                        invite: ''
                    );})
                      :
                  srcD.dealStatusNumber >= 500
                      ?
                  Nb0(casew: '1',)
                      :
                  srcE.estimateSort.value == 2
                      ?
                  Nb0(casew: '2',)
                      :
                  srcE.estimate0.isNotEmpty && srcD.currentDealList.isNotEmpty && srcD.currentDealList.first.diEstimateCnt != 0
                      ?
                        srcE.isError.value
                            ?  Nb0(casew: '3',)
                            : Nb3()
                      :
                  srcD.currentDealList.isNotEmpty && srcD.currentDealList.first.diEstimateCnt == 0
                      ?
                   Nb2(isCntZero: srcD.inviteCnt.value == 0,)
                      :
                  Nb1(
                      onPressed: () async{
                        await SrcRouteController.to.makeDeal(context: context, invite: '');
                      }
                  ),
                );
              }
          );
        }
    );
  }
}
