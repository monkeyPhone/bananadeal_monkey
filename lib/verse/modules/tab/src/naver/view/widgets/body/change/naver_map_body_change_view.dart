import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/manager/naver_map_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/state/bloc/banana_naver_map/banana_naver_map_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/view/builder/selector/naver_map_loading_selector.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/view/widgets/components/naver_map_positioned_icon_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/address_result/bd_text_address_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapBodyChangeView extends StatelessWidget {
  final GpsVO? currentNat;
  const NaverMapBodyChangeView({super.key,
  this.currentNat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              _NaverMap(currentNat),
              const NaverMapIconSelector(),
              const NaverMapLoadingSelector()
            ],
          )
        ),
        const _NaverMapExplain()
      ],
    );
  }
}

class _NaverMap extends StatelessWidget {
  final GpsVO? currentNat;
  const _NaverMap(this.currentNat);

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Stack(
      children: [
        NaverMap(
          options: NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(
                  target: NLatLng(
                      currentNat!.lat,
                      currentNat!.lnt
                  ),
                  zoom: 17
              ),
              logoClickEnable: false,
              locationButtonEnable: false,
              mapType: NMapType.basic,
              locale: const Locale('ko')
          ),
          forceGesture: true,
          onMapReady: context.read<NaverMapManager>().onMapReady(context),
          onMapTapped: context.read<NaverMapManager>().onMapTapped(context),
          onCameraChange:  context.read<NaverMapManager>().onCameraChange(context),
          onCameraIdle:  context.read<NaverMapManager>().onCameraIdle(context),
        ),
        Positioned(
            right: size.sizedBox8,
            bottom: size.sizedBox8,
            child: BdRippleIconsButton(
                size: size,
                onTap: () {
                  context.read<NaverMapManager>().initPosition(context: context, currentNat: (currentNat!.lat, currentNat!.lnt), zoom: 17);
                },
                iconSize: size.sizedBox40,
                backColor: Colors.white70,
                icon: Icons.location_on,
                iconColor: Colors.redAccent
            )
        )
      ],
    );
  }
}

class _NaverMapExplain extends StatelessWidget {
  const _NaverMapExplain();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: EdgeInsets.all(
          size.sized16grid
      ),
      child: SizedBox(
        width: size.widthCommon,
        height: size.sizedBox110,
        child: SingleChildScrollView(
          child: BlocSelector<BananaNaverMapBloc, BananaNaverMapState, AddressVO>(
            selector: (state) => state.addressVO,
            builder: (context, addressVO) =>
                BdTextAddressResult(
                    size: size,
                    dong: addressVO.dong, road: addressVO.address),
          ),
        ),
      ),
    );
  }
}


