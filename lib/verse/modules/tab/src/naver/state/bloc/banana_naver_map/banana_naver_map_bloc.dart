import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/naver_map/naver_map_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:rxdart/rxdart.dart';

part 'banana_naver_map_event.dart';
part 'banana_naver_map_state.dart';

class BananaNaverMapBloc extends Bloc<BananaNaverMapEvent, BananaNaverMapState> {
  final NaverMapRepository _repository;
  late final NaverMapController _controller;

  EventTransformer<T> debounce<T>(Duration duration){
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  BananaNaverMapBloc({
    required NaverMapRepository repository
  }) : _repository = repository, super(const BananaNaverMapState()) {
    on<OnMapReady>(_onMapReady);
    on<OnMapTap>(_onMapTap);
    on<CameraChange>(_cameraChange);
    on<CameraFinish>(_cameraFinish);
    on<InitPosition>(_initPosition);
    on<Dispose>(_dispose);
  }

  Future<void> _onMapReady(OnMapReady event, Emitter<BananaNaverMapState> emit) async {
    _controller = event.controller;
    await _controller.setLocationTrackingMode(NLocationTrackingMode.none);
    await _controller.getLocationTrackingMode();
    emit(state.copyWith(isInit: true));
    add(const CameraFinish());
  }


  Future<void> _onMapTap(OnMapTap event, Emitter<BananaNaverMapState> emit) async {
    _controller.updateCamera(
        NCameraUpdate.withParams(target: event.latLng)
    );
  }

  Future<void> _cameraChange(CameraChange event, Emitter<BananaNaverMapState> emit) async{
    emit(state.copyWith(isMove: true, addressVO: ModelConfig.addressVO));
  }

  Future<void> _cameraFinish(CameraFinish event, Emitter<BananaNaverMapState> emit) async{
    emit(state.copyWith(isMove: false));
    final NCameraPosition position = await _controller.getCameraPosition();
    await emit.forEach(_repository.makePlace(coordinate: GpsVO(lat: position.target.latitude, lnt: position.target.longitude)),
        onData: (result) => state.copyWith(
            addressVO: result.$2
            , next: result.$1
        )
    );
  }

  Future<void> _initPosition(InitPosition event, Emitter<BananaNaverMapState> emit) async {
    await _controller.updateCamera(
        NCameraUpdate.withParams(
            target: NLatLng(
                event.currentNat.$1,
                event.currentNat.$2
            ),
            zoom: event.zoom
        )
    );
  }

  Future<void> _dispose(Dispose event, Emitter<BananaNaverMapState> emit) async{
    _controller.dispose();
  }




  @override
  Future<void> close() {
    // TODO: implement close
    add(const Dispose());
    return super.close();
  }

}
