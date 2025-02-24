import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/views/helper/make_deal/make_deal_body/make_deal_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/views/helper/make_deal/make_deal_body/make_deal_body_text_span.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/views/helper/make_deal/make_deal_nav/make_deal_bottom_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/views/helper/make_deal/make_deal_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../routes/const_element.dart';

class MakeDeal extends GetView<MakeDealController> {
  final int page;
  const MakeDeal({
    required this.page,
    super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if(didPop){
          return;
        }
        controller.quitDeal(context);
      },
      child: GestureDetector(
        onTap: () {
          controller.focus.unfocus();
        },
        child: Scaffold(
          backgroundColor: Style.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Style.white,
            surfaceTintColor: Style.white,
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
            title: SizedBox(),
          ),
          body: Padding(
            padding: WidgetSize(context).paddingBodyWhole,
            child: Column(
              children: [
                SizedBox(
                    width: WidgetSize(context).widthCommon,
                    height: WidgetSize(context).sizedBox119,
                    child: MakeDealTitle(page: page,)),
                SizedBox(height: WidgetSize(context).sizedBox20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: MakeDealBodyRichText(page: page,),
                ),
                Expanded(child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: WidgetSize(context).sizedBox24
                  ),
                  child: MakeDealBody(),
                )),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Style.white,
            child: SafeArea(
              child: Container(
                height: AppElement.defaultBottomPadding,
                color: Style.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: WidgetSize(context).paddingBodyWhole,
                      child: MakeDealBottomArea(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
