import 'package:flutter/material.dart';

import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';

class ReservationDivider extends StatelessWidget {
  final String mainText;
  final String otherText;
  const ReservationDivider({super.key,
  required this.mainText,
    required this.otherText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: WidgetSize(context).sizedBox16,
          right: WidgetSize(context).sizedBox16,
          left: WidgetSize(context).sizedBox16),
      child: Stack(
        children: [
          SizedBox(
            width: WidgetSize(context).widthCommon,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: WidgetSize(context).sizedBox10,
                      horizontal: WidgetSize(context).sizedBox14
                  ),
                  color: Style.yellow,
                  child: Text(
                    mainText,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: WidgetSize(context).sizedBox21,
                        color: Style.blackWrite
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      otherText,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: WidgetSize(context).sizedBox15,
                          color: Style.blackWrite
                      ),
                    ),
                    SizedBox(
                      width: WidgetSize(context).sizedBox8,
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
            color: Style.yellow,
            width: WidgetSize(context).widthCommon,
            height: WidgetSize(context).sizedBox3,
          ))
        ],
      ),
    );


    //   Stack(
    //   children: [
    //     Container(
    //       margin: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox16),
    //       color: Style.yellow,
    //       height: WidgetSize(context).sizedBox45,
    //       width: WidgetSize(context).widthCommon,
    //       padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
    //       child: Text(mainText,
    //         style: TextStyle(
    //           fontWeight: FontWeight.w700,
    //           fontSize: WidgetSize(context).sizedBox22,
    //           color: Style.blackWrite
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       right: WidgetSize(context).sizedBox15,
    //       bottom: WidgetSize(context).sizedBox3,
    //         child: Container(
    //           height: WidgetSize(context).sizedBox45,
    //
    //           color: Style.white,
    //           child: Text(
    //               otherText,
    //             style: TextStyle(
    //                 fontWeight: FontWeight.w400,
    //                 fontSize: WidgetSize(context).sizedBox20,
    //                 color: Style.blackWrite
    //             ),
    //           ),
    //         )
    //     )
    //   ],
    // );
  }
}
