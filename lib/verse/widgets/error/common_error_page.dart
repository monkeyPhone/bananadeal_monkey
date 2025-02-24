import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';


class CommonErrorPage extends StatelessWidget {
  final CommonSize size;
  final JsonError? error;
  final GestureTapCallback onTap;
  const CommonErrorPage({super.key,
    required this.size,
    required this.error,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: size.widthCommon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              _ErrorPageDetail(
                size: size,
                status: error == null ? 508 : error!.status ,),
              SizedBox(height:  size.sizedBox20),
              BdRippleButtonBasic(
                onTap: onTap,
                padding: EdgeInsets.symmetric(
                    vertical: size.sizedBox15,
                    horizontal: size.sizedBox45
                ),
                borderRadius: BorderRadius.circular(999),
                color: yellow,
                child: const BdTextWidget(text: '다시 시도', textStyle: bodyBrown,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


class _ErrorPageDetail extends StatelessWidget {
  final CommonSize size;
  final int status;
  const _ErrorPageDetail({
    required this.size,
    required this.status});

  @override
  Widget build(BuildContext context) {
    return switch(status){
      505 =>
          Column(
            children: [
              Icon(Icons.wifi_off, color: ultimateGrey, size: size.sizedBox45),
              SizedBox(height:  size.sizedBox20),
              const BdTextWidget(text: '네트워크에 접속할 수 없습니다.', textStyle: titleButtonBold,  ),
              SizedBox(height: size.sizedBox10),
              const BdTextWidget(text: '네트워크 연결 상태를 확인해주세요.', textStyle: bodyGrey,),
            ],
          ),
      _ =>
          Column(
            children: [
              Icon(Icons.error_outline, color: ultimateGrey, size: size.sizedBox45),
              SizedBox(height:  size.sizedBox20),
              const BdTextWidget(text: '일시적인 오류가 발생했습니다.', textStyle: titleButtonBold,),
              SizedBox(height:  size.sizedBox10),
              const BdTextWidget(text: '서비스 이용에 불편을 드려 죄송합니다.', textStyle: bodyGrey,),
              SizedBox(height:  size.sizedBox5),
              const BdTextWidget(text: '잠시 후 다시 이용해 주세요.', textStyle: bodyGrey,),
              SizedBox(height:  size.sizedBox5),
              BdTextWidget(text: '오류코드 : $status', textStyle: bodyGrey,),
            ],
          ),
    };
  }
}