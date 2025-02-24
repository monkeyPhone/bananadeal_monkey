import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/management_button/end_deal_management_ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../components/neumorphic_buttons.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import 'end_deal_management_delete_list_container.dart';

class EndManagementDialog extends GetView<DealController> {
  const EndManagementDialog({super.key});

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result){
        if(didPop){
          return;
        }
        controller.closeManagementDialog();
      },
      child: Dialog(
        backgroundColor: Style.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox12))
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Style.white,
              borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
          ),
          width: WidgetSize(context).widthCommon,
          padding: EdgeInsets.only(
              top: WidgetSize(context).sizedBox15,
              bottom: WidgetSize(context).sizedBox18
          ),
          child: GetBuilder<DealController>(
            builder: (controllers) =>
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: WidgetSize(context).widthCommon,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: WidgetSize(context).sizedBox13,
                            right: WidgetSize(context).sizedBox3
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '종료된 딜 관리',
                              style: TextStyle(
                                  color: Style.blackWrite,
                                  fontSize: WidgetSize(context).sizedBox24,
                                  fontWeight: FontWeight.w700),
                            ),
                            RippleIconButton(
                                onTap: (){
                                  controllers.closeManagementDialog();
                                },
                                padding: WidgetSize(context).sizedBox6_5,
                                iconSize: WidgetSize(context).sizedBox48,
                                icon: Icons.close,
                                iconColor: Style.blackWrite
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: WidgetSize(context).sizedBox18,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: WidgetSize(context).sizedBox6_5,
                      ),
                      child: Row(
                        children: [
                          EndDealManageMentRippleButton(
                              onTap: (){
                                controllers.clickTotalButton();
                              },
                              widget:  controllers.selected.value == 0
                                  ? SuccessRipple()
                                  : CancelRipple()
                          ),

                          SizedBox(
                            width: WidgetSize(context).sizedBox6_5,
                          ),
                          Text('전체 선택',
                            style: TextStyle(
                                fontSize: WidgetSize(context).sizedBox14,
                                fontWeight: FontWeight.w400,
                                color: Style.blackWrite
                            ),
                          ),
                          SizedBox(
                            width: WidgetSize(context).sizedBox6_5,
                          ),
                          Text('( ${controllers.deleteList.length} / ${controllers.remoteList.length} 개 )',
                            style: TextStyle(
                                fontSize: WidgetSize(context).sizedBox12,
                                fontWeight: FontWeight.w400,
                                color: Style.blackWrite
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: WidgetSize(context).sizedBox22,
                    ),
                    Expanded(
                      child: Scrollbar(
                        controller: controllers.scrollController,
                        thumbVisibility: true,
                        child: ListView.builder(
                            padding: EdgeInsets.only(left: WidgetSize(context).sizedBox6_5, right: WidgetSize(context).sizedBox16),
                            controller: controllers.scrollController,
                            physics: ClampingScrollPhysics(),
                            itemCount: controllers.remoteList.length,
                            itemBuilder: (BuildContext context, int index){
                              return EndDealManagementDeleteListContainer(index: index);
                            }
                        ),
                      ),
                    ),
                    SizedBox(
                      height: WidgetSize(context).sizedBox18,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox25),
                        child: NeumorphicButtons(
                            height: WidgetSize(context).sizedBox50,
                            text: '삭제하기' ,
                            textWidget: Center(
                                child: Text(
                                  '삭제하기',
                                  style: TextStyle(fontSize: WidgetSize(context).sizedBox16, color: Style.brown, fontWeight: FontWeight.w400),
                                )
                            ),
                            onPressed: () async{
                              await controller.sendDelete();
                            }))
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
