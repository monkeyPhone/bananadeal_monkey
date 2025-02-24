import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal_finish/banana_create_deal_finish_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/listener/banana_create_deal_finish_bloc_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/view/widgets/create/body/promotion/sucess/promotion_form/create_deal_body_promotion_success_form_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CreateDealBodyFinishView extends StatelessWidget {
  const CreateDealBodyFinishView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        BananaCreateDealFinishBlocListener(),
        _Body(),
        CreateDealBodyPromotionSuccessFormView(isRead: true,)
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaCreateDealFinishBloc, BananaCreateDealFinishState>(
        builder: (context, state) =>
            Column(
              children: [
                _BodyRow(
                  title: '가입유형',
                  content: state.showCase.$1,
                ),
                _BodyRow(
                  title: '통신사',
                  content: state.showCase.$2,
                ),
                _BodyRow(
                  title: '가입연령',
                  content: state.showCase.$3,
                ),
                _BodyRow(
                  title: '단말기',
                  content: state.showCase.$4,
                ),
                _BodyRow(
                  title: '요금제',
                  content: state.showCase.$5,
                ),
                _BodyRow(
                  title: '할부개월',
                  content: state.showCase.$6,
                ),
                _BodyRow(
                  title: '통신사할인',
                  content: state.showCase.$7,
                ),
                _BodyRow(
                  title: '결합',
                  content: state.showCase.$8,
                ),
                _BodyRow(
                  title: '복지',
                  content: state.showCase.$9,
                ),
              ],
            )
    );
  }
}


class _BodyRow extends StatelessWidget {
  final String title;
  final String content;
  const _BodyRow({
    required this.title,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BdTextWidget(text: title, textStyle: bodyBold,),
            BdTextWidget(text: content,
              textStyle: content == '해당없음' || content == '상관없음'
                  ? bodyGrey
                  : body,
            ),
          ],
        ),
        const BdCustomPad(padEnum: PadEnum.height16)
      ],
    );
  }
}

