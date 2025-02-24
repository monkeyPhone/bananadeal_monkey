import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/crop_image_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/register/register_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/function/common_function.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/repository/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/manager/tab_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

part 'banana_info_user_event.dart';
part 'banana_info_user_state.dart';

class BananaInfoUserBloc extends Bloc<BananaInfoUserEvent, BananaInfoUserState> {
  final CommonRouteRepository _route;
  final RegisterRepository _repository;
  final BrowserSnackbar _snackBar;
  final TabManager _tabManager;

  EventTransformer<T> debounce<T>(Duration duration){
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  BananaInfoUserBloc({
    required CommonFunction commonFunction,
    required CommonRouteRepository route,
    required RegisterRepository repository,
    required BrowserSnackbar snackBar,
    required TabManager tabManager,
  }) :
        _route = route,
        _snackBar = snackBar,
        _tabManager = tabManager,
        _repository = repository, super(const BananaInfoUserState()) {
    on<BananaInfoUserFetchWidgetStatus>(_fetchWidgetStatus);
    on<BananaInfoUserFetchThumbNail>(_fetchThumbNail);
    on<BananaInfoUserFetchNickName>(_fetchNickName);
    on<BananaInfoUserCheckNickName>(_checkNickName);
    on<BananaInfoUserFetchCrop>(_fetchCrop);
    on<BananaInfoUserFetchAddress>(_fetchAddress);
    on<BananaInfoUserFetchFinish>(_fetchFinish);
    on<BackSpaceEvent>(_backSpaceEvent);
    on<OnTapEvent>(_onTapEvent);
    on<NavEvent>(_navEvent);
    on<WebCropEvent>(_webCropEvent);
    on<ThumbNailFetchEvent>(_thumbNailFetchEvent);
  }

  Future<void> _fetchWidgetStatus(BananaInfoUserFetchWidgetStatus event, Emitter<BananaInfoUserState> emit) async{
    emit(state.copyWith(infoStateEnum: event.infoStateEnum, isCrop: false));
  }

  Future<void> _fetchThumbNail(BananaInfoUserFetchThumbNail event, Emitter<BananaInfoUserState> emit) async{
    emit(state.copyWith(thumbnail: event.thumbnail));
  }

  Future<void> _fetchNickName(BananaInfoUserFetchNickName event, Emitter<BananaInfoUserState> emit) async{
    emit(state.copyWith(nickname: event.nickname, validate: event.validate, nickOk: false ));
  }

  Future<void> _checkNickName(BananaInfoUserCheckNickName event, Emitter<BananaInfoUserState> emit) async{
    await emit.forEach(_repository.streamCheckNick(nick: state.nickname),
        onData: (result) {
          final bool nickOk = switch(result.statusEnum){
            StatusEnum.success => true,
            _ => false
          };
          return state.copyWith(nickOk: nickOk,error: result.error);
        }
    );
  }

  Future<void> _fetchCrop(BananaInfoUserFetchCrop event, Emitter<BananaInfoUserState> emit) async{
    emit(state.copyWith(isCrop: !state.isCrop));
  }


  Future<void> _fetchAddress(BananaInfoUserFetchAddress event, Emitter<BananaInfoUserState> emit) async {
    emit(state.copyWith(addressVO: event.data,
        addressOk: event.data.address != '' && event.data.coordinate.lat != 0.0 && event.data.dong != ''
    ));
  }

  Future<void> _fetchFinish(BananaInfoUserFetchFinish event, Emitter<BananaInfoUserState> emit) async {
    // log('bloc: ${state.thumbnail}');
    await emit.forEach(_repository.streamUpdateInfo(
        thumb: state.thumbnail,
        nick: state.nickname,
        dong: state.addressVO.dong,
        road: state.addressVO.address,
        nat: (state.addressVO.coordinate.lat, state.addressVO.coordinate.lnt)
    ),
        onData: (result) => state.copyWith(error: result.error, isComplete: result.error == null)
    );
  }

  Future<void> _backSpaceEvent(BackSpaceEvent event, Emitter<BananaInfoUserState> emit) async{
    switch(state.isCrop){
      case true:
        add(const BananaInfoUserFetchCrop());
      case false:
        switch(state.infoStateEnum){
          case InfoUserStateEnum.profile:
            _route.closeAppDialog(event.context);
          case InfoUserStateEnum.location:
            add(const BananaInfoUserFetchWidgetStatus(InfoUserStateEnum.profile));
          case InfoUserStateEnum.finish:
            add(const BananaInfoUserFetchWidgetStatus(InfoUserStateEnum.location));
        }
    }
  }

  Future<void> _onTapEvent(OnTapEvent event, Emitter<BananaInfoUserState> emit) async{
    switch(state.infoStateEnum){
      case InfoUserStateEnum.profile:
        if(state.isCrop){
          add(const BananaInfoUserFetchCrop());
        }
      default:
    }
  }

  Future<void> _navEvent(NavEvent event, Emitter<BananaInfoUserState> emit) async{
    switch(state.infoStateEnum){
      case InfoUserStateEnum.profile:
        add(const BananaInfoUserFetchWidgetStatus(InfoUserStateEnum.location));
      case InfoUserStateEnum.location:
        add(const BananaInfoUserFetchWidgetStatus(InfoUserStateEnum.finish));
      case InfoUserStateEnum.finish:
        add(const BananaInfoUserFetchFinish());
    }
  }

  Future<void> _webCropEvent(WebCropEvent event, Emitter<BananaInfoUserState> emit) async{
    final XFile? image = await switch(event.isCamera){
      true =>  _repository.getCamera(),
      false => _repository.getGallery()
    };
    if(event.context.mounted){
      if(image != null){
        final CropImageVO crop = await _repository.cropImage(caseUpload: UploadEnum.userInfo, selectImagePath: image.path);
        if(event.context.mounted){
          if(crop.imageUrl != ''){
            add(BananaInfoUserFetchThumbNail(crop.imageUrl));
          }
          else{
            if(crop.msg != ''){
              _snackBar.showSnackBar(context: event.context, text: crop.msg);
            }
          }
        }
      }
    }
  }

  Future<void> _thumbNailFetchEvent(ThumbNailFetchEvent event, Emitter<BananaInfoUserState> emit) async{
    switch(event.index){
      case 1:
        switch(kIsWeb){
          case false:
            _tabManager.gotoUploadView(
                context: event.context,
                caseUpload: UploadEnum.userInfo,
                callBack: event.callBack);
          case true:
            add(WebCropEvent(context: event.context, isCamera: false));
        }
      case 2:
        switch(kIsWeb){
          case false:
            add(WebCropEvent(context: event.context, isCamera: true));
          case true:
            _snackBar.showSnackBar(text: '웹에서는 이용할 수 없는 기능입니다.', context: event.context);
        }
      case 3:
        add(const BananaInfoUserFetchThumbNail(''));
    }
  }


}
