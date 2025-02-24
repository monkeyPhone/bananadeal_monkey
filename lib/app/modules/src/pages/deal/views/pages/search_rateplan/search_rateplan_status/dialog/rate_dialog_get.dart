import 'package:banana_deal_by_monkeycompany/app/components/widget_components/stack_loading_bar/basic_loading.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_rateplan_controllers/search_rateplan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/deal/phone_rate_plan.dart';

class RateDialogGet extends GetView<SearchRateplanController> {
  final RateList rate;
  const RateDialogGet({
    required this.rate,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Style.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox12))
      ),
      child: Stack(
        children: [
          FutureBuilder(
              future: controller.getModelRatePlanDetail(rate.pIdx),
              builder: (BuildContext contexts, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return  BasicLoading();
                }
                else if (snapshot.hasError) {
                  return BasicLoading();
                }
                else {
                  return GetBuilder<SearchRateplanController>(
                    builder: (src) =>
                        Container(
                          width: WidgetSize(context).reviewDialog,
                          padding: EdgeInsets.symmetric(
                              horizontal: WidgetSize(context).sizedBox16,
                              vertical: WidgetSize(context).sizedBox20),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: WidgetSize(context).width06,
                                      child: Text('${
                                          rate.pPlanName
                                      }',
                                        style: TextStyle(color: Style.blackWrite,
                                            fontWeight: FontWeight.w700,
                                            fontSize: WidgetSize(context).sizedBox24),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: WidgetSize(context).sizedBox16,),
                                Padding(
                                  padding: EdgeInsets.only(left: WidgetSize(context)
                                      .sizedBox2, right: WidgetSize(context).sizedBox15),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          listRowIconText(
                                            Icons.phone_outlined,
                                            WidgetSize(context).sizedBox18,
                                            src.rateDetail.value.list[0].pTel.toString(),
                                            WidgetSize(context).sizedBox16,
                                            FontWeight.w700,
                                            context,
                                          ),
                              SizedBox(width: WidgetSize(context).sizedBox22,),
                              listRowIconText(
                                Icons.mail_outline,
                                WidgetSize(context).sizedBox18,
                                src.rateDetail.value.list[0].pSms.toString(),
                                WidgetSize(context).sizedBox16,
                                FontWeight.w700,
                                context,
                              ),
                              SizedBox(width: WidgetSize(context).sizedBox22,),
                              listRowIconText(Icons.signal_cellular_alt,
                                WidgetSize(context).sizedBox18,
                                src.rateDetail.value.list[0].pLte.toString(),
                                WidgetSize(context).sizedBox16, FontWeight.w700,
                                context,),
                            ],
                          ),
                          SizedBox(height: WidgetSize(context).sizedBox15,),
                          HtmlWidget(
                            '${src.convertInfo.value}',
                            textStyle: TextStyle(
                                fontSize: WidgetSize(context).sizedBox16,
                                fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
      );
    }}
          ),
          Positioned(
            top: WidgetSize(context).sizedBox5,
              right: WidgetSize(context).sizedBox5,
              child:  Material(
                borderRadius: BorderRadius.circular(999),
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(999)),
                        padding: EdgeInsets.all(WidgetSize(context).sizedBox10),
                        child: Icon(
                          Icons.close,
                          color: Style.blackWrite,
                          size: WidgetSize(context).sizedBox30,)
                    )
                ),
              )
          )
        ],
      ),
    );
  }

  Widget listRowIconText(var icon, double iconSize, String text, double textSize, FontWeight fontWeight, BuildContext context){
    return Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox1_5),
      child: Row(
        children: [
          Icon(icon, size: iconSize),
          SizedBox(width: WidgetSize(context).sizedBox6,),
          Text(text,
            style: TextStyle(fontSize: textSize, fontWeight: fontWeight),
          )
        ],
      ),
    );
  }


}
