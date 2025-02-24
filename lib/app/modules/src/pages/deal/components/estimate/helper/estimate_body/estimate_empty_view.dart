import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_deal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class EstimateEmptyView extends StatelessWidget {
  final bool isStatus;
  final bool isLoading;
  const EstimateEmptyView({
    super.key,
    required this.isStatus,
    required this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return
      isLoading
        ? Center(child: _Text(text: '잠시만 기다려주세요.',))
        :
      isStatus
          ?    GetBuilder<SrcDealController>(
          builder: (srcD) =>
          srcD.inviteCnt.value == 0
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Text(text: '아직 딜 요청할 매장을 선택하지 않았습니다.'),
              SizedBox(height: WidgetSize(context).sizedBox16,),
              RichTextWidget(list: [
                ("아래 '",
                TextStyle(
                    fontSize: WidgetSize(context).sizedBox18,
                    fontWeight: FontWeight.w700,
                    color: Style.ultimateGrey
                )
                ),
                ("초대하기",
                TextStyle(
                    fontSize: WidgetSize(context).sizedBox18,
                    fontWeight: FontWeight.w700,
                    color: Style.blackWrite
                )
                ),
                ("' 버튼에서",
                TextStyle(
                    fontSize: WidgetSize(context).sizedBox18,
                    fontWeight: FontWeight.w700,
                    color: Style.ultimateGrey
                )
                ),
              ]),
              _Text(text: '견적 받아볼 매장을 추가해보세요.'),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Text(text: '아직 딜에 참여한 매장이 없습니다.'),
              _Text(text: '조금만 기다려주세요.'),
              SizedBox(height: WidgetSize(context).sizedBox16,),
              _Text2(text: 'Tip! 내가 요청한 매장이 별로 없다면,'),
              _Text2(text: '메인화면에서 추가로 더 많은 매장에'),
              _Text2(text: '딜을 요청할 수 있습니다.'),
            ],
          )
      )
          : Center(child: _Text(text: '받은 견적이 없는 딜입니다.',))
     ;
  }
}


class _Text extends StatelessWidget {
  final String text;
  const _Text({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.ultimateGrey
      ),
    );
  }
}

class _Text2 extends StatelessWidget {
  final String text;
  const _Text2 ({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox16,
          fontWeight: FontWeight.w500,
          color: Style.ultimateGrey
      ),
    );
  }
}
