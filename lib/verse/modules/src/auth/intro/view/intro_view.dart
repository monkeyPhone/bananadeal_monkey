import 'dart:developer';

import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/manager/intro_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/view/builder/builder/intro_body_bloc_builder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      body: IntroBodyBlocBuilder(),
      navbarWidget: _Nav(),
      isCanPop: false,
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {

    return BdNeoButton(
      size: context.read<VerseConfig>().size,
      text: '시작하기',
      onPressed: () {
        context.read<IntroManager>().gotoLogin(context);
      },
    );
  }
}