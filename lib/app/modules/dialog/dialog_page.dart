import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  final PopInvokedWithResultCallback onPopInvoked;
  final Widget body;
  const DialogPage({
    super.key,
    required this.onPopInvoked,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: onPopInvoked,
        child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: body)

        // Scaffold(
        //   resizeToAvoidBottomInset: false,
        //   backgroundColor: Colors.transparent,
        //   appBar: AppBar(),
        //   body: body,
        // )
    );

  }
}
