import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/naver_map_store_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/view/widgets/components/naver_map_positioned_icon_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/address_result/bd_text_address_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapBodyFixView extends StatelessWidget {
  final NaverMapStoreVO info;
  const NaverMapBodyFixView({super.key,
    required this.info
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Stack(
              children: [
                _Map(coordinate: info.coordinate),
                const NaverMapPositionedIconView()
              ],
            )
        ),
        _Explain(address: info.info.address,dong: info.info.subAddress,)
      ],
    );
  }
}


class _Map extends StatelessWidget {
  final GpsVO coordinate;
  const _Map({required this.coordinate});

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
              target: NLatLng(
                  coordinate.lat,
                  coordinate.lnt
              ),
              zoom: 17
          ),
          logoClickEnable: false,
          locationButtonEnable: false,
          mapType: NMapType.basic,
          tiltGesturesEnable: false,
          scrollGesturesEnable: false,
          zoomGesturesEnable: true,
          locale: const Locale('ko')
      ),
      forceGesture: true,
    );
  }
}

class _Explain extends StatelessWidget {
  final String address;
  final String dong;
  const _Explain({
    required this.address,
    required this.dong,
  });

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
          child: BdTextAddressResult(
              size: size,
              dong: dong, road: address),
        ),
      ),
    );
  }
}