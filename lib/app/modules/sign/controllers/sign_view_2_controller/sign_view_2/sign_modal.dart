import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_change_auth_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/sign/controllers/sign_view_2_controller/sign_view_2/sign_view_2_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../css/size.dart';
import '../../../../../css/style.dart';

class SignModal{

  Future modalOnTapSign(BuildContext routerContext) {
    return showModalBottomSheet(
      // isDismissible: false,
        context: routerContext,
        builder: (context) {
          return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SafeArea(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: WidgetSize(context).etc0135,
                      maxHeight: double.infinity,
                      minWidth: WidgetSize(context).widthCommon,
                    ),
                    child: GetBuilder<SignView2Controller>(
                      builder: (SignView2Controller controller) =>
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                controller.domainList.length,
                                    (index) => InkWell(
                                  onTap: (){
                                    controller.updateModalE(index);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: WidgetSize(context).etc0156,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: WidgetSize(context).width00025,
                                              color: Style.greyDDDDDD)),
                                    ),
                                    child: Center(
                                        child: Text(
                                          controller.domainList[index],
                                          style: TextStyle(
                                              color: Style.blackWrite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: WidgetSize(context).sizedBox14),
                                        )),
                                  ),
                                )).toList(),
                          )
                      ,
                    ),
                  ),
                ),
              ));
        });
  }



  Future modalOnTapSignAuth(BuildContext routerContext) {
    return showModalBottomSheet(
      // isDismissible: false,
        context: routerContext,
        builder: (context) {
          return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SafeArea(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: WidgetSize(context).width03,
                      maxHeight: double.infinity,
                      minWidth: WidgetSize(context).widthCommon,
                    ),
                    child: GetBuilder<SignView2ChangeAuthController>(
                      builder: (SignView2ChangeAuthController controller)=>
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                controller.domainList.length,
                                    (index) => InkWell(
                                  onTap: (){
                                    controller.updateModal(index);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: WidgetSize(context).etc0156,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: WidgetSize(context).width00025,
                                              color: Style.greyDDDDDD)),
                                    ),
                                    child: Center(
                                        child: Text(
                                          controller.domainList[index],
                                          style: TextStyle(
                                              color: Style.blackWrite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: WidgetSize(context).sizedBox14),
                                        )),
                                  ),
                                )).toList(),
                          )
                      ,
                    ),
                  ),
                ),
              ));
        });
  }

}