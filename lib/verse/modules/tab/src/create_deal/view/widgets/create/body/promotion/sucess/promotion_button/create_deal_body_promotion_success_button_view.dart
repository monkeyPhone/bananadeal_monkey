import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_promotion/banana_create_deal_promotion_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodyPromotionSuccessButtonView extends StatelessWidget {
  const CreateDealBodyPromotionSuccessButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocBuilder<BananaCreateDealPromotionBloc, BananaCreateDealPromotionState>(
        builder: (context, state) =>
        state.tkIdx == '0'
            ?   SizedBox(
          width: size.widthCommon,
          height: size.ratio58/2,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _ModalButton(
                          promotionEnum: PromotionEnum.maxInstallment,
                          sheetList: state.maxInst,)
                    ),
                    SizedBox(width: size.sized16grid,),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _ModalButton(
                          promotionEnum: PromotionEnum.supportType,
                          sheetList: state.supportType,)
                    ),
                  ],
                ),
              )
            ],
          ),
        )
            :
        SizedBox(
          width: size.widthCommon,
          height: size.ratio58,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _ModalButton(
                          promotionEnum: PromotionEnum.maxInstallment,
                          sheetList: state.maxInst,)
                    ),
                    SizedBox(width: size.sized16grid,),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _ModalButton(
                          promotionEnum: PromotionEnum.supportType,
                          sheetList: state.supportType,)
                    ),
                  ],
                ),
              ),
              const BdCustomPad(padEnum: PadEnum.height16),
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _ModalButton(
                          promotionEnum: PromotionEnum.combination,
                          sheetList: state.guyhap,)
                    ),
                    SizedBox(width: size.sized16grid,),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: _ModalButton(
                          promotionEnum: PromotionEnum.welfare,
                          sheetList: state.walfare,)
                    ),
                  ],
                ),
              )
            ],
          ),
        )

    );
  }
}


class _ModalButton extends StatelessWidget {
  final PromotionEnum promotionEnum;
  final List<String> sheetList;
  const _ModalButton({
    required this.promotionEnum,
    required this.sheetList});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
        borderRadius:  BorderRadius.circular(size.sized16grid),
        onLongPress: (){
          context.read<CreateDealManager>().setPromotion(promotionEnum: promotionEnum, value: '', context: context);
        },
        onTap: (){
          context.read<CreateDealManager>().promotionSheet(
              promotionEnum: promotionEnum,
              stateList: sheetList,
            context: context,
          );
        }, child: BlocSelector<BananaCreateDealBloc, BananaCreateDealState, String>(
      selector: (state) => switch(promotionEnum){
        PromotionEnum.maxInstallment => state.maxInstallment,
        PromotionEnum.supportType => state.supportType,
        PromotionEnum.combination => state.combination,
        PromotionEnum.welfare => state.welfare,
        PromotionEnum.request => state.request,
      },
      builder: (context, promotion) =>
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: size.sizedBox2,
                  color: promotion == '' ? greyDDDDDD : yellow,
                ),
                borderRadius: BorderRadius.circular(size.sized16grid)
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BdTextWidget(text: switch(promotionEnum){
                    PromotionEnum.maxInstallment => '할부개월',
                    PromotionEnum.supportType => '통신사 할인',
                    PromotionEnum.combination => '결합',
                    PromotionEnum.welfare => '복지',
                    PromotionEnum.request => '',
                  }, textStyle: promotion == '' ? bodyGreyBold : bodyBold,),
                  const BdCustomPad(padEnum: PadEnum.heightQuarter),
                  BdTextWidget(text: promotion == '' ? switch(promotionEnum){
                    PromotionEnum.maxInstallment => '상관없음',
                    PromotionEnum.supportType => '상관없음',
                    PromotionEnum.combination => '해당없음',
                    PromotionEnum.welfare => '해당없음',
                    PromotionEnum.request => '',
                  } : promotion, textStyle: promotion == '' ? titleButtonGreyBold : titleButtonBrownBold,),
                ],),
            ),
          ),
    )
    );
  }
}





