import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_terms_of_use/widgets/etc_terms_of_use_html_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';

class EtcTermsOfUseScroll extends StatelessWidget {
  final ScrollController scrollController;
  final String text;
  final bool loading;
  const EtcTermsOfUseScroll({
    required this.scrollController,
    required this.text,
    required this.loading,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16, right: WidgetSize(context).sizedBox12),
        controller: scrollController,
        children: [
          !loading
          ?
          Column(
            children: [
              EtcTermsOfUseHtmlWidget(
                text: text
              ),
            ],
          )
              : const SizedBox()
        ],
      ),
    );
  }
}
