import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_routing.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/neo_button_free.dart';
import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/out_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/app/components/image_provider/asset_image_box.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/models/src/deal/user_deal.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowserBottomSheetOption {
  const BrowserBottomSheetOption();

  void showSheet({
    required BuildContext routerContext,
    required UserDealInfo userDealInfo,
  }){
    showModalBottomSheet<void>(
        useSafeArea: true,
        isScrollControlled: true,
        context: routerContext,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(WidgetSize(routerContext).sizedBox24),
              topRight: Radius.circular(WidgetSize(routerContext).sizedBox24)
          ),
        ),
        showDragHandle: true,
        builder: (BuildContext context) =>
            _BottomSheet(
                userDealInfo: userDealInfo
            )

    );
  }

}

class _BottomSheet extends StatelessWidget {
  final UserDealInfo userDealInfo;
  const _BottomSheet({
    required this.userDealInfo,
  });

  @override
  Widget build(BuildContext context) {
    final WidgetSize size = WidgetSize(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.sizedBox16),
      constraints: BoxConstraints(
        maxHeight: size.introImage,
      ),
      decoration: BoxDecoration(
        color: Style.white,
      ),
      child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.sizedBox8,
              ),
              _ImageArea(
                userDealInfo: userDealInfo,
                size: size,
              ),

              _Content(
                userDealInfo: userDealInfo,
                size: size,
              ),

              _SubButton(
                userDealInfo: userDealInfo,
                size: size,
              ),

              NeoButtonFree(
                  radius: size.sizedBox12,
                  height: size.sizedButton,
                  width: size.widthCommon,
                  size: size,
                  onPressed: (){
                    Get.back();
                  },
                  child:  Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                           '확인',
                          style: TextStyle(
                            fontSize: size.sizedBox17,
                            color: Style.brown,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                  )
              ),
              SizedBox(
                height: size.sizedBox8,
              )
            ],
          )
      ),
    );
  }
}

class _ImageArea extends StatelessWidget {
  final WidgetSize size;
  final UserDealInfo userDealInfo;
  const _ImageArea({
    required this.size,
    required this.userDealInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height60px,
          child: Row(
            children: [
              userDealInfo.diHopePhoneImg != ''
                  ?
              OutImageBinder(
                  imageWidth: size.height60px,
                  imageHeight: size.height60px,
                  imageUrl: '${ApiConsole.monkeyImageUrl}${userDealInfo.diHopePhoneImg}',
                  errUrl: AppElement.defaultPhone,
                  imageLabel: 'carousel'
              )
                  :
              AssetImageBox(
                  boxFit: BoxFit.contain,
                  imageWidth: size.height60px,
                  imageHeight: size.height60px,
                  imageUrl: AppElement.defaultPhone
              ),
              SizedBox(
                width: size.sizedBox16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          userDealInfo.diHopePhone,
                          style: TextStyle(
                            color: Style.blackWrite,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width004
                          ),
                        )
                    ),
                    userDealInfo.diHopePhoneModel == ''
                        ? const SizedBox()
                        : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                            userDealInfo.diHopePhoneModel,
                          style: TextStyle(
                              color: Style.greyWrite,
                              fontSize: size.width003
                          ),
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}


class _Content extends StatelessWidget {
  final WidgetSize size;
  final UserDealInfo userDealInfo;
  const _Content({
    required this.size,
    required this.userDealInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.sizedBox16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.sizedBox32,
          ),
          _RowArea(title: '가입유형', content: userDealInfo.diJoinType, size: size,),
          _RowArea(
              size: size,
              title: '통신사',
              content: AppOutsFunction().convertTelecom(
                  currentAgency: userDealInfo.diBeforeTkIdx == '' ? '0' : userDealInfo.diBeforeTkIdx,
                  requestAgency: userDealInfo.diAfterTkIdx == '' ? '0' : userDealInfo.diAfterTkIdx
              )
          ),
          _RowArea(size: size, title: '가입연령', content: userDealInfo.diAgeType),
          _RowArea(size: size, title: '요금제', content: userDealInfo.diHopePlan),
          _RowArea(size: size, title: '할부개월', content: AppOutsFunction().convertInstallment(userDealInfo.diMaxInstallmentMonth)),
          _RowArea(size: size, title: '통신사할인', content: AppOutsFunction().convertTelecomSupport(userDealInfo.diSupportType)),
          _RowArea(size: size, title: '결합', content: userDealInfo.diCombination == '' ? '해당없음' : userDealInfo.diCombination),
          _RowArea(size: size, title: '복지', content: userDealInfo.diWelfare == '' ? '해당없음' : userDealInfo.diWelfare, isPad: false,),
          SizedBox(
            height: size.sizedBox32,
          ),
        ],
      ),
    );
  }
}


class _RowArea extends StatelessWidget {
  final WidgetSize size;
  final String title;
  final String content;
  final bool? isPad;
  const _RowArea({
    required this.size,
    required this.title,
    required this.content,
    this.isPad
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                title,
              style: TextStyle(
                color: Style.blackWrite,
                fontSize: size.sizedBox17,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              width: size.sizedBox16,
            ),
            Text(
              content,
              style: TextStyle(
                  color: Style.blackWrite,
                  fontSize: size.sizedBox17,
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
        isPad == false ? const SizedBox() : SizedBox(
          height: size.sizedBox16,
        ),
      ],
    );
  }
}

class _SubButton extends StatelessWidget {
  final WidgetSize size;
  final UserDealInfo userDealInfo;
  const _SubButton({
    required this.size,
    required this.userDealInfo});

  @override
  Widget build(BuildContext context) {
    return userDealInfo.diHopePhoneIdx != '' || userDealInfo.diHopePlanIdx != ''
        ? Column(
      children: [
        SizedBox(
          height: size.sizedBox12,
        ),
        SizedBox(
          height: size.height60px,
          child: Row(
            children: [
              Expanded(
                  child: userDealInfo.diHopePhoneIdx != ''
                      ? _SubB(
                      splashColor: Colors.blue.shade50,
                      size: size,
                      onTap: (){
                        AppOutsRouting().gotoModelDetail(
                            diHopePhoneIdx: int.parse(userDealInfo.diHopePhoneIdx),
                            diHopePhone: userDealInfo.diHopePhone
                        );
                      },
                      color: Style.specBlue,
                      text: '단말기 상세보기'
                  )
                      : const SizedBox()
              ),
              SizedBox(
                width: size.sizedBox16,
              ),
              Expanded(
                  child: userDealInfo.diHopePlanIdx != ''
                      ? _SubB(
                      splashColor: Colors.pink.shade50,
                      size: size,
                      onTap: (){
                        AppOutsRouting().gotoRateDetail(context: context, pIdx: userDealInfo.diHopePlanIdx);
                      },
                      color: Style.specPink,
                      text: '요금제 상세보기'
                  )
                      : const SizedBox()
              )
            ],
          ),
        ),
        SizedBox(
          height: size.sizedBox24,
        ),
      ],
    )
        : const SizedBox();
  }
}


class _SubB extends StatelessWidget {
  final WidgetSize size;
  final GestureTapCallback onTap;
  final Color color;
  final Color? splashColor;
  final Color? highlightColor;
  final String text;
  const _SubB({
    required this.size,
    required this.onTap,
    required this.color,
    this.splashColor,
    this.highlightColor,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return RippleDecorationButton(
        borderRadius: BorderRadius.circular(size.sizedBox12),
        padding: EdgeInsets.symmetric(horizontal: size.sizedBox12),
        border: Border.all(
            width: size.sizedBox1,
            color: color
        ),
        onTap: onTap,
        widget: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: size.width003,
                  color: color,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        )
    );
  }
}
