import 'package:banana_deal_by_monkeycompany/app/components/image_provider/asset_image_box.dart';
import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/controllers/make_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/components/post_deal/moduels/make_deal/views/helper/make_deal/make_deal_nav/make_deal_bottom_area.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';

class SubmissionView extends GetView<MakeDealController> {
  const SubmissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
      canPop: false,
      onPopInvoked: (bool didPop, Object? result){
        if(didPop){
          return;
        }
        controller.quitDeal(context);
      },
      body: _Body(),
      bottomNavigationBar: _Nav(),
    );
  }
}


class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final ScrollController _scrollController;

  void _showNotification(){
    showDialog(context: context,
        builder: (BuildContext context) =>
            Dialog(
              backgroundColor: Style.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                  height: WidgetSize(context).height60px,
              width: WidgetSize(context).widthCommon,
              child: Padding(
                padding: EdgeInsets.only(left: WidgetSize(context).sizedBox8, right: WidgetSize(context).sizedBox5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RippleDecorationButton(
                        onTap: (){ Get.back(); },
                        height: WidgetSize(context).sizedBox42,
                        width: WidgetSize(context).sizedBox42,
                        padding: EdgeInsets.all(WidgetSize(context).sizedBox10_5),
                        widget: FittedBox(
                          child: Icon(Icons.arrow_back_ios, color: Style.blackWrite,),
                        )
                    ),
                    Expanded(child: SizedBox(width: 1,)),
                    SizedBox(width: 1, height: 1,),
                  ],
                ),
              ),
            ),
                  _GreyBox()
                ],
              ),
            )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: WidgetSize(context).sizedBox8),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: WidgetSize(context).sizedBox16
                ),
                children: [
                  _ImageArea(),
                  SizedBox(height: WidgetSize(context).height60px,),
                  _Alert(
                          (){
                        _showNotification();
                      }
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Alert extends StatelessWidget {
  final GestureTapCallback onTap;
  const _Alert(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RippleDecorationButton(
            onTap: onTap,
            borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
            padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichTextWidget(
                      list: [
                    ('잠깐! 혹시 ', TextStyle(
                        fontSize: WidgetSize(context).sizedBox15,
                        color: Style.blackWrite,
                        fontWeight: FontWeight.w600
                    )),
                    ('*미스터리 쇼퍼', TextStyle(
                        fontSize: WidgetSize(context).sizedBox15,
                        color: Colors.green,
                        fontWeight: FontWeight.w600
                    )),
                    ('는 아니시죠? ', TextStyle(
                        fontSize: WidgetSize(context).sizedBox15,
                        color: Style.blackWrite,
                        fontWeight: FontWeight.w600
                    )),
                  ]
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, size: WidgetSize(context).sizedBox20, color: Style.greyWrite,)
              ],
            )
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('※ 일반 구매고객을 가장하여, 악의적으로 영업 방해 및 피해를 발생시킬 목적을 가진 사람', style: TextStyle(
              fontSize: WidgetSize(context).sizedBox13,
              color: Colors.green,
              fontWeight: FontWeight.w600
          ),),
        ),
        SizedBox(
          height: WidgetSize(context).sizedBox12,
        ),
      ],
    );
  }
}

class _ImageArea extends StatelessWidget {
  const _ImageArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(WidgetSize(context).sizedBox18),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Style.yellow,
                          width: WidgetSize(context).sizedBox2
                      ),
                      borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox32)
                  ),
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('딜 요청서를 모두 작성하셨어요!', style: TextStyle(
                            fontSize: WidgetSize(context).sizedBox24,
                            color: Style.blackWrite,
                            fontWeight: FontWeight.w700
                        ),),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('이제 고객님을 기다리는', style: TextStyle(
                            fontSize: WidgetSize(context).sizedBox24,
                            color: Style.blackWrite,
                            fontWeight: FontWeight.w700
                        ),),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('동네 매장을 만나볼까요?', style: TextStyle(
                            fontSize: WidgetSize(context).sizedBox24,
                            color: Style.blackWrite,
                            fontWeight: FontWeight.w700
                        ),),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: WidgetSize(context).sizedBox32,),
              ],
            ),
            Positioned(
                bottom: 0,
                right: WidgetSize(context).widthCommon/4,
                child: Container(
                    width: WidgetSize(context).sizedBox40,
                    height: WidgetSize(context).sizedBox35,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: CustomPaint(painter: _MapDrawTriangle(),)
                ))
          ],
        ),
        AssetImageBox(
          boxFit: BoxFit.fitHeight,
          imageUrl: AppElement.phoneSun,
          imageWidth: WidgetSize(context).widthCommon/2,
          imageHeight: WidgetSize(context).widthCommon/2,
        )
      ],
    );
  }
}


class _GreyBox extends StatelessWidget {
  const _GreyBox();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
          left: WidgetSize(context).sizedBox12,
        right: WidgetSize(context).sizedBox12,
        bottom: WidgetSize(context).sizedBox12,
      ),
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.all(WidgetSize(context).sizedBox14),
            decoration: BoxDecoration(
                color: Style.greyEAEAEA,
              borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('아래와 같은 목적으로 견적을 요청하는 경우 아래 법 조항에 위반되는 위법행위로 미스터리 쇼퍼 개인에게 직접 고발조치하여 법적인 책임을 물을 수 있습니다.', style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox15,
                    color: Style.blackWrite,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: WidgetSize(context).sizedBox12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. ',
                      style: TextStyle(
                          color: Style.blackWrite,
                          fontSize: WidgetSize(context).sizedBox14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('경쟁사 및 타 매장의 견적 확인, 신고, 악의적인 리뷰등록 등의 목적을 가진 경우',
                            style: TextStyle(
                                color: Style.blackWrite,
                                fontSize: WidgetSize(context).sizedBox14,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: WidgetSize(context).sizedBox5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2. ',
                      style: TextStyle(
                          color: Style.blackWrite,
                          fontSize: WidgetSize(context).sizedBox14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('통신관련 기관 및 업자의 의뢰를 받아 감시, 신고 등의 목적을 가진 경우',
                            style: TextStyle(
                                color: Style.blackWrite,
                                fontSize: WidgetSize(context).sizedBox14,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: WidgetSize(context).sizedBox12,),
                Text('※ 형법 제314조 (업무방해죄)와 독점규제 및 공정거래법 제 45조 제1항 제4호 및 동법 시행령 제 52조 관련 [별표2] 불공정거래행위의 유형 및 기준 제8호에 따라 사업활동 방해에 해당하며, 아래'
                    '동의함에 따라 법적인 책임에 동의하며 이용하게 됩니다.', style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox13,
                    color: Style.blackWrite,
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _LastText extends StatelessWidget {
  const _LastText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: WidgetSize(context).sizedBox16
      ),
      child: Column(
        children: [
          SizedBox(height: WidgetSize(context).sizedBox20,),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('이제 동네 매장에 딜 요청하러 가볼까요?', style: TextStyle(
                fontSize: WidgetSize(context).sizedBox17,
                color: Style.blackWrite,
                fontWeight: FontWeight.w600
            ),),
          ),
          SizedBox(height: WidgetSize(context).sizedBox20,),
        ],
      ),
    );
  }
}



class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    return  Container(
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
    );
  }
}


class _MapDrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    double triangleWidth = size.width/1.015 ; // 원래 너비의 반만큼으로 설정

    path.moveTo(size.width / 1 - triangleWidth / 2, 0); // 꼭대기 점
    path.lineTo(size.width / 1 + triangleWidth / 2, 0); // 꼭대기 점에서 오른쪽으로 너비 만큼 이동
    path.lineTo(size.width / 5 , size.height); // 왼쪽 아래 점
    path.close();


    // path.lineTo((size.width) / 2, size.height);
    // path.lineTo(size.width / 2, 0);
    // path.moveTo(size.width, 0);
    // path.lineTo(size.width / 2, size.height);
    // path.lineTo(size.width / 2, 0);
    // path.close();




    var sidePaint = Paint()
      ..color = Style.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // 상단 변 그리기
    var topBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // 바탕 채우기
    var fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // 하얀색 바탕 그리기
    canvas.drawPath(path, fillPaint);

    // 상단 변 제외한 나머지 변 그리기
    canvas.drawLine(
        Offset(size.width / 6, size.height),  // 왼쪽 아래
        Offset(size.width / 1 + triangleWidth / 2, 0),  // 오른쪽 위
        sidePaint
    );

    canvas.drawLine(
        Offset(size.width / 1 - triangleWidth / 2, 0),  // 왼쪽 위
        Offset(size.width / 6, size.height),  // 왼쪽 아래
        sidePaint
    );

    // 상단 변은 하얀색으로
    canvas.drawLine(
        Offset(size.width / 1 - triangleWidth / 2, 0),  // 왼쪽 위
        Offset(size.width / 1 + triangleWidth / 2, 0),  // 오른쪽 위
        topBorderPaint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}