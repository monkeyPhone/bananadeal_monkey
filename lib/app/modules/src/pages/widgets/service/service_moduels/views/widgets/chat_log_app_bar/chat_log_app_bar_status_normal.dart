import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';


class ChatLogAppBarStatusNormal extends StatelessWidget {
  final String storeName;
  const ChatLogAppBarStatusNormal({
    required this.storeName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(storeName,
      style: TextStyle(
          color: Style.blackWrite,
          fontSize: WidgetSize(context).sizedBox22,
          fontWeight: FontWeight.w700
      ), maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
