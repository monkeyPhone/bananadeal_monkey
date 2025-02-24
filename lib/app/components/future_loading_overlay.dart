library future_loading_overlay;

import 'dart:async';

import 'package:flutter/material.dart';
import '../css/size.dart';
import 'widget_components/stack_loading_bar/stack_loading_bar.dart';

/// A helper function that run a future
/// and display loading dialog and hide when future is completed
Future<T?> showFutureLoadingOverlay<T>({
  required BuildContext context,
  required Future<T> future,
  bool barrierDismissible = false,
  bool expanded = false,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => FutureLoadingOverlayDialog(
      future: future,
      expanded: expanded,
    ),
  );
}

/// A loading overlay dialog
class FutureLoadingOverlayDialog<T> extends StatefulWidget {
  final Future<T> future;
  final bool expanded;

  const FutureLoadingOverlayDialog({
    Key? key,
    required this.future,
    required this.expanded,
  }) : super(key: key);

  @override
  State<FutureLoadingOverlayDialog<T>> createState() =>
      _FutureLoadingOverlayDialogState<T>();
}

class _FutureLoadingOverlayDialogState<T>
    extends State<FutureLoadingOverlayDialog<T>> {
  @override
  void initState() {
    super.initState();

    _excuteFuture();
  }

  Future<void> _excuteFuture() async {
    try {
      final result = await widget.future;

      if (mounted) {
        Navigator.pop(context, result);
      } else {
        Navigator.pop(context, result);
      }
    } catch (e) {
      Navigator.pop(context);
    }
    // if(context.mounted){
    //   Timer(Duration(seconds: 12), (){
    //     Navigator.pop(context);
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return widget.expanded
        ? _buildExpandedLoadingDialog()
        : _buildSimpleLoadingDialog();
  }

  Widget _buildSimpleLoadingDialog() {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StackLoadingBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedLoadingDialog() {
    return PopScope(
      canPop: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          StackLoadingBar(),
        ],
      ),
    );
  }
}