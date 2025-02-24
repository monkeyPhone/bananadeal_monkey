import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../alert_noti_controller.dart';



class AlertAppBarActions extends StatelessWidget {
  const AlertAppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlertNotiController>(
        builder: (aln) {
          return
            aln.notiDeal.isNotEmpty && aln.currentTap.value == 0
                ?  GestureDetector(
                      onTap: () {
                         aln.clickDeleteDealButton(context);
                      },
                      child: Container(
                          color: Style.white,
                          height: WidgetSize(context).sizedBox50,
                          width: WidgetSize(context).sizedBox50,
                          child: Center(
                              child:  Text(
                                '삭제',
                                style: TextStyle(
                                    color: Style.red,
                                    fontWeight: FontWeight.w400,
                                    fontSize: WidgetSize(context).sizedBox17
                                ),
                              )
                          )
                        ),
                      )
                :  aln.notiEtc.isNotEmpty && aln.currentTap.value == 1
                       ?  GestureDetector(
                              onTap: () {
                                 aln.clickDeleteEtcButton(context);
                                },
                              child: Container(
                                  color: Style.white,
                                  height: WidgetSize(context).sizedBox50,
                                  width: WidgetSize(context).sizedBox50,
                                  child: Center(
                                      child:  Text(
                                        '삭제',
                                        style: TextStyle(
                                            color: Style.red,
                                            fontWeight: FontWeight.w400,
                                            fontSize: WidgetSize(context).sizedBox17
                                        ),
                                      )
                                    )
                                  ),
                            )

                       : const SizedBox();
        }
    );
  }
}
