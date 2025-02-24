import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/state/bloc/banana_model_list_detail/banana_model_list_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ModelListDetailBodySpecView extends StatefulWidget {
  const ModelListDetailBodySpecView({super.key});

  @override
  State<ModelListDetailBodySpecView> createState() => _ModelListDetailBodySpecViewState();
}

class _ModelListDetailBodySpecViewState extends State<ModelListDetailBodySpecView> {
  late ScrollController _scrollController;

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
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: BdLayoutPadding(
        padding: PaddingEnum.all,
        child:  SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: const _Spec(),
        ),
      ),
    );
  }
}

class _Spec extends StatelessWidget {
  const _Spec();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaModelListDetailBloc, BananaModelListDetailState, PsSpec>(
        selector: (state) => state.spec,
        builder: (context, spec) =>
            Column(
              children: [
                _ExplainDetailHtml(
                  text1: 'Design',
                  text2: spec.design,
                ),
                _ExplainDetailHtml(
                  text1: 'Special',
                  text2: spec.special,
                ),
                _ExplainDetailHtml(
                  text1: 'Camera',
                  text2: spec.camera,
                ),
              ],
            )
    );
  }
}

class _ExplainDetailHtml extends StatelessWidget {
  final String text1;
  final String text2;
  const _ExplainDetailHtml({
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return
      text2 == '<ul style="padding-left:0; margin-left:0;"><li style="margin: 10px 0px;"></li>'
          ? const SizedBox()
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text1,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: specTitle,
                fontSize: size.titleMain
            ),
          ),
          SizedBox(height: size.sizedBox5,),
          Padding(
            padding: size.paddingBodyWhole,
            child: HtmlWidget(
              text2,
              textStyle: TextStyle(
                  fontSize: size.body
              ),
            ),
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
        ],
      );
  }
}
