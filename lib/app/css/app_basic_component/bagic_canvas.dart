import 'package:flutter/material.dart';

import '../size.dart';
import '../style.dart';

class BasicCanvas extends StatelessWidget {
  final Widget body;
  final bool canPop;
  final PopInvokedWithResultCallback? onPopInvoked;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const BasicCanvas({
    required this.body,
    required this.canPop,
    this.onPopInvoked,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.floatingActionButtonLocation,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
        backgroundColor: Style.white,
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: body
            ),
            SizedBox(height: WidgetSize(context).extendsGap),
          ],
        ),
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar
            ?? Container(
              color: Style.white,
          child: SafeArea(
            child: SizedBox(),
          ),
        ),
      ),
    );
  }
}


