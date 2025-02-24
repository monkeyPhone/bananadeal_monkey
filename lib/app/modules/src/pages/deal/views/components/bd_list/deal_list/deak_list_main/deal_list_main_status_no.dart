import 'package:flutter/material.dart';

import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';

class DealListMainStatusNo extends StatelessWidget {
  final double width;
  final double height;
  const DealListMainStatusNo({super.key,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: WidgetSize(context).paddingBodyWhole,
      color: Style.white,
      width: width,
      height: height,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _greyText('등록된 딜이 없어요\n', context),
                _greyText('+ 버튼을 눌러', context),
                _greyText('새로운 딜을 시작해보세요!', context)
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _greyText(String text, BuildContext context){
    return  Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox18,
          fontWeight: FontWeight.w700,
          color: Style.grey999999
      ),
    );
  }

}
