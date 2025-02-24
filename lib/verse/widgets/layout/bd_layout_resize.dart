import 'package:flutter/material.dart';

class BdLayoutResize extends StatelessWidget {
  final Widget widget;
  final Widget? listWidget;
  const BdLayoutResize({super.key,
    required this.widget,
    this.listWidget
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            Expanded(
                child: Center(
                  child: listWidget ?? ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                    widget
                    ,
                  ),
                )
            ),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
                  double safeAreaPadding = MediaQuery.of(context).padding.bottom;
                  double keyboardHeight = MediaQuery.of(context).viewInsets.bottom - safeAreaPadding;
                  return SizedBox(
                    height: keyboardHeight,
                  );
                }
            )
          ],
        )
    );
  }
}
