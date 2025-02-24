import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';

class HomeLoadingBar extends StatelessWidget {
  const HomeLoadingBar({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Positioned(
        left: 0,
        right: 0,
        bottom: WidgetSize(context).sizedBox16,
        child: Center(
            child: CircularProgressIndicator(
              color: Style.progressBar,
            )
        )
    )
        : Positioned.fill(
        child: Container(
          color: Colors.black45,
          child: Center(
              child: CircularProgressIndicator(
                color: Style.progressBar,
              )
          ),
        )
    );
  }
}
