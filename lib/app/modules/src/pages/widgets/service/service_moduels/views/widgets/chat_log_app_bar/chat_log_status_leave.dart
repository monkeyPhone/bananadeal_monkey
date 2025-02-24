import 'package:flutter/material.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';


class ChatLogStatusLeave extends StatelessWidget {
  final String storeName;
  const ChatLogStatusLeave({
    required this.storeName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('대화 상대가 없습니다.',
          style: TextStyle(
              color: Style.blackWrite,
              fontSize: WidgetSize(context).sizedBox22,
              fontWeight: FontWeight.w700
          ), maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(storeName,
          style: TextStyle(
              color: Style.blackWrite,
              fontSize: WidgetSize(context).sizedBox18,
              fontWeight: FontWeight.w700
          ), maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
