import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/manager/intro_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/auth/intro/state/bloc/banana_intro/banana_intro_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../widgets/image/carousel/src/_flutter_carousel_widget.dart';
import '../../../../../../../widgets/image/carousel/src/enums/center_page_enlarge_strategy.dart';
import '../../../../../../../widgets/image/carousel/src/helpers/carousel_controller.dart';
import '../../../../../../../widgets/image/carousel/src/helpers/carousel_options.dart';

class IntroImageAreaView extends StatelessWidget {
  final List<String> content;
  final List<String> defaultList;
  final CarouselController carouselController;
  const IntroImageAreaView({super.key,
    required this.content,
    required this.defaultList,
    required this.carouselController
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        _SliderIndexBuilder(
          carouselController: carouselController,
          size: size,
        ),
        _Carousel(
          content: content,
          defaultList: defaultList,
          carouselController: carouselController,
          size: size,
        ),
      ],
    );
  }
}



class _Carousel extends StatelessWidget {
  final List<String> content;
  final List<String> defaultList;
  final CarouselController carouselController;
  final CommonSize size;
  const _Carousel({
    required this.content,
    required this.defaultList,
    required this.carouselController,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterCarousel.builder(
          itemCount: content.isNotEmpty
              ? content.length
              : defaultList.length,
          options: CarouselOptions(
              height: size.heightCommon,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              controller: carouselController,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              pauseAutoPlayOnTouch: true,
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayInFiniteScroll: false,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              disableCenter: true,
              showIndicator: false,
              onPageChanged: (index, reason) {
                context.read<IntroManager>().eventImageIndex(index: index, context: context);
              }
          ),
          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
          content.isNotEmpty
              ? BdImageBinder(
              imageWidth: size.widthCommon,
              imageHeight: size.heightCommon,
              imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}${content[index]}',
              errUrl: defaultImg,
              imageLabel: 'carousel'
          )

              : Image.asset(
            defaultList[index], fit: BoxFit.fill,)
      ),
    );
  }
}


class _SliderIndexBuilder extends StatelessWidget {
  final CarouselController carouselController;
  final CommonSize size;
  const _SliderIndexBuilder({
    required this.carouselController,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context){
          final bloc = context.watch<BananaIntroBloc>();
          final BananaIntroState state = bloc.state;
          // List<IntroImageContent> list =
          // state.dataEntity.data.isNotEmpty
          //     ? context.read<AuthIntroEvent>().convertList(state.dataEntity.data)
          //     : [];
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.sizedBox8),
            child: switch(state.statusEnum){
              StatusEnum.success =>
              state.imageList.length > 15
                  ?  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BdTextWidget(text: '${state.currentIndex+1}', textStyle: sub, ),
                  const BdTextWidget(text: '  /  ', textStyle: sub, ),
                  BdTextWidget(text: '${state.imageList.length}', textStyle: sub,),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.imageList
                    .asMap()
                    .entries
                    .map((entry) {
                  return GestureDetector(
                    onTap: () async {
                      context.read<IntroManager>().eventImageIndex(context: context, index: entry.key);
                      await carouselController.animateToPage(entry.key);
                    },
                    child: Container(
                      width: size.sizedBox9,
                      height: size.sizedBox9,
                      margin: EdgeInsets.all(size.sizedBox6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state.currentIndex == entry.key
                              ? karajeck
                              : greyEAEAEA
                      ),
                    ),
                  );
                }).toList(),
              ),
              _ =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.defaultList
                        .asMap()
                        .entries
                        .map((entry) {
                      return Container(
                        width: size.sizedBox9,
                        height: size.sizedBox9,
                        margin: EdgeInsets.all(size.sizedBox6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.currentIndex ==
                                entry.key ? karajeck
                                : greyCCCCCC
                        ),
                      );
                    }).toList(),
                  )
            },
          );
        }
    );
  }
}

