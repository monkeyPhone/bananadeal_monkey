import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../../../../components/loading.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../widgets/components/change_map_appbar_icon_button.dart';

class StoreDefault extends StatelessWidget {
  const StoreDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: WidgetSize(context).paddingBodyWhole,
      child: Column(
        children: [
          SizedBox(
            height: WidgetSize(context).height60px,
            width: WidgetSize(context).widthCommon,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox15,
                      color: Style.bananaGreen,
                      shadows: const [
                        Shadow(
                          blurRadius: 7.0,
                          color: Colors.white,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText('위치 설정을 완료해주세요 => '),
                      ],
                      onTap: () {
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: WidgetSize(context).sizedBox10,
                ),
                ChangeMapAppbarIconButton(),
              ],
            ),
          ),
          const Expanded(child: DefaultView(text1: '매장을 검색할수 없어요.', text2: '위치설정을 완료해주세요!'))
        ],
      ),
    );
  }
}
