import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/manager/permission_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/view/builder/selector/permission_nav_selector.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/view/widgets/body/permission_body_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/onboarding/permission/view/widgets/observer/permission_background_observer.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PermissionView extends StatelessWidget {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: ('접근 권한 안내', null, _LeadingWidget(), PermissionBackgroundObserver()),
      body: PermissionBodyView(),
      isCanPop: false,
      navbarWidget: PermissionNavSelector(),
    );
  }
}


class _LeadingWidget extends StatelessWidget {
  const _LeadingWidget();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Row(
      children: [
        const BdCustomPad(padEnum: PadEnum.width16),
        BdRippleButtonStack(
            onTap: (){
              context.read<PermissionManager>().leadingButton(context);
            },
            isDelay: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.sizedBox3),
              child: BdAssetImageBinder(
                imageWidth: size.sizedAppbar - size.sizedPaddingOnlyAppBar*2,
                imageHeight:size.sizedAppbar - size.sizedPaddingOnlyAppBar*2,
                imageUrl: bananaLaunch,
                boxFit: BoxFit.fill,
              ),
            )
        ),
        SizedBox(width: size.sizedPaddingOnlyAppBar,),
      ],
    );
  }
}

