import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../../../../css/style.dart';

class InquirySendDefaultImage extends StatelessWidget {
  const InquirySendDefaultImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AppElement.defaultImgIcon,
        fit: BoxFit.fitHeight,
        colorFilter: ColorFilter.mode(Style.greyCCCCCC, BlendMode.srcIn),
      ),
    );
  }
}
