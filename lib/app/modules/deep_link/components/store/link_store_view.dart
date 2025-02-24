import 'package:banana_deal_by_monkeycompany/app/modules/deep_link/components/store/guest_store_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/carousel/src/_flutter_carousel_widget.dart';
import '../../../../components/carousel/src/enums/center_page_enlarge_strategy.dart';
import '../../../../components/carousel/src/helpers/carousel_options.dart';
import '../../../../components/image_provider/asset_image_box.dart';
import '../../../../components/image_provider/image_provider_state.dart';
import '../../../../components/image_provider/image_providers.dart';
import '../../../../components/loading.dart';
import '../../../../css/app_basic_component/bagic_canvas.dart';
import '../../../../css/app_basic_component/basic_app_bar.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../../../../routes/api_url.dart';
import '../../../../routes/const_element.dart';
import '../../../src/styles/image_data.dart';
import '../../controllers/deep_link_store_controller.dart';
import 'guest_store_profile.dart';

class LinkStoreView extends GetView<DeepLinkStoreController> {
  final int idx;
  const LinkStoreView({
    super.key,
    required this.idx});

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            _appBar(context),
            Expanded(
                child: FutureBuilder(
                    future: controller.getDetail(smIdx: idx),
                    builder:
                        (BuildContext contexts, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData ) {
                        print('snapshot.hasdata == false');
                        return Loading2(text: '잠시만 기다려주세요',);
                      } else if (snapshot.hasError) {
                        print('snapshot.hasdata has error');
                        return Loading2(text: '잠시만 기다려주세요',);
                      } else {

                        return _body(context);
                      }
                    }
                    )
            )
          ],
        )
    );
  }

  Widget _appBar(BuildContext context){
    return BasicAppbar(
        title: Text('매장 상세보기',
          style: TextStyle(
              color: Style.blackWrite,
              fontWeight: FontWeight.w700,
              fontSize: WidgetSize(context).sizedBox24
          ),
        )
    );
  }

  Widget _body(BuildContext context){
    return GetBuilder<DeepLinkStoreController>(
        builder: (sdC) {
          return Scrollbar(
            thumbVisibility: true,
            controller: sdC.scrollController,
            child: ListView(
              padding: WidgetSize(context).paddingBodyWhole,
              physics: const ClampingScrollPhysics(),
              controller:  sdC.scrollController,
              children: [
                Column(
                  children: [
                    switch(sdC.storeDetail.value.smPathImg0){
                      '' =>
                          _defaultImageArea(context),
                      _ =>
                          Stack(
                            children: [
                              _carouselArea(sdC.storePreView),
                              Positioned(
                                bottom: WidgetSize(context).height001,
                                right: WidgetSize(context).width003,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Style.blackWrite.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(WidgetSize(context).widthCommon)
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: WidgetSize(context).sizedBox4, horizontal: WidgetSize(context).sizedBox8),
                                  child: Text(
                                    '${sdC.current.value+1}/${sdC.storePreView.where((element) => element != '').length}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: WidgetSize(context).sizedBox14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    },

                    SizedBox(height: WidgetSize(context).sizedBox25,),

                    GuestStoreProfile(),

                    SizedBox(height: WidgetSize(context).sizedBox15,),

                    //buttonBar 추가하면 여기에 넣어야됨
                    GuestStoreButtonBar(idx: idx),

                    SizedBox(height: WidgetSize(context).sizedBox16,),

                    //홈
                    Container(
                      width: WidgetSize(context).widthCommon,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _storeHomeIntro(sdC.storeDetail.value.smStoreIntroduce, context),
                          SizedBox(height: WidgetSize(context).sizedBox39,),
                          _storeHomeEvent(sdC.storeIcon, controller.storeEvent, context),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
    );
  }

  Widget _defaultImageArea(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).sizedBox222,
      child: ClipRRect(
          child: Stack(
            children: <Widget>[
              AssetImageBox(
                  imageHeight: WidgetSize(context).heightCommon,
                  imageWidth: WidgetSize(context).widthCommon,
                  imageUrl: AppElement.defaultStore
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: WidgetSize(context).widthCommon,
                  height: WidgetSize(context).sizedBox222,
                  decoration: BoxDecoration(
                    color: Style.blackWrite.withOpacity(0.5),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: WidgetSize(context).sizedBox4, horizontal: WidgetSize(context).sizedBox8),
                  child: Center(
                    child: Text(
                      '해당 매장의 대표 이미지가 없습니다.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: WidgetSize(context).sizedBox17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }


  Widget _carouselArea(List list){
    return FlutterCarousel.builder(
        itemCount: list.length,
        options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: list.length != 1,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            controller: controller.cController,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            pauseAutoPlayOnTouch: true,
            pauseAutoPlayOnManualNavigate: true,
            pauseAutoPlayInFiniteScroll: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            disableCenter: true,
            showIndicator: false,
            onPageChanged: (index, reason) {
              controller.pageCanged(index);
            }
        ),
        itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
            GestureDetector(
              onTap: (){
                Get.dialog(
                    GestureDetector(
                      onTap: Get.back,
                      child: InteractiveViewer(
                          maxScale: 2.5,
                          minScale: 0.8,
                          constrained: false,
                          child: ClipRRect(
                              child:
                              ImageProviderState(
                                  imageWidth:  WidgetSize(context).widthCommon, imageHeight: WidgetSize(context).heightCommon,
                                  imageUrl: ApiConsole.imageBananaUrl+list[index], errUrl: AppElement.defaultImg,   aspectRatio: AppElement.caseDialog)
                          )
                      ),
                    ));
              },
              child: ClipRRect(
                  child: Stack(
                    children: <Widget>[
                      ImageProviders(
                          imageWidth: WidgetSize(context).widthCommon,
                          imageHeight: WidgetSize(context).widthCommon9_16,
                          imageUrl: ApiConsole.imageBananaUrl+list[index],
                          errUrl: AppElement.defaultImg,
                          imageLabel: AppElement.caseOther
                      )
                    ],
                  )),
            )
    );
  }



  Widget _storeHomeIntro(String storeIntro, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('매장 소개', style: TextStyle(
            fontSize: WidgetSize(context).sizedBox18,
            fontWeight: FontWeight.w700
        ),),
        SizedBox(height: WidgetSize(context).sizedBox8,),
        Text(
          storeIntro == ''
              ? '등록된 매장 소개글이 없습니다.'
              : storeIntro,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: WidgetSize(context).sizedBox14
          ),
        ),
      ],
    );
  }

  Widget _storeHomeEvent(storeIcon, storeEvent, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '매장 이벤트',
          style: TextStyle(
            fontSize: WidgetSize(context).sizedBox18,
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: WidgetSize(context).sizedBox5,),

        storeEvent.isEmpty
            ?
        Center(
          child: SizedBox(
            width: WidgetSize(context).width09,
            height: WidgetSize(context).height60px,
            child: Card(
              elevation: WidgetSize(context).sizedBox4,
              surfaceTintColor: Style.white,
              child: Center(
                child: Text('해당 매장에서 진행중인 이벤트가 없습니다.',
                  style: TextStyle(
                      color: Style.ultimateGrey,
                      fontSize: WidgetSize(context).width004,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ),
        )
            :
        _storeHomeEventList(storeIcon ,storeEvent, context),

      ],
    );
  }

  Widget _storeHomeEventList(storeIcon, storeEvent, BuildContext context){
    return Column(
      children: List.generate(3, (index) =>
      storeEvent[index] == '' &&  storeIcon[index] == ''
          ?
      SizedBox()
          :
      Column(
        children: [
          Card(
            elevation: WidgetSize(context).sizedBox4,
            surfaceTintColor: Style.white,
            child: InkWell(
              onTap: (){},
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: WidgetSize(context).height60px,
                  maxHeight: double.infinity,
                  minWidth: WidgetSize(context).width0921,
                  maxWidth: WidgetSize(context).width0921,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: WidgetSize(context).width00234,),
                  child: Row(
                    children: [
                      SizedBox(width: WidgetSize(context).chatBoxPadding,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child:
                        Container(
                            padding: EdgeInsets.all(WidgetSize(context).sizedBox1),
                            color: Style.white,
                            child:
                            storeIcon[index] == ''
                                ?
                            ImageData2('assets/images/icons/store/3.svg', WidgetSize(context).sizedBox34+WidgetSize(context).sizedBox5)
                                :
                            ImageData2('assets/images/icons/store/${storeIcon[index]}.svg', WidgetSize(context).sizedBox34+WidgetSize(context).sizedBox5)
                        ),

                      ),
                      SizedBox(width: WidgetSize(context).width0021,),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: WidgetSize(context).chatMaxWidth075
                        ),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text:
                            storeEvent[index] == '' ? '' : storeEvent[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: WidgetSize(context).sizedBox18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: WidgetSize(context).sizedBox15,)
        ],
      )).toList(),
    );
  }

}