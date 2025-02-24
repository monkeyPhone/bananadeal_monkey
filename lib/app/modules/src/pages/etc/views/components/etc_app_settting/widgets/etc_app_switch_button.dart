import 'package:flutter/cupertino.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class EtcAppSwitchButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool? isSub;
  const EtcAppSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.isSub,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).sizedBox70,
      height:  WidgetSize(context).sizedBox45,
      child: FittedBox(
        fit: BoxFit.fill,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: Style.yellow,
        ),
      ),
    );
  }
}
