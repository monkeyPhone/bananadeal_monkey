import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_notice/components/etc_notice_body/etc_notice_main/etc_notice_main_scroll/etc_notice_main_scroll_container.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../models/etc/etc_notice.dart';

class EtcNoticeMainScroll extends StatelessWidget {
  final ScrollController scrollController;
  final int itemCounter;
  final List<EtcNoticeList> questionList;
  final bool isEmptyList;
  final bool isWhere;
  const EtcNoticeMainScroll({
    required this.scrollController,
    required this.itemCounter,
    required this.questionList,
    required this.isEmptyList,
    required this.isWhere,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.builder(
            controller: scrollController,
            itemCount: itemCounter,
            itemBuilder: (context, index){
              return EtcNoticeMainScrollContainer(
                  index: index,
                  title: questionList[index].bnTitle,
                  isEmptyList:  isEmptyList,
                  isWhere: isWhere,
              );
            }
        )
    );
  }
}
