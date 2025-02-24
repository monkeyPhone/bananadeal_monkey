import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../rank_phone_controller.dart';

class RankTapMenu extends GetView<RankPhoneController> {
  final List content;
  final int currentTap;
  const RankTapMenu({
    required this.content,
    required this.currentTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5,
              (index) =>
                  GestureDetector(
                    onTap: (){
                      controller.tapClick(index);
                    },
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: WidgetSize(context).sizedBox30,
                        maxWidth: double.infinity,
                        minHeight: WidgetSize(context).width01,
                      ),
                      decoration: BoxDecoration(
                          color: currentTap == index
                              ? Style.yellow
                              : Style.greyF4F4F4,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(WidgetSize(context).sizedBox12),
                            topLeft: Radius.circular(WidgetSize(context).sizedBox12),
                          ),
                          border: Border.all(
                              color: currentTap == index
                                  ? Colors.transparent
                                  : Style.greyD7D7D7,
                              width: WidgetSize(context).width00025)),
                      child: Center(
                          child: Text(
                            '    ${content[index]}    ',
                            style: TextStyle(
                                fontSize: WidgetSize(context).sizedBox18,
                                fontWeight: FontWeight.w400,
                                color: currentTap == index
                                    ? Style.brown
                                    : Style.blackWrite),
                          )),
                    ),
                  )
      ),
    );
  }
}
