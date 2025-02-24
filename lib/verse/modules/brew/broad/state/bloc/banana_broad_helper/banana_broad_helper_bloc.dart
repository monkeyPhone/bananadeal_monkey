import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/broad/broad_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/repository/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/data/user_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/manager/tab_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_broad_helper_event.dart';
part 'banana_broad_helper_state.dart';

class BananaBroadHelperBloc extends Bloc<BananaBroadHelperEvent, BananaBroadHelperState> {
  final BroadRepository _repository;
  final CommonRouteRepository _route;
  final BrowserSnackbar _snackbar;
  final CommonUrl _url;
  final TabManager _tab;
  BananaBroadHelperBloc({
    required BroadRepository repository,
    required CommonRouteRepository route,
    required BrowserSnackbar snackbar,
    required CommonUrl url,
    required TabManager tab,
  }) : _repository = repository,
        _route = route,
        _snackbar = snackbar,
        _url = url,
        _tab = tab,
        super(BananaBroadHelperState()) {
    on<UpdateUserEvent>(_updateUserEvent);
    on<LaunchUrlEvent>(_launchUrlEvent);
    on<MapEvent>(_mapEvent);
    on<GotoBannerEvent>(_gotoBannerEvent);
    on<CarouselTapEvent>(_carouselTapEvent);
  }

  Future<void> _updateUserEvent(UpdateUserEvent event, Emitter<BananaBroadHelperState> emit) async{
    final StatusEnum result = await _repository.updateUser(dataMap: event.dataMap);
    if(event.context.mounted){
      switch(result){
        case StatusEnum.token:
          _route.logout(
              context: event.context,
              idx: event.idx,
              how: true
          );
        case StatusEnum.success:
          _route.updateInfo(event.context);
          _route.closeDialog(event.context);
        default:
          _snackbar.showSnackBar(context: event.context, text: '잠시 후, 다시 시도해주세요.');
      }
    }
  }

  Future<void> _launchUrlEvent(LaunchUrlEvent event, Emitter<BananaBroadHelperState> emit) async {
    final bool result = await _url.launchInBrowser(url: event.url);
    if(!result){
      if(event.context.mounted){
        _snackbar.showSnackBar(context: event.context, text: 'URL 주소가 만료되었습니다.');
      }
    }
  }


  Future<void> _mapEvent(MapEvent event,  Emitter<BananaBroadHelperState> emit) async{
    _tab.mapBottomSheet(
      context: event.context,
        userVO: event.userVO,
      addressCallback: event.addressCallback,
      rangeCallback: event.rangeCallback
    );

  }


  Future<void> _gotoBannerEvent(GotoBannerEvent event, Emitter<BananaBroadHelperState> emit) async {
    _tab.gotoBannerView(
        context: event.context,
        banner: event.banner
    );
  }

  Future<void> _carouselTapEvent(CarouselTapEvent event, Emitter<BananaBroadHelperState> emit) async{
    if(event.banner != null){
      switch(event.banner!.bmCategory){
        case 'URL':
          add(LaunchUrlEvent(
              url: event.banner!.bmUrl,
              context: event.context
          ));
        case '':
          null;
        default:
          add(GotoBannerEvent(context: event.context, banner: event.banner!));
      }
    }
  }

}
