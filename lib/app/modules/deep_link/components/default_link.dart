import 'package:flutter/material.dart';

import '../../../css/app_basic_component/bagic_canvas.dart';
import '../../../css/app_basic_component/basic_app_bar.dart';

class DefaultLink extends StatelessWidget {
  const DefaultLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop:  true,
        body: Column(
          children: [
            BasicAppbar(title: Text('잘못된 접근입니다.')),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        ''
                    ),
                  ],
                )
            )
          ],
        )
    );
  }
}
