import 'package:banana_deal_by_monkeycompany/app/components/loading.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/stack_loading_bar/basic_loading.dart';
import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatelessWidget {
  final Future future;
  final Widget nextWidget;
  const FutureBuilderWidget({
    super.key,
    required this.future,
    required this.nextWidget
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder:
            (BuildContext contexts, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            // print('snapshot.hasdata == false');
            return  Loading2(text: '잠시만 기다려주세요.',);
          } else if (snapshot.hasError) {
            // print('snapshot.hasdata has error');
            return Loading2(text: '잠시만 기다려주세요.',);
          } else {
            // print('snapshot.hasdata connect');
            return nextWidget;
          }
        });
  }
}


class FutureBuilderWidgetNoExpanded extends StatelessWidget {
  final Future future;
  final Widget nextWidget;
  const FutureBuilderWidgetNoExpanded({
    super.key,
    required this.future,
    required this.nextWidget
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder:
            (BuildContext contexts, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            // print('snapshot.hasdata == false');
            return  Center(child: BasicLoading());
          } else if (snapshot.hasError) {
            // print('snapshot.hasdata has error');
            return Center(child: BasicLoading());
          } else {
            // print('snapshot.hasdata connect');
            return nextWidget;
          }
        });
  }
}

