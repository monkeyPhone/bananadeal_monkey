import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/flutter_neumorphic.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/const_element.dart';


class Nb0 extends StatelessWidget {
  final String casew;
  const Nb0({
      required this.casew,
    Key? key}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: () async{
         await SrcDealController.to.getDealDataInits(
            SrcInfoController.to.infoM.value.mIdx
          );
        },
        style: NeumorphicStyle(
          shadowLightColor: Style.happy.withValues(alpha: 0.7),
          shadowDarkColor: Style.blackWrite.withValues(alpha: 0.8),
          depth: 2,
          intensity: 0.86,
          surfaceIntensity: 0.5,
          shape: NeumorphicShape.flat,
          color: Style.white,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(WidgetSize(context).width003)),
        ),
        child: Center(
          child: Text('재시도 ($casew)',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox18, color: Style.greyWrite
            ),
            textAlign: TextAlign.center,
          ),
        )
    );
  }
}


class Nb1 extends StatelessWidget {
  final VoidCallback onPressed;
  const Nb1({
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        onPressed: const AppOutsFunction().debounce(callback: onPressed),
        style: NeumorphicStyle(
          shadowLightColor: Style.happy.withValues(alpha: 0.7),
          shadowDarkColor: Style.blackWrite.withValues(alpha: 0.8),
          depth: 2,
          intensity: 0.86,
          surfaceIntensity: 0.5,
          shape: NeumorphicShape.flat,
          color: Style.white,
          boxShape:
          NeumorphicBoxShape.roundRect(BorderRadius.circular(WidgetSize(context).width003)),
        ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: WidgetSize(context).sizedBox24),
            Icon(CupertinoIcons.device_phone_portrait, color: Style.greyWrite, size: WidgetSize(context).height60px,),
            SizedBox(height: WidgetSize(context).sizedBox24),
            Text('지금 바로 딜을 등록하고\n견적을 받아보세요!',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox18, color: Style.greyWrite ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: WidgetSize(context).sizedBox24),
          ],
        )
    );
  }
}



class Nb2 extends StatelessWidget {
  final bool isCntZero;
  const Nb2({Key? key,
    required this.isCntZero
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Neumorphic(
      style: NeumorphicStyle(
        border: NeumorphicBorder( color:Style.greyD7D7D7, width: WidgetSize(context).sizedBox2),
        shadowLightColor: Style.happy.withValues(alpha: 0.7),
        shadowDarkColor: Style.blackWrite.withValues(alpha: 0.8),
        color: Style.white,
        depth: 2.5,
        intensity: 0.86,
        surfaceIntensity: 0.5,
        shape: NeumorphicShape.flat,
        boxShape:
        NeumorphicBoxShape.roundRect(BorderRadius.circular(WidgetSize(context).width003)),

      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox10,),
            child: _Android(
              text1: isCntZero ? '딜 요청할 매장을 선택하지 않았습니다.' : '딜 요청한 매장의 견적을 기다리고 있어요.',
              text2: isCntZero ? '매장에 딜을 요청해보세요.' : '조금만 기다려주세요.',
            ),
          ),
        ],
      ),
    );
  }
}


class _Android extends StatelessWidget {
  final String text1;
  final String text2;
  const _Android({
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: WidgetSize(context).sizedBox24,
        ),
        Image.asset( AppElement.defaultList, height: WidgetSize(context).sizedBox100, fit: BoxFit.fitHeight,),
        SizedBox(
          height: WidgetSize(context).sizedBox24,
        ),
        Text(text1,
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox17,
              fontWeight: FontWeight.w700,
              color: Style.grey999999
          ),
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox3,
        ),
        Text(text2,
          style: TextStyle(
              fontSize: WidgetSize(context).sizedBox17,
              fontWeight: FontWeight.w700,
              color: Style.grey999999
          ),
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox24,
        ),
      ],
    );
  }
}






class NbReButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  const NbReButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.symmetric(
        vertical: WidgetSize(context).sizedBox12,
        horizontal: WidgetSize(context).sizedBox20,
      ),
      onPressed: const AppOutsFunction().debounce(callback: onPressed),
      style: NeumorphicStyle(
        border: NeumorphicBorder( color:Style.greyD7D7D7, width: WidgetSize(context).sizedBox1_5),
        shadowDarkColor: Style.happy,
        color: Style.white,
        depth: 2.0,
        intensity: 0.86,
        surfaceIntensity: 0.5,
        shape: NeumorphicShape.flat,
        boxShape:
        NeumorphicBoxShape.roundRect(BorderRadius.circular(WidgetSize(context).sizedBox16)),
      ),
      child: Text(
        '다시 시도',
        style: TextStyle(
          color: Style.greyWrite,
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}


