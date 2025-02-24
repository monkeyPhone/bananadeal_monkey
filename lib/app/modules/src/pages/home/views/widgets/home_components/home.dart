import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_routing.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/layout/layout_ratio_58.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/home/views/widgets/home_components/home_app_bar/home_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import 'home_banner/home_banner.dart';
import 'home_deal/home_deal.dart';
import 'home_rank/home_rank.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppbar(),
          SizedBox(
            height: WidgetSize(context).sizedBox3,
          ),
          LayoutRatio(
            child: HomeBanner(),
          ),
          LayoutRatio(
            isConstraints: true,
            child: HomeDeal(),
          ),
          _InviteButton(),
          HomeRank()
        ],
      ),
    );
  }
}

class _InviteButton extends StatelessWidget {
  const _InviteButton();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SrcDealController>(
        builder: (srcD) =>
        srcD.currentDealList.isNotEmpty
            ? Container(
          color: Style.greyF4F4F4,
          width: WidgetSize(context).widthCommon,
          height: WidgetSize(context).sizedBox96,
          padding: EdgeInsets.only(
              left: WidgetSize(context).sizedBox16,
              right: WidgetSize(context).sizedBox16,
              bottom: WidgetSize(context).sizedBox16
          ),
          child: Row(
            children: [
              _SideButton(
                icons: Icons.phone_android,
                onTap: () {
                  AppOutsRouting().showDetailBottomSheet(context: context, userDealInfo: SrcDealController.to.currentMyDeal.first);
                },
                imageUrl: '',
                // imageUrl: AppElement.dealSvg,
                text1: 'My딜',
                text2: '정보 확인',
              ),
              SizedBox(
                width:  WidgetSize(context).sizedBox16,
              ),
              _SideButton(
                icons: Icons.add,
                onTap: () {
                  AppOutsRouting().gotoInvite();
                },
                imageUrl: '',
                // imageUrl: AppElement.storeSvg,
                text1: '매장',
                text2: '초대하기',
              ),
            ],
          ),
        )

            : SizedBox()
    );
  }
}
// AppOutsRouting().gotoInvite();

class _SideButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String imageUrl;
  final IconData icons;
  final String text1;
  final String text2;
  const _SideButton({
    required this.icons,
    required this.onTap,
    required this.imageUrl,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RippleDecorationButton(
          height: WidgetSize(context).sizedBox96,
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox16),
          onTap: onTap,
          widget:  Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox16),
                color: Colors.transparent,
                border: Border.all(
                    width: WidgetSize(context).sizedBox1_5,
                    color: Colors.black54
                )
            ),
            padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: imageUrl != ''
                          ? SvgPicture.asset(
                        imageUrl,
                        width: WidgetSize(context).height60px,
                        height: WidgetSize(context).height60px,
                      )
                          : Icon(icons, color: Colors.black54, size: WidgetSize(context).height60px,),
                    ),
                ),
                SizedBox(width: WidgetSize(context).sizedBox12,),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(text1,
                              style: TextStyle(
                                  fontSize: WidgetSize(context).sizedBox17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(text2,
                              style: TextStyle(
                                  fontSize: WidgetSize(context).sizedBox17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          )
      ),
    );
  }
}





// class _HomeAndroid extends StatelessWidget {
//   const _HomeAndroid();
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           HomeAppbar(),
//           SizedBox(height: WidgetSize(context).sizedBox8,),
//           HomeBanner(),
//
//           SizedBox(height: WidgetSize(context).sizedBox8,),
//           ,
//           SizedBox(height: WidgetSize(context).sizedBox8,)
//         ],
//       )
//       ,
//     );
//   }
// }
//
// class _HomeIOS extends StatelessWidget {
//   const _HomeIOS();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: Column(
//             children: [
//               HomeAppbar(),
//               SizedBox(height: WidgetSize(context).sizedBox8,),
//               Expanded(child: HomeBanner()),
//               HomeDeal(),
//             ],
//           ),
//         ),
//         SizedBox(height: WidgetSize(context).extendsGap,)
//       ],
//     );
//   }
// }


