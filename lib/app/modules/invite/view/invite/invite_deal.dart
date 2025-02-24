import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_back_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/helper/invite_deal_body/invite_deal_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/helper/invite_nav_bar/invite_nav_bar.dart';
import 'package:flutter/material.dart';
import 'helper/invite_select_boxs/invite_select_boxs.dart';

class InviteDeal extends StatelessWidget {
  final bool isNow;
  final bool isClose;
  const InviteDeal({super.key,
    required this.isNow,
    required this.isClose
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Style.white,
        surfaceTintColor: Style.white,
        toolbarHeight: WidgetSize(context).width02,
        automaticallyImplyLeading: false,
        title: Container(
          color: Style.white,
          padding: EdgeInsets.symmetric(
            vertical: WidgetSize(context).sizedBox8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isClose ? BasicBackButton() : SizedBox(),
                  Text(
                    '매장 초대하기',
                    style: TextStyle(
                        color: Style.blackWrite,
                        fontSize: WidgetSize(context).sizedBox24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(),
              InviteSelectBoxs(),
              SizedBox(height: WidgetSize(context).sizedBox1_5,),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: InviteDealBody()
          ),
          SizedBox(height: WidgetSize(context).sizedBox16,),
        ],
      ),
      bottomNavigationBar: InviteNavBar(isClose : isClose),
    );
  }
}




