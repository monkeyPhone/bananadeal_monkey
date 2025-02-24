import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/state/bloc/banana_naver_map/banana_naver_map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapManager {
  final void Function(AddressVO addressVO) callBack;

  const NaverMapManager({
    required this.callBack,
  });

  void Function(NaverMapController controller) onMapReady(
      BuildContext context
  ) => (NaverMapController controller){
    context.read<BananaNaverMapBloc>().add(OnMapReady(controller: controller));
  };

  void Function(NPoint point, NLatLng latLng) onMapTapped(BuildContext context)
    => (NPoint point, NLatLng latLng){
      context.read<BananaNaverMapBloc>().add(OnMapTap(latLng: latLng));
    };

  void Function(NCameraUpdateReason reason, bool animated) onCameraChange(BuildContext context)
    => (NCameraUpdateReason reason, bool animated){
      context.read<BananaNaverMapBloc>().add(const CameraChange());
    };

  void Function() onCameraIdle(BuildContext context)
    => (){
      context.read<BananaNaverMapBloc>().add(const CameraFinish());
    };

  void initPosition({
    required BuildContext context,
    required (double, double) currentNat,
    required double zoom
  }) => context.read<BananaNaverMapBloc>().add(InitPosition(currentNat: currentNat, zoom: zoom));

  void closePage(BuildContext context) => context.read<VerseConfig>().route.closePage(context);


  void showSnackBar({
    required BuildContext context,
    required String text,
  }) => context.read<VerseConfig>().browser.snackBar.showSnackBar(text: text, context: context);


  void setAddress({
    required BuildContext context,
    required AddressVO data
  }){
    callBack(data);
    closePage(context);
  }

}