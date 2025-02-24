import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_rateplan_controllers/search_rateplan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../components/widget_components/ripple_button/ripple_button.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/deal/phone_rate_plan.dart';
import '../../../../../../components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'rate_list_icon_text.dart';

class RateListWidget extends GetView<SearchRateplanController> {
  final List<RateList> rateList;
  const RateListWidget({
    super.key,
    required this.rateList,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: controller.firstController,
      child: ListView.builder(
          itemCount:
          rateList.length,
          controller: controller.firstController,
          itemBuilder: (BuildContext context, int index) {
            return
              RippleDecorationButton(
                  onTap: (){
                    if(MediaQuery.of(context).viewInsets.bottom == 0)
                    {
                      Future.delayed(Duration.zero, (){
                        showDialog<String>(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                Dialog(
                                  backgroundColor: Style.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox8))
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
                                    child: SizedBox(
                                      height: WidgetSize(context).textFromWidth,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                flex: 8,
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  color: Style.white,
                                                  padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).width007),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        '선택한 요금제가 맞으신가요?',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: WidgetSize(context).sizedBox20
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      SizedBox(height: WidgetSize(context).sizedBox16,),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox8),
                                                        child: Text(
                                                          "'${
                                                              rateList[index].pPlanName
                                                          }'",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: WidgetSize(context).sizedBox24
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ),
                                            Flexible(
                                              fit: FlexFit.tight,
                                              flex: 3,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: RippleDecorationButton(
                                                        onTap: (){
                                                          Get.back();
                                                        },
                                                        margin: EdgeInsets.all(WidgetSize(context).width0021),
                                                        borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
                                                        border: Border.all(width: WidgetSize(context).width0007, color: Style.yellow),
                                                        widget: Center(
                                                            child: Text('취소하기',
                                                              style: TextStyle(
                                                                  color: Style.ultimateGrey,
                                                                  fontSize: WidgetSize(context).width0045,
                                                                  fontWeight: FontWeight.w700
                                                              ),
                                                            )
                                                        ),
                                                      )
                                                  ),
                                                  Expanded(
                                                      child:

                                                      RippleDecorationButtonColors(
                                                          onTap: (){
                                                            if(Get.isSnackbarOpen){
                                                              Get.back();
                                                            } else{
                                                              MakeDealController.to.clickRatePlanConfirm(
                                                                  ratePlan: rateList[index].pPlanName.toString(),
                                                                  ratePlanIdx: rateList[index].pIdx.toString()
                                                              );
                                                              Get.back();
                                                              Get.back();
                                                            }
                                                          },
                                                          margin: EdgeInsets.all(WidgetSize(context).width0021),
                                                          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
                                                          widget: Center(
                                                              child: Text('선택하기',
                                                                style: TextStyle(
                                                                    color: Style.brown,
                                                                    fontSize: WidgetSize(context).sizedBox20,
                                                                    fontWeight: FontWeight.w700
                                                                ),
                                                              )
                                                          )
                                                      )
                                                  ),
                                                ],
                                              ),

                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                        );
                      });
                    }
                    else{
                      FocusScope.of(context).unfocus();
                    }
                  },
                  padding: WidgetSize(context).paddingBodyWhole,
                  border: Border(
                      bottom: BorderSide(
                          width: WidgetSize(context).width00025,
                          color: Style.greyD7D7D7)
                  ),
                  unique: UniqueKey(),
                  width: WidgetSize(context).widthCommon,
                  height: WidgetSize(context).sizedBox77,
                  widget: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: WidgetSize(context).sizedBox136,
                          child: RichText(
                            overflow:
                            TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text:  '${rateList[index].pPlanName}',
                              style: TextStyle(
                                fontWeight:
                                FontWeight.w700,
                                color: Style.blackWrite,
                                fontSize: WidgetSize(context).sizedBox14,
                              ),
                            ),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RateListIconText(
                              icon: Icons.phone_outlined,
                              iconSize: WidgetSize(context).sizedBox16,
                              text: rateList[index].pTel.toString(),
                              textSize:  WidgetSize(context).sizedBox14,
                              fontWeight:  FontWeight.w400
                          ),
                          RateListIconText(
                              icon: Icons.mail_outline,
                              iconSize: WidgetSize(context).sizedBox16,
                              text: rateList[index].pSms.toString(),
                              textSize:  WidgetSize(context).sizedBox14,
                              fontWeight:  FontWeight.w400
                          ),
                          RateListIconText(
                              icon: Icons.signal_cellular_alt,
                              iconSize: WidgetSize(context).sizedBox16,
                              text: rateList[index].pLte.toString(),
                              textSize:  WidgetSize(context).sizedBox14,
                              fontWeight:  FontWeight.w400
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${NumberFormat('###,###').format(int.parse(
                                (rateList[index].pPlanPrice).toString()
                            ))}원',
                            style: TextStyle(
                                fontSize: WidgetSize(context).sizedBox14,
                                fontWeight:
                                FontWeight.w400),
                          ),
                          SizedBox(
                            width: WidgetSize(context).width004,
                          ),
                          RippleDecorationButton(
                              onTap: (){
                                if(MediaQuery.of(context).viewInsets.bottom == 0)
                                {
                                  controller.rateDialog(
                                      context: context,
                                      rate: rateList[index]);
                                }
                                else{
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              color: Style.yellow,
                              borderRadius: BorderRadius.circular(999),
                              padding: EdgeInsets.symmetric(
                                  horizontal: WidgetSize(context).width003,
                                  vertical:WidgetSize(context).width0017),
                              widget: Text(
                                '상세',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    fontSize:
                                    WidgetSize(context).sizedBox12,
                                    color: Style.brown),
                              )
                          )
                        ],
                      )
                    ],
                  )
              );
          }),
    );
  }
}
