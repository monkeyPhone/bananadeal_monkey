import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_routing.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/estimate/estimate_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../models/nav/deal/deal_status.dart';

class EstimateBottomNavState extends GetView<EstimatedController> {
  final DealStatusList currentDeal;
  const EstimateBottomNavState({
    required this.currentDeal,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
      ),
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      child: Row(
        children: [
          _Pad(),
          _FlexButton(
            onTap: () {
              AppOutsRouting().showDetailBottomSheet(context: context,
                  userDealInfo: SrcDealController.to.currentMyDeal.first);
            },
            // assets: AppElement.dealSvg,
            text: '딜 정보',
            color: Colors.black87,
            icon: Icons.phone_android_outlined,

          ),
          _Pad(),
          _FlexButton(
            onTap: () {
              AppOutsRouting().gotoInvite();
            },
            // assets: AppElement.storeSvg,
            text: '초대하기',
            color: Colors.black87,
            icon: Icons.add,

          ),
          _Pad(),
          _FlexButton(
            onTap: () async {
              await controller.clickEndButton(
                  context: context,
                  diHopePhone: currentDeal.diHopePhone,
                  diIdx: currentDeal.diIdx
              );
              await SrcDealController.to.outUpdateInvite(
                  diIdx: currentDeal.diIdx);
            },
            text: '종료하기',
            color: Colors.black87,
            icon: Icons.power_settings_new,

          ),
          _Pad(),
        ],
      ),
    );
  }

  }


class _Text extends StatelessWidget {
  final String text;
  final Color color;
  const _Text({super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text, style:
      TextStyle(fontSize: WidgetSize(context).sizedBox17, color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}


class _FlexButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String? assets;
  final String text;
  final Color color;
  final IconData icon;
  const _FlexButton({
    this.assets,
    required this.icon,
    required this.onTap,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: RippleDecorationButton(
          height: WidgetSize(context).height60px,
          onTap: onTap,
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              assets == null
                  ?
              Icon(icon, size: WidgetSize(context).sizedBox20, color: color,)
              : SvgPicture.asset(
                assets!,
                width: WidgetSize(context).sizedBox20,
                height: WidgetSize(context).sizedBox20,
              ),
              _Pad(),
              Expanded(
                child: _Text(text: text, color:color,),
              )
            ],
          ),
        )
    );
  }
}




class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).sizedBox8,
    );
  }
}


