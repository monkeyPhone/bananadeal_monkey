import 'package:flutter/material.dart';
import '../../../../../../../../models/etc/etc_event.dart';
import 'etc_event_list_container.dart';

class EtcEventListWidget extends StatelessWidget {
  final ScrollController scrollController;
  final int itemCount;
  final bool currentTap;
  final List<EtcEventList> currentEventList;
  final List<EtcEventList> endEventList;
  const EtcEventListWidget({
    required this.scrollController,
    required this.itemCount,
    required this.currentTap,
    required this.currentEventList,
    required this.endEventList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: ListView.builder(
          itemCount: itemCount,
          physics: const ClampingScrollPhysics(),
          controller: scrollController,
          itemBuilder: (BuildContext context, int index){
            return
              currentTap
                  ? EtcEventListContainer(event: currentEventList[index],)
                  : EtcEventListContainer(event: endEventList[index]);
          }),
    );
  }
}
