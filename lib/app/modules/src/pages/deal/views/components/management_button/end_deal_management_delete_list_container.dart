import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/management_button/end_deal_management_ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const/const_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../controllers/deal_controller.dart';

class EndDealManagementDeleteListContainer extends StatelessWidget {
  final int index;
  const EndDealManagementDeleteListContainer({
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DealController>(
        builder: (DealController controller) {
          return Container(
            margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox8),
            padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox8),
            width: WidgetSize(context).widthCommon,
            height: WidgetSize(context).height60px,
            decoration: BoxDecoration(
                color: Style.white,
                border: Border(
                    bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD)
                )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EndDealManageMentRippleButton(
                    onTap: (){
                      controller.clickSingleManagement(index);
                      },
                widget: controller.deleteList.contains(controller.remoteList[index].diIdx)
                    ? SuccessRipple()
                    : CancelRipple()
          ),

                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: WidgetSize(context).sizedBox15,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.remoteList[index].diHopePhone,
                                style: TextStyle(
                                    color: Style.blackWrite,
                                    fontSize:
                                    controller.remoteList[index].diHopePhone.length > 24
                                        ? WidgetSize(context).sizedBox10
                                        :
                                    controller.remoteList[index].diHopePhone.length > 20
                                        ? WidgetSize(context).sizedBox12
                                        : WidgetSize(context).sizedBox14,
                                    fontWeight: FontWeight.w700
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: WidgetSize(context).sizedBox3,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text:
                                    '받은 딜 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: WidgetSize(context).sizedBox12,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '${controller.remoteList[index].diEstimateCnt}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: WidgetSize(context).sizedBox12,
                                              color: controller.remoteList[index].diStatus == InfoString.dealStatusOpen
                                                        ? Style.crowdFlower2
                                                        : Colors.pinkAccent
                                          )
                                      ),
                                      TextSpan(
                                          text: '건 ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: WidgetSize(context).sizedBox12,
                                              color: Colors.black
                                          )
                                      ),
                                      // TextSpan(
                                      //     text: '${controller.remoteList[index].diStatus}',
                                      //     style: TextStyle(
                                      //         fontWeight: FontWeight.w400,
                                      //         fontSize: WidgetSize(context).sizedBox10,
                                      //         color: controller.remoteList[index].diStatus == InfoString.dealStatusOpen
                                      //             ? Style.yellow
                                      //             : Colors.pinkAccent
                                      //     )
                                      // )
                                    ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(
                  width:  WidgetSize(context).sizedBox3,
                ),
                Text(
                  '${DateFormat("yyyy.MM.dd").format(DateTime.parse(controller.remoteList[index].diRegdate).toLocal())}',
                  style: TextStyle(
                      color: Style.greyAAAAAA,
                      fontWeight: FontWeight.w400,
                      fontSize: WidgetSize(context).sizedBox12
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
