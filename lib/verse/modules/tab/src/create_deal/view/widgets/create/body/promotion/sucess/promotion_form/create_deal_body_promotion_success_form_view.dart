import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/state/bloc/banana_create_deal/banana_create_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDealBodyPromotionSuccessFormView extends StatelessWidget {
  final bool isRead;
  const CreateDealBodyPromotionSuccessFormView({super.key,
    required this.isRead
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  SizedBox(
      width: size.widthCommon,
      height: size.ratio58,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BdTextWidget(
            text: '기타 요청사항',
            textStyle: bodyBold,
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          Expanded(
              child: BlocSelector<BananaCreateDealBloc, BananaCreateDealState, String>(
                selector: (state) => state.request,
                builder: (context, request) =>
                    _TextField(request: request, isRead: isRead,),
              )
          )
        ],
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  final String request;
  final bool isRead;
  const _TextField({
    required this.request,
    required this.isRead
  });

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {

  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.text = widget.request;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return TextField(
      readOnly: widget.isRead,
      controller: _textEditingController,
      textInputAction: TextInputAction.done,
      onChanged: context.read<VerseConfig>().function.debounceText(
              (val) => context.read<CreateDealManager>().setPromotion(promotionEnum: PromotionEnum.request, value: val, context: context)
      ),
      onSubmitted: (val) => context.read<CreateDealManager>().setPromotion(promotionEnum: PromotionEnum.request, value: val, context: context),
      style: TextStyle(
          fontSize: size.body, color: blackWrite),
      keyboardType:
      TextInputType.multiline, //TextInputType.multiline,
      maxLines: 8,
      maxLength: 1000,
      cursorColor: ultimateGrey,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(size.sizedBox16),
          counterText: '',
          hintStyle: TextStyle(
              fontSize: size.sizedBox18,
              color: grey999999),
          hintText: widget.isRead? '' :'상세하게 적어주세요 \n예시) 파란색 휴대폰이면 좋겠어요',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(size.sizedBox12),
              borderSide: BorderSide(
                  width: size.sizedBox1,
                  color: greyCCCCCC)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(size.sizedBox12),
              borderSide: BorderSide(
                  width: size.sizedBox1,
                  color: _textEditingController.text == '' || widget.isRead ? greyCCCCCC : yellow)
          )),

    );
  }
}
