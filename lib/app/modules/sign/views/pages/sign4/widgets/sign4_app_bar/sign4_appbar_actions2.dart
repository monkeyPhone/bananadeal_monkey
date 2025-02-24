import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../controllers/sign_view_4_controller.dart';

class Sign4AppbarActions2 extends StatelessWidget {
  const Sign4AppbarActions2({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetX<SignView4Controller>(
      builder: (controller){
        return controller.longtitude.value == '' && controller.latitude.value == '' && controller.dong.value == '' && controller.addr.value == ''
                  ?   SizedBox()
                : TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Style.grey999999
                    ),
                  onPressed: () {
                      controller.initSelect();
                      },
                  child: Row(
                    children: [
                      Text('재검색',
                        style: TextStyle(
                            fontSize: WidgetSize(context).sizedBox17,
                            color: Colors.red
                        ),
                      ),
                      SizedBox(width: WidgetSize(context).sizedBox5,)
                    ],
                  ),
        );
      },
    );
  }
}
