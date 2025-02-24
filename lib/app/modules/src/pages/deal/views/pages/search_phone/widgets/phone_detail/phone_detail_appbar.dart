import 'package:flutter/material.dart';
import '../../../../../../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class PhoneDetailAppBar extends StatelessWidget {
  final String psName;
  const PhoneDetailAppBar({
    required this.psName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppbar(
      title: Text(
        psName,
        style: TextStyle(
            color: Style.blackWrite,
            fontSize: psName.length > 25 ? WidgetSize(context).sizedBox17 : psName.length > 20 ? WidgetSize(context).sizedBox20 : WidgetSize(context).sizedBox24,
            fontWeight: FontWeight.w700
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
