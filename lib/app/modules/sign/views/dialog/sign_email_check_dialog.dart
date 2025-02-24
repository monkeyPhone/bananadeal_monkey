import 'package:banana_deal_by_monkeycompany/app/components/image_provider/asset_image_box.dart';
import 'package:banana_deal_by_monkeycompany/app/components/neumorphic_buttons.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_search_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignEmailCheckDialog extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool isSign;
  const SignEmailCheckDialog({super.key,
    required this.onTap,
    required this.isSign,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: Style.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).dialogCircular))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Close(),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                  horizontal: WidgetSize(context).sizedBox16,
              ),
              child: Column(
                children: [
                  _Image(),
                  _Pad(),
                  _TextLine(isSign: isSign,),
                  _Pad(),
                  _ButtonArea(
                    onTap: onTap,
                  ),
                  _Pad()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _Close extends StatelessWidget {
  const _Close();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FittedBox(
              fit: BoxFit.scaleDown,
              child: RippleIconButton(
                  onTap: (){
                    Get.back();
                  },icon: Icons.close,
                  iconColor: Style.karajeck)
          ),

        ],
      ),
    );
  }
}


class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px*1.3,
      child: FittedBox(
          fit: BoxFit.scaleDown,
          child: AssetImageBox(
              imageHeight: WidgetSize(context).widthCommon,
              imageWidth: WidgetSize(context).widthCommon,
              imageUrl: 'assets/images/character/sunglass.png'
          )
      ),
    );
  }
}

class _TextLine extends StatelessWidget {
  final bool isSign;
  const _TextLine({
    required this.isSign,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Column(
        children: [
          Text(isSign ?'가입할 수 있는 이메일입니다.' : '화원가입된 이메일입니다.',
            style: TextStyle(
              color: Style.karajeck,
              fontSize: WidgetSize(context).sizedBox22,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox8,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(isSign ? '가입을 위해 이메일 본인확인을 진행해주세요.' : '비밀번호 찾기를 위해 이메일 본인확인을 진행해주세요.',
              style: TextStyle(
                  color: Style.greyWrite,
                  fontSize: WidgetSize(context).sizedBox18,
                  fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }
}


class _ButtonArea extends StatelessWidget {
  final GestureTapCallback onTap;
  const _ButtonArea({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NeumorphicButtons(
          radius: WidgetSize(context).sizedBox8,
          height: WidgetSize(context).sizedBox50,
          text: '본인확인하기',
          onPressed: onTap,
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox8,
        ),
        RippleDecorationButton(
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
            width: WidgetSize(context).widthCommon,
            height: WidgetSize(context).sizedBox50,
            onTap: (){
              Get.back();
            },
            widget: Center(
              child: Text(
                '취소',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Style.greyWrite,
                  fontSize: WidgetSize(context).sizedBox17
                ),
              ),
            )
        )
      ],
    );
  }
}


class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetSize(context).sizedBox16,
    );
  }
}




