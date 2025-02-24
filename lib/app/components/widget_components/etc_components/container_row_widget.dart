import 'package:flutter/material.dart';

import '../../../css/size.dart';
import '../../../css/style.dart';


class ContainerRowWidget extends StatelessWidget {
  final String title;
  final bool isWhere;
  final bool isEmptyList;
  const ContainerRowWidget({super.key,
    required this.title,
    required this.isWhere,
    required this.isEmptyList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child:
          isWhere ?
          Text('${title}',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: WidgetSize(context).etcTitleSize,
                color: Style.blackWrite
            ),
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
              :  FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text('${title}',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: WidgetSize(context).etcTitleSize,
                  color: Style.blackWrite
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          width: WidgetSize(context).sizedBox16,
        ),
        isEmptyList
            ?
        Icon(Icons.arrow_forward_ios, size: WidgetSize(context).etcPad, color: Style.grey999999,)
            :
        SizedBox()
      ],
    );
  }
}
