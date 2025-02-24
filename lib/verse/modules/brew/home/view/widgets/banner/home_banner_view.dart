import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/manager/home_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/state/bloc/banana_home_banner/banana_home_banner_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/carousel/widget/bd_carousel_slider_ui.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBannerView extends StatelessWidget {
  const HomeBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaHomeBannerBloc, BananaHomeBannerState>(
        // buildWhen: (previous, current) => current.statusEnum == StatusEnum.success || previous.statusEnum != StatusEnum.success,
        builder: (context, state) => switch(state.statusEnum){
          StatusEnum.success => BdCarouselSliderUi(
            list: state.bannerList,
            size: context.read<VerseConfig>().size, place: CarouselPlaceEnum.banner,
          ),
          StatusEnum.initial => const _LoadingWidget(),
          StatusEnum.loading => const _LoadingWidget(),
          _ => const _ErrorWidget(),
        }
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.read<VerseConfig>().size.widthCommon,
      height: context.read<VerseConfig>().size.ratio58,
      child: const BdLoadingSpin(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.read<VerseConfig>().size.widthCommon,
      height: context.read<VerseConfig>().size.imageHeight,
      child: BdRefreshButton(
        onTap: (){
          context.read<HomeManager>().homeBannerRefresh(context);
        },
      ),
    );
  }
}