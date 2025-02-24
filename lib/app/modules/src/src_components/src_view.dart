import 'dart:io';

import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/bottom_nav_bar/controllers/bd_bot_nav_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/src_body/src_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/src_body/src_floatingaction.dart';
import 'package:flutter/material.dart';
import '../../../css/app_basic_component/bagic_canvas.dart';
import 'bottom_nav_bar/bd_bot_nav.dart';


class SrcView extends StatelessWidget {
  const SrcView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: Platform.isIOS ? (details){
        if(details.primaryVelocity! > 0){
          BdBotNavController.to.srcBackFunc(context);
        }
      } : null,
      child: BasicCanvas(
        canPop: false,
        onPopInvoked: (bool didPop, Object? result) {
          if(didPop){
            return;
          }
          BdBotNavController.to.srcBackFunc(context);
        },
        body: SrcBody(),
        bottomNavigationBar: BdBotNav(),
        floatingActionButton: SrcFloatingRoute(),
      ),
    );
  }
}
