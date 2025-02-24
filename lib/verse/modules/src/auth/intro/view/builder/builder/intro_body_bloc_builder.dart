import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/manager/intro_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/state/bloc/banana_intro/banana_intro_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/view/widgets/body/intro_image_area_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/common_error_page.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/carousel/src/helpers/carousel_controller.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroBodyBlocBuilder extends StatelessWidget {
  const IntroBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaIntroBloc, BananaIntroState>(
        buildWhen: (previous, current) => current.statusEnum == StatusEnum.success || previous.statusEnum != StatusEnum.success,
        builder: (context, state) =>
        switch(state.statusEnum){
          StatusEnum.success || StatusEnum.later =>
              IntroImageAreaView(
                content: state.imageList,
                defaultList: state.defaultList,
                carouselController: CarouselController(),
              ),
          StatusEnum.loading || StatusEnum.initial => const BdLoadingSpin(),
          _ =>
              CommonErrorPage(
                size: context.read<VerseConfig>().size,
                error: state.error,
                onTap: (){
                  context.read<IntroManager>().eventImageFetched(context);
                },
              )
        }
    );
  }
}
