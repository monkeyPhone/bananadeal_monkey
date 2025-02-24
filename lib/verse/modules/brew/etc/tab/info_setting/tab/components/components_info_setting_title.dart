import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/components/components_info_setting_page.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComponentsInfoSettingTitle extends StatelessWidget {
  final String title;
  const ComponentsInfoSettingTitle({super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ComponentsInfoSettingPage(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BdTextWidget(text: title, textStyle: titleLittleBold,),
            BdRippleButtonBasic(
                onTap: (){
                  context.read<VerseConfig>().route.closeDialog(context);
                },
                child: const BdLayoutPadding(
                    padding: PaddingEnum.all8,
                    child: BdTextWidget(text: '닫기', textStyle: subRed,))
            )
          ],
        )
    );
  }
}
