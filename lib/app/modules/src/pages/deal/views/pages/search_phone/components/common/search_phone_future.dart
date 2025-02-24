import 'package:flutter/material.dart';
import '../../../../../../../../../components/future_builder_widget.dart';

class SearchPhoneFuture extends StatelessWidget {
  final Future future;
  final Widget successWidget;
  const SearchPhoneFuture({
    required this.future,
    required this.successWidget,
    super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(
      future: future,
      nextWidget: successWidget,
    );
  }
}
