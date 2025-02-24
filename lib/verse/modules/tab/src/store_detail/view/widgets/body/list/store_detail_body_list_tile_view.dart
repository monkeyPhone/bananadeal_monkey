import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/widgets/body/list/store_detail_body_list_tile_profile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/widgets/body/list/tab/store_detail_body_list_tile_profile_tab_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/carousel/widget/bd_carousel_slider_ui.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_ratio58_pad32.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StoreDetailBodyListTileView extends StatelessWidget {
  const StoreDetailBodyListTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _Carousel(),
        StoreDetailBodyListTileProfileView(),
        StoreDetailBodyListTileProfileTabView(),
        BdCustomPad(padEnum: PadEnum.heightFloating),
        _PhaseGap(),
        BdCustomPad(padEnum: PadEnum.heightFloating),
      ],
    );
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel();

  @override
  Widget build(BuildContext context) {
    return BdLayoutRati58Pad32(
        child: BdCarouselSliderUi(
          size: context.read<VerseConfig>().size,
          place: CarouselPlaceEnum.storeDetail,
          list: context.read<BananaStoreDetailBloc>().state.imageList,
          autoPlay: false,
        )
    );

  }
}

class _PhaseGap extends StatelessWidget {
  const _PhaseGap();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdAssetImageBinder(
        imageHeight: size.ratio58,
        imageWidth: size.widthCommon,
        imageUrl: defaultNotice
    );


    //   BlocSelector<BananaStoreDetailInfoBloc, BananaStoreDetailInfoState, List<(String, String)>>(
    //     selector: (state) => state.eventList,
    //     builder: (context, eventList) => eventList.length > 3
    //         ? const SizedBox()
    //         : Container(
    //       color: greyEAEAEA,
    //       height: widgetSize.heightCommon - ((widgetSize.ratio58*2) + (widgetSize.sized32grid*4) + (widgetSize.sizedAppbar*3)) > 0
    //         ? widgetSize.heightCommon - ((widgetSize.ratio58*2) + (widgetSize.sized32grid*4) + (widgetSize.sizedAppbar*3))
    //         : widgetSize.sizedAppbar + widgetSize.sized32grid,
    //     )
    // );
  }
}