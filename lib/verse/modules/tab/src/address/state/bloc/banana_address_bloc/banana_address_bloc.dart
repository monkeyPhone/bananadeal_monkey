import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/address/address_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/repository/route_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_address_event.dart';
part 'banana_address_state.dart';

class BananaAddressBloc extends Bloc<BananaAddressEvent, BananaAddressState> {
  final AddressRepository _repository;
  final CommonRouteRepository _route;
  BananaAddressBloc({
    required AddressRepository repository,
    required CommonRouteRepository route,
  }) : _repository = repository,
        _route = route,

        super(const BananaAddressState()) {

    on<InitAddress>(_initAddress);
    on<FetchAddress>(_fetchAddress);
    on<FetchPage>(_fetchPage);
    on<FetchLocation>(_fetchLocation);
    on<BackSpaceEvent>(_backSpaceEvent);
  }


  Future<void> _initAddress(InitAddress event,  Emitter<BananaAddressState> emit) async{
    emit(state.copyWith(addressSearch: ModelConfig.addressSearchEntity, search: '', addressVO: ModelConfig.addressVO, currentPage: 0, maxPage: 0));
  }

  Future<void> _fetchAddress(FetchAddress event, Emitter<BananaAddressState> emit) async{
    await emit.forEach(
        _repository.fetchAddress(search: event.search, currentPage: event.currentPage),
        onData: (result) => state.copyWith(addressSearch: result, search: event.search,
            currentPage: event.currentPage,
            maxPage: (int.parse(result.results.common.totalCount)/20).ceil())
    );
  }

  Future<void> _fetchPage(FetchPage event, Emitter<BananaAddressState> emit) async{
    emit(state.copyWith(currentPage: event.currentPage));
    await emit.forEach(
        _repository.fetchAddress(search: state.search, currentPage: state.currentPage),
        onData: (result) => state.copyWith(addressSearch: result, maxPage: (int.parse(result.results.common.totalCount)/20).ceil())
    );
  }

  Future<void> _fetchLocation(FetchLocation event, Emitter<BananaAddressState> emit) async{
    emit(state.copyWith(addressVO: event.data));
  }

  Future<void> _backSpaceEvent(BackSpaceEvent event, Emitter<BananaAddressState> emit) async {
    if(state.addressVO != ModelConfig.addressVO){
      add(const FetchLocation(data: ModelConfig.addressVO));
    }
    else if(state.search != ''){
      add(const InitAddress());
    }
    else{
      _route.closePage(event.context);
    }
  }



}
