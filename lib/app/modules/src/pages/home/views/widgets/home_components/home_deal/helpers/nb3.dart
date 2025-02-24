import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_estimate.dart';
import 'package:banana_deal_by_monkeycompany/app/models/nav/deal/deal_status.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:get/get.dart';
import '../../../../../../../../../app_outs/widgets/neumorphic/flutter_neumorphic.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../src_components/controllers/src_deal_controller.dart';
import '../../../../../../deal/components/estimate/widgets/etimate_detail_dialog.dart';
import 'home_deal_list_text.dart';


class Nb3 extends StatelessWidget {
  const Nb3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        border: NeumorphicBorder( color:Style.yellow, width: WidgetSize(context).sizedBox2),
        shadowLightColor: Style.happy.withValues(alpha: 0.7),
        shadowDarkColor: Style.blackWrite.withValues(alpha: 0.8),
        color: Style.white,
        depth: 2.5,
        intensity: 0.86,
        surfaceIntensity: 0.5,
        shape: NeumorphicShape.flat,
        boxShape:
        NeumorphicBoxShape.roundRect(BorderRadius.circular(WidgetSize(context).sizedBox13)),

      ),
      child: Container(
        color: Style.white,
        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox10),
        child: GetBuilder<SrcDealController>(
          builder: (controller) {
            return GetBuilder<SrcEstimateController>(
              builder: (estController){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: WidgetSize(context).sizedBox18,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.currentDealList.first.diHopePhone == '프리미엄폰' || controller.currentDealList.first.diHopePhone == '보급폰' ||
                            controller.currentDealList.first.diHopePhone == '효도폰' || controller.currentDealList.first.diHopePhone == '공부폰' ||
                            controller.currentDealList.first.diHopePhone == '어린이폰'

                            ? Text('MY 딜 현황  |  추천단말기',
                          style: TextStyle(
                              fontSize: WidgetSize(context).sizedBox16,
                              fontWeight: FontWeight.w700,
                              color: Style.red
                          ),
                        )
                            : Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('MY 딜 현황  |  ',
                                style: TextStyle(
                                    fontSize: WidgetSize(context).sizedBox16,
                                    fontWeight: FontWeight.w700,
                                    color: Style.red
                                ),
                              ),
                              SizedBox(height: WidgetSize(context).sizedBox5,),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  controller.currentDealList.first.diHopePhone,
                                  style: TextStyle(
                                      fontSize: WidgetSize(context).sizedBox16,
                                      fontWeight: FontWeight.w700,
                                      color: Style.red
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: WidgetSize(context).sizedBox10,
                        ),
                        RippleDecorationButton(
                            onTap: (){
                              int index =
                              estController.estimateSort.value == 0
                                  ? 1
                                  : 0;
                              estController.sortEstimateList(index);
                            },
                            color: Style.yellow,
                            borderRadius: BorderRadius.circular(999),
                            width: WidgetSize(context).sizedBox128,
                            height: WidgetSize(context).sizedBox37,
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.swap_horiz, color: Style.brown, size: WidgetSize(context).sizedBox20,),
                                SizedBox(width: WidgetSize(context).sizedBox5,),
                                Text(
                                  estController.estimateSort.value == 0
                                      ? '납부요금 기준'
                                      : '할부원금 기준',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.brown,
                                    fontSize: WidgetSize(context).sizedBox14,
                                  ),),
                              ],
                            )
                        )
                      ],
                    ),
                    SizedBox(height: WidgetSize(context).sizedBox15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Style.white,
                            padding:
                            EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox3),
                            child: _Common(
                              currentDeal: controller.currentDealList.first,
                              estimateList: switch(estController.estimateSort.value){
                                0 => estController.estimate0,
                                _ => estController.estimate1
                              },
                              caseRoute: estController.estimateSort.value,
                            )
                        ),
                        _Button(
                          currentDeal: controller.currentDealList.first,
                        )
                      ],
                    ),

                  ],
                );
              },
            );
          }
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final DealStatusList currentDeal;
  const _Button({
    required this.currentDeal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: WidgetSize(context).sizedBox6,
          bottom: WidgetSize(context).sizedBox10
      ),
      child: RippleDecorationButton(
        onTap: (){
          DealController.to.gotoEstimateView(currentDeal, 0);
        },
        padding: EdgeInsets.symmetric(
            vertical: WidgetSize(context).sizedBox2,
            horizontal: WidgetSize(context).sizedBox3
        ),
        widget: Text(
          '전체 견적 보기',
          style: TextStyle(
              color: Style.greyTextButton,
              fontWeight: FontWeight.w700,
              fontSize: WidgetSize(context).sizedBox14),
        ),
      ),
    );
  }
}



class _Common extends StatelessWidget {
  final DealStatusList currentDeal;
  final List<DealEstimateList> estimateList;
  final int caseRoute;
  const _Common({
    required this.currentDeal,
    required this.estimateList,
    required this.caseRoute
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          estimateList.where((p0) => p0.dStatus== 'ACCEPT' || p0.dStatus == 'PARTICIPATE').isEmpty
              ? 1
              :  estimateList.length > 5
              ? 5  + estimateList.where((p0) => p0.dStatus != 'ACCEPT' && p0.dStatus != 'PARTICIPATE').length
              :  estimateList.length,
              (index) =>
              estimateList.where((p0) => p0.dStatus== 'ACCEPT' || p0.dStatus == 'PARTICIPATE').isEmpty
              ?  Padding(
            padding: EdgeInsets.only(
                bottom: WidgetSize(context).sizedBox10
            ),
            child: Material(
              color: Style.white,
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: WidgetSize(context).sizedBox12,
                      vertical: WidgetSize(context).sizedBox5
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color:Style.yellow,
                        width: WidgetSize(context).sizedBox2
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(WidgetSize(context).sizedBox24),
                      bottomLeft: Radius.circular(WidgetSize(context).sizedBox24),
                    ),
                  ),
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox5),
                    constraints: BoxConstraints(
                        minHeight: WidgetSize(context).sizedBox6_5,
                        maxHeight: double.infinity,
                        minWidth: WidgetSize(context).widthCommon,
                        maxWidth: WidgetSize(context).widthCommon
                    ),
                    child:  Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox7_5),
                        child: Text('새로운 견적을 기다리고 있어요.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Style.brown,
                              fontSize: WidgetSize(context).sizedBox16,
                            )
                        ),
                      ),
                    ),
                  )
              ),
            ),
          )
              :
              estimateList[index].dStatus == 'ACCEPT' || estimateList[index].dStatus == 'PARTICIPATE'
              ? Padding(
            padding: EdgeInsets.only(
                bottom: WidgetSize(context).sizedBox10
            ),
            child: Material(
              color: Style.white,
              child: InkWell(
                onTap: (){
                  if(estimateList.isNotEmpty){
                    OpenDialog.openDialog(
                      currentDeal: currentDeal,
                        routerContext: context,
                        estimate: estimateList[index], confirm:  estimateList.where((p0) => p0.dStatus == 'ACCEPT').isNotEmpty);
                  }
                },
                highlightColor: Style.yellowCheck.withValues(alpha: 0.5),
                splashColor: Style.yellowCheck,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(WidgetSize(context).sizedBox24),
                  bottomLeft: Radius.circular(WidgetSize(context).sizedBox24),
                ),
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: WidgetSize(context).sizedBox12,
                        vertical: WidgetSize(context).sizedBox5
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color:Style.yellow, width: WidgetSize(context).sizedBox2),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(WidgetSize(context).sizedBox24),
                        bottomLeft: Radius.circular(WidgetSize(context).sizedBox24),
                      ),
                    ),
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox5),
                      constraints: BoxConstraints(
                          minHeight: WidgetSize(context).sizedBox6_5,
                          maxHeight: double.infinity,
                          minWidth: WidgetSize(context).sizedBox37,
                          maxWidth: WidgetSize(context).widthCommon
                      ),
                      child:
                      HomeDealListText(
                        estimate: estimateList[index],
                        caseRoute: caseRoute,
                      ),
                    )


                  // RippleButton(
                  //   onTap: (){
                  //     if(controller.currentEstimate.isNotEmpty){
                  //       OpenDialog.openDialog(estimate: controller.currentEstimate[index], confirm:  controller.currentEstimate.where((p0) => p0.dStatus == 'ACCEPT').isNotEmpty);
                  //      }
                  //     },
                  //   color: Style.white,
                  //    widget: ,
                  //
                  //
                  //   )


                  // GestureDetector(
                  //   onTap: (){
                  //     if(controller.currentEstimate.isNotEmpty){
                  //      OpenDialog.openDialog(estimate: controller.currentEstimate[index], confirm:  controller.currentEstimate.where((p0) => p0.dStatus == 'ACCEPT').isNotEmpty);
                  //     }
                  //
                  //   },
                  //   child: Container(
                  //     color: Style.white,
                  //     padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox5),
                  //     constraints: BoxConstraints(
                  //         minHeight: WidgetSize(context).sizedBox6_5,
                  //         maxHeight: double.infinity,
                  //         minWidth: WidgetSize(context).sizedBox37,
                  //         maxWidth: Get.width
                  //     ),
                  //     child:
                  //     HomeDealListText(
                  //       estimate: controller.currentEstimate[index],
                  //       caseRoute: controller.estimateCurrentSort.value,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            )
            ,
          )
              : SizedBox()
      ).toList(),
    );
  }
}
