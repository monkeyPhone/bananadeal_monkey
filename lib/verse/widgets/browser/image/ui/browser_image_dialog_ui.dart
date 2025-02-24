import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/image/bloc/banana_browser_image/banana_browser_image_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/image/manager/browser_image_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/carousel/src/_flutter_carousel_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/carousel/src/enums/center_page_enlarge_strategy.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/carousel/src/helpers/carousel_controller.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/carousel/src/helpers/carousel_options.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';


class BrowserImageDialogUi extends StatelessWidget {
  final int currentIndex;
  final List<String> imageList;
  final bool isDownload;
  final String baseUrl;
  const BrowserImageDialogUi({super.key,
    required this.currentIndex,
    required this.imageList,
    required this.isDownload,
    required this.baseUrl,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BrowserImageManager>(
            create: (BuildContext context) =>
                BrowserImageManager(
                  baseUrl: baseUrl
                ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaBrowserImageBloc>(
                create: (BuildContext context) =>
                BananaBrowserImageBloc()..add(
                    GetImageListBBIE(
                        currentIndex: currentIndex,
                        imageList: imageList
                    )
                )
            ),
          ],
          child: _Body(
            currentIndex: currentIndex,
            imageList: imageList,
            isDownload: isDownload,
            baseUrl: baseUrl,
          ),
        )
    );
  }
}

class _Body extends StatelessWidget {
  final int currentIndex;
  final List<String> imageList;
  final bool isDownload;
  final String baseUrl;
  const _Body({
    required this.currentIndex,
    required this.imageList,
    required this.isDownload,
    required this.baseUrl
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
          children: [
            _ImageFul(
              currentIndex: currentIndex,
              imageList: imageList,
              isDownload: isDownload,
              baseUrl: baseUrl,
            )
          ],
        )
    );
  }
}

class _ImageFul extends StatefulWidget {
  final int currentIndex;
  final List<String> imageList;
  final bool isDownload;
  final String baseUrl;
  const _ImageFul({
    required this.currentIndex,
    required this.imageList,
    required this.isDownload,
    required this.baseUrl
  });

  @override
  State<_ImageFul> createState() => _ImageFulState();
}

class _ImageFulState extends State<_ImageFul> {
  late final TransformationController _transformationController;
  late final CarouselController _carouselController;
  late final ScrollController _scrollController;
  bool _isExpand = false;
  bool _isGrid = false;

  void _expandImage(){
    setState(() {
      _isExpand = true;
    });
  }

  void _expandCancel(){
    setState(() {
      _transformationController.value = Matrix4.identity();
      _isExpand = false;
    });
  }

  void _gridImage(){
    setState(() {
      _isGrid = true;
    });
  }

  void _gridCancel(){
    setState(() {
      _isGrid = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    _transformationController = TransformationController();
    _carouselController = CarouselController();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _transformationController.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  Expanded(
      child:  Column(
        children: [
          Expanded(
            child: Container(
              color: karajeck,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double expandedWidth = constraints.maxWidth;
                  double expandedHeight = constraints.maxHeight;
                  return Stack(
                    children: [
                      _CarouselView(
                        zoomIn: (){
                          _expandImage();
                        },
                        transformationController: _transformationController,
                        isExpand: _isExpand,
                        imageList: widget.imageList,
                        controller: _carouselController,
                        carouselHeight: size.heightCommon,
                        imageWidth: expandedWidth,
                        imageHeight: expandedHeight,
                        current: widget.currentIndex,
                        baseUrl: widget.baseUrl,
                        size: size,
                      ),
                      _isGrid ?
                      Positioned.fill(
                          child: Container(
                            color: karajeck,
                            child: Scrollbar(
                              controller: _scrollController,
                              thumbVisibility: true,
                              child: GridView.builder(
                                  controller: _scrollController,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: size.sizedBox2,
                                    crossAxisSpacing: size.sizedBox2,
                                  ),
                                  itemCount: widget.imageList.length,
                                  itemBuilder: (BuildContext context, int index) =>
                                      BdRippleButtonStack(
                                          onTap: (){
                                            _carouselController.jumpToPage(index);
                                            _gridCancel();
                                          },
                                          isDelay: true,
                                          child: BdImageBinder(
                                              imageWidth:  size.sizedBox181,
                                              imageHeight: size.sizedBox181,
                                              imageUrl: '${widget.baseUrl}${widget.imageList[index]}',
                                              errUrl: defaultImg,
                                              imageLabel: 'thumb'
                                          )
                                      )
                              ),
                            ),
                          )
                      )
                          :
                      Positioned(
                          child: _isExpand ? _ExpandView(
                            onTap: (){
                              _expandCancel();
                            },
                            imageList: widget.imageList,
                            controller: _transformationController,
                            imageWidth: expandedWidth,
                            imageHeight: expandedHeight,
                            baseUrl: widget.baseUrl,
                            size: size,
                          ) : const SizedBox()
                      ),

                      Positioned.fill(
                          child: widget.isDownload ? const _DownLoadPage() : const SizedBox()
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          _BottomAppbar(
            imageListLength: widget.imageList.length,
            isExpand: _isExpand,
            isGrid: _isGrid,
            isDownload: widget.isDownload,
            zoomIn: (){
              _expandImage();
            },
            zoomOut: (){
              _expandCancel();
            },
            gridIn: (){
              _gridImage();
            },
            gridOut: (){
              _gridCancel();
            },
            satback: (){
              // log(_carouselController.ready.toString());
              if(_carouselController.ready){
                _carouselController.jumpToPage(widget.currentIndex);
              }
            }, size: size,
          )
        ],
      ),
    );
  }

}

class _DownLoadPage extends StatelessWidget {
  const _DownLoadPage();

  @override
  Widget build(BuildContext context) {

    return BlocSelector<BananaBrowserImageBloc, BananaBrowserImageState, DownLoadEnum>(
        selector: (state)=> state.downloadState,
        builder: (context, download)=>
        download == DownLoadEnum.initial
            ? const SizedBox()
            : BlocBuilder<BananaBrowserImageBloc, BananaBrowserImageState>
          (builder: (context, state) =>
            GestureDetector(
              onTap: (){
                if( state.downloadState == DownLoadEnum.fail){
                  context.read<BrowserImageManager>().downLoadClose(context);
                }
              },
              child: Container(
                  color: Colors.black54,
                  child: Center(
                    child: BdTextWidget(
                      text: state.value,
                      textStyle: bodyWhite,
                    ),
                  )
              ),
            )
        )
    );
  }
}



class _ExpandView extends StatelessWidget {
  final TransformationController controller;
  final double imageWidth;
  final double imageHeight;
  final List<String> imageList;
  final GestureTapCallback onTap;
  final String baseUrl;
  final CommonSize size;

  const _ExpandView({
    required this.controller,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageList,
    required this.onTap,
    required this.baseUrl,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<BananaBrowserImageBloc, BananaBrowserImageState, int>(
        selector: (state)=> state.currentIndex,
        builder: (context, current) =>
            InteractiveViewer(
                transformationController: controller,
                maxScale: 7.0,
                minScale: 0.5,
                panAxis: PanAxis.free,
                constrained: true,
                child: ClipRRect(
                    child: GestureDetector(
                      onTap: onTap,
                      child: BdImageBinder(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.sizedBox4,
                              vertical: size.sizedBox8
                          ),
                          imageWidth: imageWidth,
                          imageHeight: imageHeight,
                          imageUrl: '$baseUrl${imageList[current]}',
                          errUrl: defaultImg,
                          imageLabel: 'carousel'
                      ),
                    )
                )
            )
    );
  }
}


class _CarouselView extends StatelessWidget {
  final bool isExpand;
  final List<String> imageList;
  final int current;
  final CarouselController controller;
  final TransformationController transformationController;
  final double carouselHeight;
  final double imageWidth;
  final double imageHeight;
  final GestureTapCallback zoomIn;
  final String baseUrl;
  final CommonSize size;



  const _CarouselView({
    required this.isExpand,
    required this.imageList,
    required this.current,
    required this.controller,
    required this.transformationController,
    required this.carouselHeight,
    required this.imageWidth,
    required this.imageHeight,
    required this.zoomIn,
    required this.baseUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
        itemCount: imageList.length,
        options: CarouselOptions(
            physics: isExpand ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
            controller: controller,
            height: carouselHeight,
            viewportFraction: 1.0,
            initialPage: current,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            pauseAutoPlayOnTouch: false,
            pauseAutoPlayOnManualNavigate: false,
            pauseAutoPlayInFiniteScroll: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            disableCenter: true,
            showIndicator: false,
            onPageChanged: (index, reason) {
              context.read<BrowserImageManager>().changeIndex(context: context, currentIndex: index);
            }
        ),
        itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
            GestureDetector(
              onTap: zoomIn,
              child: BdImageBinder(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.sizedBox4,
                      vertical: size.sizedBox8
                  ),
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
                  imageUrl: '$baseUrl${imageList[index]}',
                  errUrl: defaultImg,
                  imageLabel: 'carousel'
              ),
            )
    );
  }
}



class _BottomAppbar extends StatelessWidget {
  final int imageListLength;
  final bool isExpand;
  final bool isGrid;
  final bool isDownload;
  final GestureTapCallback zoomIn;
  final GestureTapCallback zoomOut;
  final GestureTapCallback gridIn;
  final GestureTapCallback gridOut;
  final GestureTapCallback satback;
  final CommonSize size;
  const _BottomAppbar({
    required this.imageListLength,
    required this.isGrid,
    required this.isExpand,
    required this.isDownload,
    required this.zoomIn,
    required this.zoomOut,
    required this.gridIn,
    required this.gridOut,
    required this.satback,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.widthCommon,
      height: size.sizedBox50,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.sizedBox14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BdRippleIconsButton(
              size: size,
              backColor: Colors.transparent,
              onTap:
              isGrid
                  ? gridOut
                  : isExpand
                  ? zoomOut
                  :
                  () {
                context.read<BrowserImageManager>().closeDialog(context);
              },
              icon: Icons.arrow_back_ios,
              iconColor: yellow,
            ),
            const BdCustomPad(padEnum: PadEnum.width16),
            Expanded(
              child: isExpand || isGrid
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BdTextWidget(
                    text: isGrid ? '리스트'  : '확대 모드',
                    textStyle: bodyWhite,
                  )
                ],
              )
                  : Row(
                children: [
                  BdRippleIconsButton(
                    size: size,
                    backColor: Colors.transparent,
                    onTap: zoomIn,
                    icon: Icons.zoom_in,
                    iconColor: yellow,
                  ),
                  const BdCustomPad(padEnum: PadEnum.width16),
                  imageListLength <= 1
                      ? const SizedBox()
                      :
                  Row(
                    children: [
                      BdRippleIconsButton(
                        size: size,
                        backColor: Colors.transparent,
                        onTap: gridIn,
                        icon: Icons.grid_3x3,
                        iconColor: yellow,
                      ),
                      const BdCustomPad(padEnum: PadEnum.width16),
                      BdRippleIconsButton(
                        size: size,
                        backColor: Colors.transparent,
                        onTap: satback,
                        icon: Icons.accessibility,
                        iconColor: yellow,
                      ),
                      const BdCustomPad(padEnum: PadEnum.width16),
                    ],
                  ),
                  isDownload
                      ?  Row(
                    children: [
                      BdRippleIconsButton(
                        size: size,
                        backColor: Colors.transparent,
                        onTap: (){
                          context.read<BrowserImageManager>().downLoadImage(context);
                        },
                        icon: Icons.download,
                        iconColor: yellow,
                      ),
                      const BdCustomPad(padEnum: PadEnum.width16),
                    ],
                  )
                      : const SizedBox(),
                  Expanded(
                      child: _CurrentIndex(maxIndex: imageListLength, size: size,))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

class _CurrentIndex extends StatelessWidget {
  final int maxIndex;
  final CommonSize size;
  const _CurrentIndex({
    required this.maxIndex,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaBrowserImageBloc, BananaBrowserImageState, int>(
        selector: (state) => state.currentIndex,
        builder: (context, currentIndex) =>
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child:  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: BdTextWidget(
                        text: '${currentIndex+1}', textStyle: bodyWhite,
                      )
                  ),
                ),
                const Flexible(
                  child:  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: BdTextWidget(
                        text: '  /  ', textStyle: bodyWhite,)
                  ),
                ),
                Flexible(
                  child:  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: BdTextWidget(
                        text: '$maxIndex',
                        textStyle: bodyWhite,
                      )
                  ),
                ),
              ],
            )
    );
  }
}



