import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/result_area_components/change_default_view.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/size.dart';
import '../../result_area.dart';

class ChangeMapPageRouter extends StatelessWidget {
  final BuildContext mediaContext;
  const ChangeMapPageRouter({
    required this.mediaContext,
    super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(mediaContext).viewInsets.bottom > 0
            ? Padding(
              padding: EdgeInsets.only(
                  top: WidgetSize(context).sizedBox24
              ),
              child: ChangeDefaultView(),
            )
            : ResultArea();
  }


}
