import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../src/_flutter_carousel_widget.dart';
import '../src/enums/carousel_page_changed_reason.dart';
import '../src/enums/center_page_enlarge_strategy.dart';
import '../src/helpers/carousel_options.dart';


class BdCarouselSliderUi extends StatefulWidget {
  final CommonSize size;
  final CarouselPlaceEnum place;
  final List<dynamic> list;
  final bool? autoPlay;
  final bool? isDownLoad;
  const BdCarouselSliderUi({
    super.key,
    required this.size,
    required this.place,
    required this.list,
    this.autoPlay,
    this.isDownLoad
  });

  @override
  State<BdCarouselSliderUi> createState() => _BdCarouselSliderUiState();
}

class _BdCarouselSliderUiState extends State<BdCarouselSliderUi> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Carousel(
            size: widget.size,
            place: widget.place,
            list: widget.list,
            isDownLoad: widget.isDownLoad,
            autoPlay: widget.autoPlay,
            onPageChanged:  (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            }),
        _IndexArea(
          size: widget.size,
          max: widget.list.length,
          currentIndex: _currentIndex+1,)
      ],
    );
  }
}



class _Carousel extends StatelessWidget {
  final CommonSize size;
  final CarouselPlaceEnum place;
  final List<dynamic> list;
  final bool? autoPlay;
  final bool? isDownLoad;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  const _Carousel({
    required this.size,
    required this.place,
    required this.list,
    required this.onPageChanged,
    required this.autoPlay,
    required this.isDownLoad,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
        itemCount: list.length,
        options: CarouselOptions(
            aspectRatio: 8 / 5,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: list.length != 1,
            reverse: false,
            autoPlay: autoPlay != null
                ? autoPlay!
                : list.length != 1,
            autoPlayInterval: const Duration(seconds: 7),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            pauseAutoPlayOnTouch: true,
            pauseAutoPlayOnManualNavigate: true,
            pauseAutoPlayInFiniteScroll: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            disableCenter: false,
            showIndicator: false,
            onPageChanged: onPageChanged
        ),
        itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
            Center(
              child: _Image(
                size: size,
                index: index,
                place: place,
                banner: place == CarouselPlaceEnum.banner ? list[index] : null,
                imageList: place == CarouselPlaceEnum.storeDetail ? list.map((e) => e.toString()).toList() : null,
                isDownLoad: isDownLoad,
              ),
            )
    );
  }
}

class _Image extends StatelessWidget {
  final CommonSize size;
  final int index;
  final CarouselPlaceEnum place;
  final HomeBannerVO? banner;
  final List<String>? imageList;
  final bool? isDownLoad;
  const _Image({
    required this.size,
    required this.index,
    required this.place,
    required this.banner,
    required this.imageList,
    this.isDownLoad,
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonStack(
        onTap: switch(place){
          CarouselPlaceEnum.storeDetail =>
              () async{
            if(imageList != null){
              context.read<VerseConfig>().browser.image.openDialog(
                  routerContext: context,
                  currentIndex: index,
                  imageList: imageList!,
                  isDownload: isDownLoad ?? false,
                  baseUrl: context.read<VerseConfig>().url.imageBananaUrl
              );
            }
          },
        CarouselPlaceEnum.banner =>
          (){
            context.read<BroadManager>().carouselTapEvent(context: context, banner: banner);
          }
        },
        isDelay: true,
        child: BdImageBinder(
          imageWidth: size.widthCommon,
          imageHeight: size.ratio58,
          imageUrl: imageList != null
              ? '${context.read<VerseConfig>().url.imageBananaUrl}${imageList![index]}'
              : '${context.read<VerseConfig>().url.imageBananaUrl}${banner!.bmPathImg}',
          errUrl: defaultNotice,
          imageLabel: imageList != null ? 'thumb':'carousel',
        )
    );
  }
}


class _IndexArea extends StatelessWidget {
  final CommonSize size;
  final int max;
  final int currentIndex;

  const _IndexArea({
    required this.size,
    required this.max,
    required this.currentIndex
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: size.sizedBox5,
      right: size.sizedBox5,
      child: max == 1
          ? const SizedBox()
          : Container(
          width: size.sizedBox40,
          height: size.sizedBox20,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(size.sizedBox5)
          ),

          child:  Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$currentIndex / $max',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.sizedBox10_5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
      ),
    );
  }
}
