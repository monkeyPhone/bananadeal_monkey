import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/manager/address_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/state/bloc/banana_address_bloc/banana_address_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/view/widgets/body/result/component/location_text.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_list_tile_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/address_result/bd_text_address_tile.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddressBodyResultView extends StatelessWidget {
  const AddressBodyResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Expanded(
              child: Center(child: _SrcResult())
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double height =
                    MediaQuery.of(context).viewInsets.bottom;
                return SizedBox(
                  height: height,
                );
              })
        ],
      ),
    );
  }
}


class _SrcResult extends StatelessWidget {
  const _SrcResult();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaAddressBloc, BananaAddressState>(
        builder: (BuildContext context, BananaAddressState state){
          if(state.addressSearch == ModelConfig.addressSearchEntity){
            return const _DefaultCase(false);
          }
          else if(state.addressSearch.results.juso.isEmpty) {
            return const _DefaultCase(true);
          }
          else if(state.addressVO.coordinate.lat != 0.0){
            return _LocationFinish(road: state.addressVO.address, dong: state.addressVO.dong, coordinate: state.addressVO.coordinate,);
          }
          else {
            if(MediaQuery.of(context).viewInsets.bottom > 0){
              return const _DefaultCase(false);
            }
            else{
              return _LocationList(entity: state.addressSearch, currentPage: state.currentPage, maxPage: state.maxPage,);
            }
          }
        }
    );
  }
}


class _LocationFinish extends StatelessWidget {
  final String road;
  final String dong;
  final GpsVO coordinate;
  const _LocationFinish({
    required this.road,
    required this.dong,
    required this.coordinate
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: EdgeInsets.all(size.sized16grid),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BdTextWidget(
            text: dong,
            textStyle: titleButtonBold,
          ),
          SizedBox(height: size.sizedBox10,),
          BdTextAddressTile(
              size: size,
              addInfo: road),
          SizedBox(height: size.sizedBox20,),
          BdRippleListTileButton(
              size: size,
              icon: Icons.delete_outline_outlined,
              text: '재설정',
              onTap: () {
                context.read<AddressManager>().initListChoice(context);
              }),
          SizedBox(height: size.sizedBox10,),
          !kIsWeb
              ? BdRippleListTileButton(
              size: size,
              icon: Icons.map_outlined,
              text: '지도에서 위치보기',
              onTap: () {
                context.read<AddressManager>().gotoNaverMapView(
                    context: context,
                    currentNat: (coordinate.lat, coordinate.lnt));
              }, )
              : const SizedBox()


        ],
      ),
    );
  }
}




class _DefaultCase extends StatelessWidget {
  final bool isFail;
  const _DefaultCase(this.isFail);

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.widthCommon,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFail ?
            Column(children: [
              const LocationTextBold( text: '앗, 검색 결과가 없어요!',),
              SizedBox(height: size.sizedBox20,),
            ],) : const SizedBox(),
            const LocationTextBold(text: '이렇게 검색해보세요'),
            SizedBox(height: size.sizedBox17,),
            const LocationTextBrown(text: '도로명 + 건물주소'),
            const LocationTextBrown(text: '지역명(동/리) + 건물명'),
            const LocationTextBrown(text: '지역명(동/리) + 번지'),
            SizedBox(height: size.sizedBox20,),
            const LocationTextGrey14(text: '예) 세종대로 209, 세종로 77-6, 용산 한성아파트'),

          ],
        ),
      ),
    );
  }
}



class _LocationList extends StatefulWidget {
  final AddressSearchEntity entity;
  final int currentPage;
  final int maxPage;
  const _LocationList({
    required this.entity,
    required this.currentPage,
    required this.maxPage
  });

  @override
  State<_LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<_LocationList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: size.sizedBox16,
              horizontal:size.sizedBox20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LocationTextBold(text: " 검색 결과",),
              Text("  ( ${widget.entity.results.common.totalCount}개, ${widget.currentPage}/${widget.maxPage} )",
                style: TextStyle(
                  fontSize: size.sizedBox16,
                  color: blackWrite,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        _List(entity: widget.entity, controller: _scrollController, size: size,),
        SizedBox(height: size.sizedBox16,),
      ],
    );
  }
}

class _List extends StatelessWidget {
  final AddressSearchEntity entity;
  final ScrollController controller;
  final CommonSize size;
  const _List({
    required this.entity,
    required this.controller,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: controller,
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: size.sizedBox20),
            controller: controller,
            itemCount: entity.results.juso.length,
            itemBuilder: (BuildContext context, int index){
              return _ListDetail(
                jibun: entity.results.juso[index].jibunAddr,
                road: entity.results.juso[index].roadAddr,
                onTap: () {
                  context.read<AddressManager>().clickList(
                    context: context,
                    juso: entity.results.juso[index],);
                }
                ,);
            }),
      ),
    );
  }
}


class _ListDetail extends StatelessWidget {
  final GestureTapCallback onTap;
  final String road;
  final String jibun;
  const _ListDetail({
    required this.onTap,
    required this.road,
    required this.jibun,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.sizedBox5,
            vertical: size.sizedBox8
        ),
        width: size.widthCommon,
        height: size.width03,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(width: size.sizedBox1_5, color: greyLine),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ListTile(text: '도로명', addInfo: road, size: size),
            _ListTile(text: ' 지번 ', addInfo: jibun, size :size)
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final String text;
  final String addInfo;
  final CommonSize size;
  const _ListTile({
    required this.text,
    required this.addInfo,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.sizedBox8, vertical: size.width00025),
              decoration: BoxDecoration(
                  border: Border.all(color: yellow, width: size.width00025),
                  borderRadius: BorderRadius.circular(size.sizedBox50)
              ),
              child: Text(text,
                style: TextStyle(fontSize: size.caption, color: brown, fontWeight:  FontWeight.w400
                ),
              ),
            ),
            SizedBox(width: size.sizedBox10),
            Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  strutStyle: StrutStyle(fontSize: size.sub),
                  text: TextSpan(
                      text:
                      addInfo,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.sub,
                      )),
                )
            ),
          ],
        )
    );
  }
}




