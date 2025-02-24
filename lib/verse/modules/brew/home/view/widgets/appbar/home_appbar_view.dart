import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/state/cubit/banana_fcm/banana_fcm_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_side.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_state_text_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppbarView extends StatelessWidget {
  const HomeAppbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdLayoutSide(
        sidePadding: SidePadding.customAppbar,
        child: _HomeAppbar()
    );
  }
}


class _DealBanner extends StatelessWidget {
  const _DealBanner();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
      onTap: () {

      },
      child: FittedBox(
          fit: BoxFit.contain,
          child: BdAssetImageBinder(
            imageHeight: size.sizedBox34,
            imageWidth: (746/250)*size.sizedBox34, imageUrl: bananaLogoOri, boxFit: BoxFit.contain,)),
    );
  }
}


class _HomeAppbar extends StatelessWidget {
  const _HomeAppbar();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _DealBanner(),
        Row(
          children: [
            if(!kIsWeb)
              Stack(
                children: [
                  BdRippleIconsButton(
                    size: context.read<VerseConfig>().size,
                    onTap: (){
                      context.read<BroadManager>().gotoFcmView(context);
                    },
                    icon: CupertinoIcons.bell,
                  ),
                  const _HomeStackIcon()
                ],),
            const BdCustomPad(padEnum: PadEnum.width12),
            const BdUiStateTextAppbar(),
          ],
        )
      ],
    );
  }
}



class _HomeStackIcon extends StatelessWidget {
  const _HomeStackIcon();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocBuilder<BananaFcmCubit, BananaFcmState>(
        builder: (context, state) =>
        state.isReadNotice == true && state.isReadNotice  == true
            ? const SizedBox()
            : Positioned(
            top: size.sizedBox4,
            left: size.sizedBox4,
            child: Container(
              width: size.sizedBox6_5,
              height: size.sizedBox6_5,
              decoration: BoxDecoration(
                  color: cocacolaRed,
                  borderRadius: BorderRadius.circular(999)
              ),
            )
        )
    );
  }
}