import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/basic_app_bar_text.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_bookmark_setting/widgets/etc_book_mark_setting_list.dart';
import 'package:flutter/material.dart';


class EtcBookMarkSettingView extends StatelessWidget {
  const EtcBookMarkSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: BasicCanvas(
          canPop: true,
          body: Column(
            children: [
              BasicAppbar(
                  title: BasicAppBarText(text: '단골매장 관리')),
              Expanded(
                  child: EtcBookMarkSettingList()
              )

            ],
          )
      )


    );
  }
}
