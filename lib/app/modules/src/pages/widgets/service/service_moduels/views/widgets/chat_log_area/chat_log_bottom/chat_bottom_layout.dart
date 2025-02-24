import 'package:flutter/material.dart';

class ChatBottomLayOut extends StatelessWidget {
  const ChatBottomLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return  Builder(
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final safeAreaPadding = MediaQuery.of(context).padding.bottom;
              final keyboardHeight = MediaQuery.of(context).viewInsets.bottom - safeAreaPadding;
              final adjustedHeight = keyboardHeight > 0 ? keyboardHeight : 0.0;
              return AnimatedPadding(
                padding: EdgeInsets.only(bottom: adjustedHeight),
                duration: const Duration(milliseconds: 1),
                curve: Curves.easeOutQuad,
                child: SizedBox(),
              );
            },
          );
        }
    );
  }
}
